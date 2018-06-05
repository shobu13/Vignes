from django.shortcuts import render
from django.http import JsonResponse

from magasin.models import SousCategorie, Categorie


def home(request):
    return render(request, 'website/website_home.html')
