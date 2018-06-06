from django.db import models
from django.utils import timezone


class Produit(models.Model):
    # trivia
    nom = models.CharField(max_length=100, blank=False, null=False, unique=True)
    description = models.TextField(blank=True, null=True)
    cepage = models.TextField(blank=True, null=True)
    notes_degustation = models.TextField(blank=True, null=True)
    accords = models.TextField(blank=True, null=True)
    temperature = models.FloatField(blank=True, null=True)
    date_ajout = models.DateField(default=timezone.now)

    categorie = models.ForeignKey('Categorie', on_delete=models.PROTECT)
    sous_categorie = models.ForeignKey('SousCategorie', on_delete=models.PROTECT)
    type = models.ForeignKey('TypesProduit', on_delete=models.PROTECT, null=True)
    marque = models.ForeignKey('Marque', on_delete=models.PROTECT, null=True, blank=True)

    # commerce
    prix = models.FloatField(blank=False, null=False)
    est_promo = models.BooleanField(default=False)
    debut_promo = models.DateField(blank=True, null=True)
    fin_promo = models.DateField(blank=True, null=True)
    stock = models.IntegerField()
    poid = models.FloatField(verbose_name="poid en gramme", null=True)

    def __str__(self):
        return self.nom


class Categorie(models.Model):
    nom = models.CharField(max_length=30, null=False, blank=False, unique=True)
    sous_cats = models.ManyToManyField('SousCategorie')

    def __str__(self):
        return self.nom


class SousCategorie(models.Model):
    nom = models.CharField(max_length=30, null=False, blank=False, unique=True)

    def __str__(self):
        return self.nom


class TypesProduit(models.Model):
    nom = models.CharField(max_length=30)

    def __str__(self):
        return self.nom


class Marque(models.Model):
    nom = models.CharField(max_length=30)

    def __str__(self):
        return self.nom
