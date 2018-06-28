# coding: utf-8
from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.password_validation import validate_password
from django.contrib.auth import logout, login, authenticate
from django.core.exceptions import ValidationError

from user.forms import UserForm, ConnexionForm, AdressForm
from user.models import User


def home(request):
    return render(request, 'website/website_home.html', locals())


def inscription(request):
    error = []
    statut = None
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password"]
            confirm_password = form.cleaned_data["confirm_password"]
            first_name = form.cleaned_data["first_name"]
            last_name = form.cleaned_data["last_name"]
            email = form.cleaned_data["email"]

            rue = form.cleaned_data["rue"]
            ville = form.cleaned_data["ville"]
            code_postal = form.cleaned_data["code_postal"]
            phone_number = form.cleaned_data["phone_number"]
            try:
                validate_password(password)
                if password == confirm_password:
                    user = User(username=username, first_name=first_name, last_name=last_name, email=email, rue=rue,
                                ville=ville, code_postal=code_postal, phone_number=phone_number)
                    user.set_password(password)
                    user.save()
                    statut = 'sucess_account_create'
                    return redirect('/', statut)
                else:
                    statut = 'error'
                    error.append('les deux mot de passe ne correspondent pas.\r')
            except ValidationError as error_list:
                statut = 'error'
                for i in error_list:
                    error.append(i)
        else:
            statut = 'error'
            error.append('les deux mot de passe ne correspondent pas.\r')
    else:
        form = UserForm()
    return render(request, 'website/website_inscription.html', locals())


def deconnexion(request):
    """vue permetant à l'utilisateur de se déconnecter, renvoie vers la page d'acceuil avec la
    variable déconexion à True pour afficher une popup"""
    logout(request)
    return redirect('/')


def connexion(request):
    """vue affichant la page de connexion et traitant les données de cette dernière."""
    error = []
    if request.method == "POST":
        form = ConnexionForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            password = form.cleaned_data["password"]
            user = authenticate(username=username, password=password)
            if user:
                login(request, user)
                return redirect('/', locals())
            else:
                statut = 'error'
                error.append("Mot de passe ou nom d'utilisateur inconnu")
    else:
        form = ConnexionForm()

    return render(request, "website/website_login.html", locals())


def adressse(request):
    error = []
    statut = None
    if request.method == 'POST':
        form = AdressForm(request.POST)
        if form.is_valid():
            first_name = form.cleaned_data["first_name"]
            last_name = form.cleaned_data["last_name"]
            email = form.cleaned_data["email"]

            rue = form.cleaned_data["rue"]
            ville = form.cleaned_data["ville"]
            code_postal = form.cleaned_data["code_postal"]
            phone_number = form.cleaned_data["phone_number"]
            user = User.objects.get(id=request.user.id)
            user.first_name = first_name
            user.last_name = last_name
            user.email = email
            user.rue = rue
            user.ville = ville
            user.code_postal = code_postal
            user.phone_number = phone_number
            user.save()
            statut = 'sucess_adresse_modif'
        else:
            statut = 'error'
    else:
        data = {
            'first_name': request.user.first_name,
            'last_name': request.user.last_name,
            'email': request.user.email,
            'rue': request.user.rue,
            'ville': request.user.ville,
            'code_postal': request.user.code_postal,
            'phone_number': request.user.phone_number,
        }
        form = AdressForm(data)
        # form.fields['last_name'] = request.user.last_name
    return render(request, 'website/website_adresse.html', locals())
