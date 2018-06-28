"""module contenant les formulaires utilisé par django."""
from django import forms
from django.db import models

from user.models import User


class UserForm(forms.Form):
    username = forms.CharField(max_length=50, label='Pseudo')
    password = forms.CharField(widget=forms.PasswordInput, label='Mot de passe')
    confirm_password = forms.CharField(widget=forms.PasswordInput, label='Confirmez le mot de passe')
    first_name = forms.CharField(max_length=50, label='Prenom', widget=forms.TextInput(attrs={'placeholder': 'John'}))
    last_name = forms.CharField(max_length=50, label='Nom', widget=forms.TextInput(attrs={'placeholder': 'Smith'}))
    email = forms.EmailField(widget=forms.EmailInput(attrs={'placeholder': 'john.smith@MI6.uk'}))

    rue = forms.CharField(widget=forms.TextInput(attrs={'placeholder': '2 place de la république'}))
    ville = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Rennes'}))
    code_postal = forms.CharField(min_length=5, max_length=5,
                                  widget=forms.TextInput(attrs={'pattern': '[0-9]{5}', 'placeholder': '35000'}))
    phone_number = forms.CharField(min_length=10, max_length=10,
                                   widget=forms.TextInput(attrs={'pattern': '[0-9]{10}', 'placeholder': '0620788001'}))


class ConnexionForm(forms.Form):
    username = forms.CharField(label='Pseudo')
    password = forms.CharField(widget=forms.PasswordInput(), label='Mot de Passe')


class AdressForm(forms.Form):
    first_name = forms.CharField(max_length=50, label='Prenom', widget=forms.TextInput(attrs={'placeholder': 'John'}))
    last_name = forms.CharField(max_length=50, label='Nom', widget=forms.TextInput(attrs={'placeholder': 'Smith'}))
    email = forms.EmailField(widget=forms.EmailInput(attrs={'placeholder': 'john.smith@MI6.uk'}))

    rue = forms.CharField(widget=forms.TextInput(attrs={'placeholder': '2 place de la république'}))
    ville = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Rennes'}))
    code_postal = forms.CharField(min_length=5, max_length=5,
                                  widget=forms.TextInput(attrs={'pattern': '[0-9]{5}', 'placeholder': '35000'}))
    phone_number = forms.CharField(min_length=10, max_length=10,
                                   widget=forms.TextInput(attrs={'pattern': '[0-9]{10}', 'placeholder': '0620788001'}))
