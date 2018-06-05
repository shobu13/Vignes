from django.shortcuts import render
from django.http import JsonResponse

from magasin.models import SousCategorie, Categorie


def get_sous_cat(request):
    # return render(request, 'website/website_home.html')
    sous_categories = []
    # json data est maintenant au format JSON et pret à etre envoyé au client
    try:
        sous_categories_raw = SousCategorie.objects.filter(
            categorie=Categorie.objects.get(nom=request.GET['categorie']))
        for i in sous_categories_raw:
            sous_categories.append([i.id, i.nom])
        return JsonResponse({"HTTPRESPONSE": 'ok', 'sous_categorie': sous_categories}, content_type="application/json")
    except:
        return JsonResponse({"HTTPRESPONSE": 'erreur'}, content_type="application/json")
