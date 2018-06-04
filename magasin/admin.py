from django.contrib import admin

from magasin.models import *


class CategorieProduit(admin.ModelAdmin):
    class Media:
        js = (
            '//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',  # jquery
            'js/test.js',  # project static folder
        )


admin.site.register(Categorie)
admin.site.register(Produit, CategorieProduit)
admin.site.register(SousCategorie)
