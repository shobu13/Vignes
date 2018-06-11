# coding: utf-8
from django.shortcuts import render, HttpResponse, reverse
from django.views.decorators.csrf import csrf_exempt

from magasin.models import Produit
from vignes import settings
from magasin.models import Commande, ContenuCommande, Client, Categorie
from ajax.views import clear_cart

from paypal.standard.forms import PayPalPaymentsForm


def home(request, id_cat_produit):
    cat_produit = Categorie.objects.get(id=id_cat_produit)
    liste_produit = Produit.objects.filter(categorie=cat_produit)
    return render(request, 'magasin/magasin_home.html', locals())


def panier(request):
    user_cart = request.session['produits']
    user_cart_final = []
    for commande in user_cart.items():
        produit = Produit.objects.get(id=commande[0])
        user_cart_final.append((produit, commande[1], commande[1] * produit.prix))
    return render(request, 'magasin/magasin_panier.html', locals())


def resume_commande(request):
    user_cart = request.session['produits']
    user_cart_final = []
    total = 0
    for commande in user_cart.items():
        produit = Produit.objects.get(id=commande[0])
        user_cart_final.append((produit, commande[1], commande[1] * produit.prix))
        total += commande[1] * produit.prix

    commande = Commande()
    commande.montant = total
    commande.envoie = True
    commande.client = Client.objects.get(nom='LELU')
    commande.save()

    for produit in user_cart_final:
        contenu_commande = ContenuCommande()
        contenu_commande.commande = commande
        contenu_commande.produit = produit[0]
        contenu_commande.quantite = produit[1]
        contenu_commande.save()
    request.session['id_commande'] = commande.id

    return render(request, 'magasin/magasin_resume_commande.html', locals())


@csrf_exempt
def payement_commande(request):
    user_cart = request.session['produits']
    total = 0
    nom_commande = ""
    for commande in user_cart.items():
        produit = Produit.objects.get(id=commande[0])
        total += commande[1] * produit.prix
        nom_commande += produit.nom + "; "
    paypal_dict = {
        'business': settings.PAYPAL_RECEIVER_EMAIL,
        'amount': total,
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
    clear_cart(request)
    request.session['id_commande'] = None
    return render(request, 'magasin/magasin_payement_ok.html')


def payement_commande_error(request):
    commande = Commande.objects.get(id=request.session['id_commande'])
    contenu_commande_liste = ContenuCommande.objects.filter(commande=commande)
    contenu_commande_liste.delete()
    commande.delete()
    return render(request, 'magasin/magasin_payement_erreur.html')
