from magasin.models import Produit

def set_poid:
    for produit in Produit.objects.all():
        produit.poid = produit.poid * 10
        produit.save()
