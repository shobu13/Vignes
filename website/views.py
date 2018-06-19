# coding: utf-8
from django.shortcuts import render, HttpResponse

from user.forms import UserForm


def home(request):
    return render(request, 'website/website_home.html', locals())


def inscription(request):
    form = UserForm
    return render(request, 'website/website_inscription.html', locals())
