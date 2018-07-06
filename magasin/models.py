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
    # file will be saved to MEDIA_ROOT/uploads/2015/01/30
    photo = models.ImageField(upload_to='uploads/produit')

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

    def __str__(self):
        return self.nom


class SousCategorie(models.Model):
    nom = models.CharField(max_length=30, null=False, blank=False, unique=True)
    categorie = models.ForeignKey('Categorie', on_delete=models.CASCADE)

    def __str__(self):
        return self.nom


class TypesProduit(models.Model):
    nom = models.CharField(max_length=30)
    categories = models.ManyToManyField('Categorie')

    def __str__(self):
        return self.nom


class Marque(models.Model):
    nom = models.CharField(max_length=30)

    def __str__(self):
        return self.nom


class Commande(models.Model):
    date = models.DateTimeField(default=timezone.now())
    montant = models.FloatField()
    est_panier = models.BooleanField(default=False)
    envoie = models.BooleanField(default=True)
    est_envoyee = models.BooleanField(default=False)
    est_archivee = models.BooleanField(default=False)
    est_payee = models.BooleanField(default=False)

    client = models.ForeignKey('user.User', on_delete=models.CASCADE)
    frais_port = models.ForeignKey('FraisDePort', on_delete=models.PROTECT)

    def __str__(self):
        return "Commande n°" + str(self.id) + " de " + str(self.client.last_name)


class ContenuCommande(models.Model):
    commande = models.ForeignKey('Commande', on_delete=models.CASCADE)
    produit = models.ForeignKey('Produit', on_delete=models.PROTECT)

    quantite = models.IntegerField()

    def __str__(self):
        return self.produit.nom + " de commande n°" + str(self.commande.id)


class FraisDePort(models.Model):
    poid_min = models.FloatField()
    poid_max = models.FloatField()
    tarification = models.FloatField()

    def __str__(self):
        return "entre {} et {} : {} €".format(self.poid_min, self.poid_max, self.tarification)
