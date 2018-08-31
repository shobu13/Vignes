# -*- coding: utf-8 -*-

from django.shortcuts import render, HttpResponse, redirect
from django.http import JsonResponse

from magasin.models import SousCategorie, Categorie, Produit, TypesProduit
from utility import checker
from event.models import Event


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
    return JsonResponse({"HTTPRESPONSE": 'ok', 'total': total_produit},
                        content_type="application/json")
    # return redirect('magasinPanier')


def get_cat(request):
    cat_produit_liste = []
    type = request.GET.get('type')
    cat_produit_liste_raw = TypesProduit.objects.get(nom__contains=type).categories.all()
    for cat_produit in cat_produit_liste_raw:
        try:
            cat_produit.produit_set.all()[0]
            cat_produit_liste.append((cat_produit.id, cat_produit.nom))
        except:
            pass
    return JsonResponse({"HTTPRESPONSE": 'ok', "liste_cat": cat_produit_liste},
                        content_type="application/json")


def call_checker(request):
    checker.session_variable_check(request)
    return JsonResponse({"HTTPRESPONSE": 'ok', }, content_type="application/json")


def get_product_name_by_id(request):
    id_produit = request.GET.get('id_produit')
    produit = Produit.objects.get(id=id_produit)
    return JsonResponse({"HTTPRESPONSE": 'ok', 'produit_nom': produit.nom},
                        content_type="application/json")


def reset_filter(request):
    try:
        request.session['reset_filter']
    except:
        request.session['reset_filter'] = True
    if request.session['reset_filter']:
        print("RESET FILTER")
        request.session['filtre_sous_cat_id'] = None
        request.session['filtre_marque_id'] = None
        request.session['filtre_prix'] = None
        return JsonResponse({"HTTPRESPONSE": 'reset', }, content_type="application/json")
    else:
        request.session['reset_filter'] = True
        return JsonResponse({"HTTPRESPONSE": 'no_reset', }, content_type="application/json")


def get_event_by_year_and_month(request):
    year = request.GET.get('year')
    month = request.GET.get('month')
    data = {"HTTPRESPONSE": 'ok', 'event_list': {}}
    event_list = Event.objects.filter(date__year=year, date__month=month)
    for event in event_list:
        if len(event.description.split(" ")) > 100:
            description = event.description.split(" ")[0:100] + "..."
        else:
            description = event.description
        event_data = {
            'id': event.id,
            'nom': event.nom,
            'description': description,
            'lieu': event.lieu,
            'date': event.date.strftime('%d/%m/%Y'),
            'heure': event.heure.strftime('%H:%M'),
            'type_nom': event.type.nom
        }
        data['event_list'][event.id] = event_data

    return JsonResponse(data, content_type="application/json")


def get_default_sous_cat(request):
    try:
        name = request.GET.get('name')
        sous_cat = Produit.objects.get(nom=name).sous_categorie.nom
        print(sous_cat)
    except BaseException:
        sous_cat = -1
    return JsonResponse({"HTTPRESPONSE": 'ok', 'sous_cat': sous_cat}, content_type="application/json")
