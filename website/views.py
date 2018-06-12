# coding: utf-8
from django.shortcuts import render, HttpResponse

from magasin.models import Categorie


def home(request):
    return render(request, 'website/website_home.html', locals())
