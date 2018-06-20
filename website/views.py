# coding: utf-8
from django.shortcuts import render, HttpResponse
from django.contrib.auth.password_validation import validate_password

from user.forms import UserForm


def home(request):
    return render(request, 'website/website_home.html', locals())


def inscription(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            pass
    else:
        form = UserForm()
    return render(request, 'website/website_inscription.html', locals())
