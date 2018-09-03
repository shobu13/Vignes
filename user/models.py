from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    rue = models.TextField()
    ville = models.TextField()
    code_postal = models.CharField(max_length=5, default='')
    phone_number = models.CharField(max_length=12)

    def __str__(self):
        return "{} {}".format(self.last_name, self.first_name)
