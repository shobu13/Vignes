from magasin.models import Produit


def set_poid():
    try:
        for produit in Produit.objects.all():
            print(produit.nom)
            print("\t{}".format(produit.poid))
            produit.poid = produit.poid * 10
            produit.save()
    except BaseException as e:
        print(e)
