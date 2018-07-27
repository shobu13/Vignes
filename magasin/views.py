# coding: utf-8
from django.shortcuts import render, HttpResponse, reverse
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator

from vignes import settings
from magasin.models import Produit
from magasin.models import Commande, ContenuCommande, Categorie, Marque, SousCategorie, FraisDePort
from magasin.forms import ListForm
from ajax.views import clear_cart

from paypal.standard.forms import PayPalPaymentsForm


def home(request, id_cat_produit, page=1):
    request.session['reset_filter'] = False
    nb_column = 3
    nb_row = 1
    nb_col_css = 4
    baked_liste_produit = []
    prix_produit_liste = []
    prix_max = None
    prix_min = None
    cat_produit = Categorie.objects.get(id=id_cat_produit)
    sous_categorie_liste = SousCategorie.objects.filter(categorie=cat_produit)
    marque_liste = Marque.objects.all()
    liste_produit = Produit.objects.filter(categorie=cat_produit)
    for produit in liste_produit:
        prix_produit_liste.append(produit.prix)
    prix_max = int(max(prix_produit_liste))
    prix_min = int(min(prix_produit_liste))
    if request.method == 'POST':
        request.session['filtre_sous_cat_id'] = int(request.POST.get('filtre_sous_cat'))
        request.session['filtre_marque_id'] = int(request.POST.get('filtre_marque'))
        request.session['filtre_prix'] = int(request.POST.get('filtre_prix'))
        if request.POST.get('reset'):
            request.session['filtre_sous_cat_id'] = -1
            request.session['filtre_marque_id'] = -1
            request.session['filtre_prix'] = -1
    if request.session['filtre_sous_cat_id'] is not None and request.session['filtre_marque_id'] is not None and \
            request.session['filtre_prix'] is not None:
        if request.session['filtre_sous_cat_id'] != -1:
            filtre_sous_cat = SousCategorie.objects.get(id=request.session['filtre_sous_cat_id'])
            liste_produit = liste_produit.filter(sous_categorie=filtre_sous_cat)
        if request.session['filtre_marque_id'] != -1:
            filtre_marque = Marque.objects.get(id=request.session['filtre_marque_id'])
            liste_produit = liste_produit.filter(marque=filtre_marque)
        print("min, max=", prix_min, prix_max)
        if request.POST.get('reset'):
            request.session['filtre_prix'] = prix_max
        liste_produit = liste_produit.filter(prix__lte=request.session['filtre_prix'])
    for i in range(0, len(liste_produit), nb_column):
        baked_liste_produit += [liste_produit[i:i + nb_column]]
    liste_produit_pagifier = Paginator(baked_liste_produit, nb_row)
    liste_produit = liste_produit_pagifier.page(page)
    has_previous = liste_produit.has_previous()
    has_next = liste_produit.has_next()
    if has_next:
        next_page_number = liste_produit.next_page_number()
    if has_previous:
        previous_page_number = liste_produit.previous_page_number()
    liste_produit = liste_produit.object_list
    return render(request, 'magasin/magasin_home.html', locals())


def panier(request):
    user_cart = request.session['produits']
    user_cart_final = []
    sous_stock = False
    for commande in user_cart.items():
        produit = Produit.objects.get(id=commande[0])
        user_cart_final.append((produit, commande[1], commande[1] * produit.prix))
        if commande[1] > produit.stock:
            sous_stock = True
    return render(request, 'magasin/magasin_panier.html', locals())


def resume_commande(request):
    user_cart = request.session['produits']
    user_cart_final = []
    total = 0
    poid = 0
    for commande in user_cart.items():
        produit = Produit.objects.get(id=commande[0])
        user_cart_final.append((produit, commande[1], commande[1] * produit.prix))
        total += commande[1] * produit.prix
        poid += produit.poid * commande[1]
    poid = poid / 1000
    tarification = FraisDePort.objects.get(poid_min__lte=poid, poid_max__gte=poid)
    commande = Commande()
    commande.montant = total
    commande.envoie = True
    commande.client = request.user
    commande.frais_port = tarification
    commande.save()

    for produit in user_cart_final:
        contenu_commande = ContenuCommande()
        contenu_commande.commande = commande
        contenu_commande.produit = produit[0]
        contenu_commande.quantite = produit[1]
        contenu_commande.save()
    request.session['id_commande'] = commande.id

    total += tarification.tarification
    return render(request, 'magasin/magasin_resume_commande.html', locals())


@csrf_exempt
def payement_commande(request):
    user_cart = request.session['produits']
    total = 0
    nom_commande = ""
    frais_port = Commande.objects.get(id=request.session['id_commande']).frais_port.tarification
    for commande in user_cart.items():
        produit = Produit.objects.get(id=commande[0])
        total += commande[1] * produit.prix
        nom_commande += produit.nom + "; "
    paypal_dict = {
        'business': settings.PAYPAL_RECEIVER_EMAIL,
        'amount': total + frais_port,
        'item_name': nom_commande,
        'invoice': str(request.session['id_commande']),
        'currency_code': 'EUR',
        'notify_url': 'http://{}{}'.format(request.get_host(), reverse('paypal-ipn')),
        'return_url': 'http://{}{}'.format(request.get_host(), reverse('payementCommandeOk')),
        'cancel_return': 'http://{}{}'.format(request.get_host(),
                                              reverse('payementCommandeError')),
    }
    form = PayPalPaymentsForm(initial=paypal_dict)
    return render(request, 'magasin/magasin_payement_commande.html', locals())


def payement_commande_ok(request):
    commande = Commande.objects.get(id=request.session['id_commande'])
    commande.est_payee = True
    commande.save()
    user_cart = request.session['produits']
    for commande in user_cart.items():
        produit = Produit.objects.get(id=commande[0])
        produit.stock -= commande[1]
        produit.save()
    clear_cart(request)
    request.session['id_commande'] = None
    return render(request, 'magasin/magasin_payement_ok.html')


def payement_commande_error(request):
    commande = Commande.objects.get(id=request.session['id_commande'])
    contenu_commande_liste = ContenuCommande.objects.filter(commande=commande)
    contenu_commande_liste.delete()
    commande.delete()
    return render(request, 'magasin/magasin_payement_erreur.html')


def details_produit(request, id_produit):
    produit = Produit.objects.get(id=id_produit)
    return render(request, 'magasin/magasin_detail_produit.html', locals())


def liste_produits(request):
    form = ListForm(request.POST or None)
    sous_cat = None
    produits = None
    if form.is_valid():
        sous_cat = form.cleaned_data['sous_categorie']
    if sous_cat:
        produits = Produit.objects.filter(sous_categorie=sous_cat).filter(maj=False)
    return render(request, 'magasin/magasin_liste_produits.html', locals())
