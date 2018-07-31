from magasin.models import Categorie, Produit, TypesProduit


def set_type():
    for type in TypesProduit.objects.all():
        for produit in type.produit_set.all():
            produit.type = type
            produit.save()