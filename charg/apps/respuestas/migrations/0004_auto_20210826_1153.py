# Generated by Django 3.0 on 2021-08-26 14:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('respuestas', '0003_auto_20210825_1733'),
    ]

    operations = [
        migrations.AlterField(
            model_name='respuesta',
            name='descripcion',
            field=models.CharField(max_length=255),
        ),
    ]
