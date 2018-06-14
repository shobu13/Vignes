# -*- coding: utf-8 -*-

from django.shortcuts import render, HttpResponse, redirect
from django.http import JsonResponse

from magasin.models import SousCategorie, Categorie, Produit
from utility import checker


def get_sous_cat(request):
    # return render(request, 'magasin/magasin_home.html')
    sous_categories = []
    # json data est maintenant au format JSON et pret à etre envoyé au client
    try:
        sous_categories_raw = SousCategorie.objects.filter(
            categorie=Categorie.objects.get(nom=request.GET['categorie']))
        for i in sous_categories_raw:
            sous_categories.append([i.id, i.nom])
        return JsonResponse({"HTTPRESPONSE": 'ok', 'sous_categorie': sous_categories},
                            content_type="application/json")
    except:
        return JsonResponse({"HTTPRESPONSE": 'erreur'}, content_type="application/json")


def add_cart(request):
    id_produit = request.GET['id']
    try:
        produits = request.session['produits']
        print("le dictionnaire existe")
    except KeyError:
        print("creation du dictionnaire")
        request.session['produits'] = {}
        produits = request.session['produits']

    if id_produit in produits:
        produits[id_produit] += 1
    else:
        produits[id_produit] = 1

    total_produit = len(produits)
    request.session['produits'] = produits
    request.session['total'] = total_produit
    return JsonResponse({"HTTPRESPONSE": 'ok', "total": total_produit},
                        content_type="application/json")


def clear_cart(request):
    request.session['produits'] = {}
    request.session['total'] = 0
    request.session['id_commande'] = None
    return JsonResponse({"HTTPRESPONSE": 'ok'}, content_type="application/json")


# non ajax view
def supr_cart(request):
    produits = request.session['produits']
    id = request.GET['id']
    del (produits[id])
    request.session['produits'] = produits
    total_produit = len(produits)
    request.session['total'] = total_produit
    print('total=', total_produit)
    return JsonResponse({"HTTPRESPONSE": 'ok', 'total': total_produit}, content_type="application/json")
    # return redirect('magasinPanier')


def get_cat(request):
    cat_produit_liste = []
    cat_produit_liste_raw = Categorie.objects.all()
    for cat_produit in cat_produit_liste_raw:
        cat_produit_liste.append((cat_produit.id, cat_produit.nom))
    return JsonResponse({"HTTPRESPONSE": 'ok', "liste_cat": cat_produit_liste},
                        content_type="application/json")


def call_checker(request):
    checker.session_variable_check(request)
    return JsonResponse({"HTTPRESPONSE": 'ok', }, content_type="application/json")


def get_product_name_by_id(request):
    id_produit = request.GET.get('id_produit')
    produit = Produit.objects.get(id=id_produit)
    print('prdouit_nom= ', produit.nom)
    return JsonResponse({"HTTPRESPONSE": 'ok', 'produit_nom': produit.nom}, content_type="application/json")
