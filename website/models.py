from django.db import models


class AcceuilCard(models.Model):
    nom = models.CharField(max_length=100)
    desc = models.TextField()
    image = models.ImageField(upload_to='uploads/card_images')

    def __str__(self):
        return self.nom


class Diver(models.Model):
    nom = models.CharField(max_length=100)
    data = models.TextField()

    def __str__(self):
        return '{} : {}'.format(self.nom, self.data)

