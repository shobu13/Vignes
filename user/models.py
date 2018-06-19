from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    code_postal = models.CharField(max_length=5, default='')
