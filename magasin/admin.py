from django.contrib import admin

from magasin.models import *


class ProduitAdmin(admin.ModelAdmin):
    list_display = ('nom', 'temperature', 'date_ajout', 'categorie', 'sous_categorie', 'prix', 'est_promo', 'stock')
    list_filter = ('temperature', 'categorie', 'sous_categorie', 'prix', 'est_promo')
    date_hierarchy = 'date_ajout'
    ordering = ('categorie', 'sous_categorie', 'date_ajout',)
    search_fields = ('nom', 'description', 'cepage',)

    exclude = ('date_ajout',)

    fieldsets = (
        ('Base', {
            'fields': ('nom', 'categorie', 'sous_categorie', 'type', 'marque',)
        }),
        ('Général', {
            'classes': ['collapse', ],
            'fields': ('description', 'cepage', 'notes_degustation', 'accords',
                       'temperature',)
        }),
        ('Détails', {
            'classes': ['collapse', ],
            'fields': ('prix', 'poid', 'est_promo', 'debut_promo', 'fin_promo', 'stock',)
        }),
    )

    class Media:
        js = (
            '//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js',  # jquery
            'js/admin_produit_gestion.js',  # project static folder
        )


class CategorieAdmin(admin.ModelAdmin):
    pass
    list_display = ('nom',)
    list_filter = ('sous_cats',)
    filter_horizontal = ("sous_cats",)
    ordering = ('nom',)
    search_fields = ('nom',)


class SousCategorieAdmin(admin.ModelAdmin):
    list_display = ('nom',)
    ordering = ('nom',)
    search_fields = ('nom',)


class TypesProduitAdmin(admin.ModelAdmin):
    list_display = ('nom',)
    ordering = ('nom',)
    search_fields = ('nom',)


class MarqueAdmin(admin.ModelAdmin):
    list_display = ('nom',)
    ordering = ('nom',)
    search_fields = ('nom',)


admin.site.register(Produit, ProduitAdmin)
admin.site.register(TypesProduit, TypesProduitAdmin)
admin.site.register(Categorie, CategorieAdmin)
admin.site.register(SousCategorie, SousCategorieAdmin)
admin.site.register(Marque, MarqueAdmin)
admin.site.register(Commande)
admin.site.register(ContenuCommande)
admin.site.register(Client)
