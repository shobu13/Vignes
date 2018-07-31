from magasin.models import Categorie, Produit, TypesProduit


def set_type():
    for type in TypesProduit.objects.all():
        print(type)
        for categorie in type.categories.all():
            for produit in categorie.produit_set.all():
                produit.type = type
                produit.save()
