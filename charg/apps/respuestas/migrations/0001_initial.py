# Generated by Django 3.0 on 2021-08-24 15:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('preguntas', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Respuesta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('creado', models.DateTimeField(auto_now_add=True, help_text='Fecha de creación', verbose_name='Creado')),
                ('modificado', models.DateTimeField(auto_now_add=True, help_text='Fecha de modificación', verbose_name='Modificado')),
                ('descripcion', models.CharField(max_length=50)),
                ('tipo', models.CharField(max_length=10)),
                ('pregunta', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='preguntas.Pregunta')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
