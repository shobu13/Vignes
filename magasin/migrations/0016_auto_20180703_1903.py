# Generated by Django 2.0.6 on 2018-07-03 17:03

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('magasin', '0015_auto_20180703_1854'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commande',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2018, 7, 3, 17, 3, 37, 293264, tzinfo=utc)),
        ),
    ]
