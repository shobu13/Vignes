"""module contenant les formulaires utilisé par django."""
from django import forms

from user.models import User


class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('username', 'password', 'first_name', 'last_name', 'email', 'code_postal', )


# class ArticleForm(forms.ModelForm):
#     """un formulaire d'ajout d'article"""
#     class Meta:
#         """class définissant le comportement global du formulaire"""
#         model = Article
#         exclude = ['slug', 'date']
#         widgets = {
#             'titre': forms.TextInput(attrs={'class': 'form-control'}),
#             'auteur': forms.TextInput(attrs={'class': 'form-control'}),
#             'contenu': forms.Textarea(attrs={'class': 'form-control'}),
#             'categorie': forms.Select(attrs={'class': 'form-control'}),
#         }
