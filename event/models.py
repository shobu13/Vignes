from django.db import models


class EventType(models.Model):
    nom = models.CharField(max_length=100)

    def __str__(self):
        return self.nom


class Event(models.Model):
    nom = models.CharField(max_length=200)
    description = models.TextField()
    lieu = models.CharField(max_length=100)
    date = models.DateField()
    heure = models.TimeField()

    type = models.ForeignKey('EventType', on_delete=models.PROTECT,)

    def __str__(self):
        return "{} à {}".format(self.nom, self.lieu)


class EventImage(models.Model):
    event = models.ForeignKey('Event', on_delete=models.CASCADE)
    image = models.ImageField(upload_to='uploads/event')
    rotation = models.IntegerField(default=0)

    def __str__(self):
        return '{} de {}'.format(self.image.name[0:100], self.event.nom)



