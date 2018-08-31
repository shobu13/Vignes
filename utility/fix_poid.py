from magasin.models import Produit

for produit in Produit.objects.all():
    produit.poid = produit.poid * 10
    produit.save()
