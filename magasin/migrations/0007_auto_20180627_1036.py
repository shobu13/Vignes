# Generated by Django 2.0.6 on 2018-06-27 08:36

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('magasin', '0006_auto_20180626_1601'),
    ]

    operations = [
        migrations.CreateModel(
            name='FraisDePort',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('poid_min', models.FloatField()),
                ('poid_max', models.FloatField()),
                ('tarification', models.FloatField()),
            ],
        ),
        migrations.AlterField(
            model_name='commande',
            name='date',
            field=models.DateTimeField(default=datetime.datetime(2018, 6, 27, 8, 36, 28, 397706, tzinfo=utc)),
        ),
    ]
