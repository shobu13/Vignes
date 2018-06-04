from django.db import models


class Produit(models.Model):
    # trivia
    nom = models.CharField(max_length=20, blank=False, null=False, unique=True)
    description = models.TextField()
    cepage = models.TextField()
    notes_degustation = models.TextField()
    accords = models.TextField()
    temperature = models.FloatField()
    date_ajout = models.DateField()

    categorie = models.ForeignKey('Categorie', on_delete=models.PROTECT)
    sous_categorie = models.ForeignKey('SousCategorie', on_delete=models.PROTECT)

    # commerce
    prix = models.FloatField(blank=False, null=False)
    est_promo = models.BooleanField()
    debut_promo = models.DateField(blank=True)
    fin_promo = models.DateField(blank=True)
    stock = models.IntegerField()

    def __str__(self):
        return self.nom


class Categorie(models.Model):
    nom = models.CharField(max_length=20, null=False, blank=False, unique=True)
    sous_cats = models.ManyToManyField('SousCategorie')

    def __str__(self):
        return self.nom


class SousCategorie(models.Model):
    nom = models.CharField(max_length=20, null=False, blank=False, unique=True)

    def __str__(self):
        return self.nom
