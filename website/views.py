# coding: utf-8
from django.shortcuts import render, HttpResponse


def home(request):
    return render(request, 'website/website_home.html')
