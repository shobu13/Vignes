# Generated by Django 2.0.3 on 2018-06-13 07:27

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('magasin', '0014_auto_20180613_0925'),
    ]

    operations = [
        migrations.AlterField(
            model_name='commande',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2018, 6, 13, 7, 27, 17, 468565, tzinfo=utc)),
        ),
    ]
