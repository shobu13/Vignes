# coding: utf-8
from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.password_validation import validate_password
from django.contrib.auth import logout, login, authenticate
from django.core.exceptions import ValidationError

from user.forms import UserForm, ConnexionForm, AdressForm
from user.models import User

from website.models import AcceuilCard, Diver, BoutiqueImage


def home(request):
    cards = AcceuilCard.objects.all()
    num_tel = Diver.objects.get(nom='num_tel').data
    images = BoutiqueImage.objects.all()
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
                    user = User(username=username, first_name=first_name, last_name=last_name,
                                email=email, rue=rue,
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


# def BDD(request):
#     import pymysql
#     import os
#     from magasin.models import Categorie, SousCategorie, TypesProduit, Produit, Marque
#     from event.models import Event, EventImage, EventType
#     from django.core.files import File
#     text = ''
#     db = pymysql.connect('localhost', 'root', '', 'vignes')
#     cursor = db.cursor()
#
#     text += '<h1>Catégorie</h1>'
#     cursor.execute('SELECT * FROM categorie')
#     data = cursor.fetchall()
#     for row in data:
#         text += '{}<br/>'.format(row)
#         Categorie(id=row[0], nom=row[1]).save()
#
#     text += '<h1>Sous Catégorie</h1>'
#     cursor.execute('SELECT * FROM souscategorie')
#     data = cursor.fetchall()
#     for row in data:
#         text += '{}<br/>'.format(row)
#         categorie = Categorie.objects.get(id=row[1])
#         SousCategorie(id=row[0], categorie=categorie, nom=row[2]).save()
#
#     text += '<h1>Type</h1>'
#     cursor.execute('SELECT * FROM produit')
#     data = cursor.fetchall()
#     types = []
#     for row in data:
#         if row[2] not in types:
#             types.append(row[2])
#             text += '{}<br/>'.format(row[2])
#     for index, type in enumerate(types):
#         TypesProduit(id=index, nom=type).save()
#
#     text += '<h1>Marque</h1>'
#     cursor.execute('SELECT * FROM produit')
#     data = cursor.fetchall()
#     marques = []
#     for row in data:
#         if row[9] not in marques and row[9] != "":
#             marques.append(row[9])
#             text += '{}<br/>'.format(row[9])
#     for index, marque in enumerate(marques):
#         Marque(id=index, nom=marque).save()
#
#     text += '<h1>Produit</h1>'
#     cursor.execute('SELECT * FROM produit')
#     data = cursor.fetchall()
#     for row in data:
#         text += '{}<hr/>'.format(row)
#         type = TypesProduit.objects.get(nom=row[2])
#         poid = float(row[5]) * 100
#         try:
#             categorie = Categorie.objects.get(id=row[6])
#         except:
#             categorie = Categorie.objects.get(nom='ERROR')
#         try:
#             sous_categorie = SousCategorie.objects.get(id=row[7])
#         except:
#             sous_categorie = SousCategorie.objects.get(nom='ERROR_SOUS')
#         try:
#             marque = Marque.objects.get(nom=row[9])
#         except:
#             marque = None
#         print(row)
#         try:
#             Produit(id=row[0], nom=row[1], type=type, prix=row[3], stock=row[4], poid=poid,
#                     categorie=categorie, sous_categorie=sous_categorie, marque=marque,
#                     description=row[12]).save()
#         except:
#             pass
#     text += '<h1>Produit Image</h1>'
#     cursor.execute(
#         'SELECT idProduit, nomPhoto FROM link_photo_produit, photo WHERE photo.idPhoto = link_photo_produit.idPhoto')
#     data = cursor.fetchall()
#     for row in data:
#         text += '{}<hr/>'.format(row)
#         print(row)
#         directory = os.getcwd()
#         try:
#             produit = Produit.objects.get(id=row[0])
#             os.chdir('C:/Users/Shobu/Desktop/www/images/Produit/')
#             image = File(open('{}'.format(row[1]), 'rb'))
#             os.chdir(directory)
#             produit.photo = image
#             produit.save()
#         except:
#             print('fail')
#     for produit in Produit.objects.all():
#         if produit.photo.name == '':
#             directory = os.getcwd()
#             os.chdir('C:/Users/Shobu/Desktop/www/images/Produit/')
#             image = File(open('none.JPG', 'rb'))
#             os.chdir(directory)
#             produit.photo = image
#             produit.save()
#     text += '<h1>Event</h1>'
#     cursor.execute('SELECT * FROM evenement')
#     data = cursor.fetchall()
#     for row in data:
#         text += '{}<hr/>'.format(row)
#         print(row)
#         Event(id=row[0], nom=row[1], description=row[2], lieu=row[3], date=str(row[4]),
#               type=EventType.objects.get(nom='default'), heure=str(row[5])).save()
#
#     text += '<h1>Event Image</h1>'
#     cursor.execute(
#         'SELECT idEvenement, nomPhoto FROM link_photo_evenement, photo WHERE photo.idPhoto = link_photo_evenement.idPhoto')
#     data = cursor.fetchall()
#     for row in data:
#         text += '{}<hr/>'.format(row)
#         print(row)
#         directory = os.getcwd()
#         try:
#             event = Event.objects.get(id=row[0])
#             os.chdir('C:/Users/Shobu/Desktop/www/images/evenements/')
#             image = File(open('{}'.format(row[1]), 'rb'))
#             os.chdir(directory)
#             EventImage(image=image, event=event).save()
#         except:
#             print('fail')
#     return HttpResponse(text)
