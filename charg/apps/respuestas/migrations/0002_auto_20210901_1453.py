# Generated by Django 3.0 on 2021-09-01 17:53

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('respuestas', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='respuesta',
            old_name='mostrada',
            new_name='seleccionada',
        ),
    ]
