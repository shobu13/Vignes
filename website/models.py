from django.db import models


class CardImage(models.Model):
    card = models.ForeignKey('AcceuilCard', on_delete=models.CASCADE)
    image = models.ImageField(upload_to='uploads/panier_image')

    def __str__(self):
        return '{} de {}'.format(self.image.name[0:100], self.card.nom)


class AcceuilCard(models.Model):
    nom = models.CharField(max_length=100)
    desc = models.TextField(max_length=300)

    def __str__(self):
        return self.nom


class Diver(models.Model):
    nom = models.CharField(max_length=100)
    data = models.TextField()

    def __str__(self):
        return '{} : {}'.format(self.nom, self.data)


class BoutiqueImage(models.Model):
    image = models.ImageField(upload_to='uploads/boutique')

    def __str__(self):
        return self.image.name[0:100]
