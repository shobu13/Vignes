from django import forms

from magasin.models import Produit


class ListForm(forms.ModelForm):
    class Meta:
        model = Produit
        fields = ('sous_categorie', )
