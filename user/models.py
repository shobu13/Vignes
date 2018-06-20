from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    confirm_password = models.TextField(verbose_name='Confirmer Mot de Passe')
    code_postal = models.CharField(max_length=5, default='')
