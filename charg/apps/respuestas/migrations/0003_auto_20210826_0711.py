# Generated by Django 3.0 on 2021-08-26 10:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('respuestas', '0002_auto_20210825_1716'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='respuesta',
            name='dificultad',
        ),
        migrations.AddField(
            model_name='respuesta',
            name='mostrada',
            field=models.BooleanField(default=False),
        ),
    ]
