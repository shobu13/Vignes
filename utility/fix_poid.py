from magasin.models import Produit


def set_poid():
    try:
        for produit in Produit.objects.all():
            produit.poid = produit.poid * 10
            produit.save()
    except BaseException as e:
        print(e)
