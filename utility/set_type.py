from magasin.models import Categorie, Produit, TypesProduit


def set_type():
    for type in TypesProduit.objects.all():
        print(type)
        for categorie in type.categories.all():
            print("\t{}".format(categorie))
            for produit in categorie.produit_set.all():
                print("\t\t{}".format(produit))
                produit.type = type
                # produit.save()
