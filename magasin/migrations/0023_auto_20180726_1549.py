# Generated by Django 2.0.6 on 2018-07-26 13:49

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('magasin', '0022_auto_20180725_1721'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commande',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2018, 7, 26, 13, 48, 59, 969709, tzinfo=utc)),
        ),
    ]
