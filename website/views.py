from django.shortcuts import render, HttpResponse, reverse

from magasin.models import Produit

from vignes import settings
from magasin.models import Commande, ContenuCommande, Client


def home(request):
    liste_produit = Produit.objects.all()
    print(liste_produit)
    return render(request, 'website/website_home.html', locals())


def panier(request):
    user_cart = request.session['produits']
    user_cart_final = []
    for commande in user_cart.items():
        produit = Produit.objects.get(id=commande[0])
        user_cart_final.append((produit, commande[1], commande[1] * produit.prix))
    print(user_cart_final)
    return render(request, 'website/website_panier.html', locals())


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

    return render(request, 'website/website_resume_commande.html', locals())


def payement_commande(request):
    pass
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
        'return_url': 'http://{}{}'.format(request.get_host(), reverse('magasin:payement-done')),
        'cancel_return': 'http://{}{}'.format(request.get_host(), reverse('magasin:payement-canceled')),
    }#https://www.youtube.com/watch?v=Z5dBopZWOzo
    return render(request, 'website/website_payement_commande.html', locals())
