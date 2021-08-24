from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Categoria',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('creado', models.DateTimeField(auto_now_add=True, help_text='Fecha de creación', verbose_name='Creado')),
                ('modificado', models.DateTimeField(auto_now_add=True, help_text='Fecha de modificación', verbose_name='Modificado')),
                ('nombre', models.CharField(max_length=30)),
                ('descripcion', models.CharField(max_length=50)),
                ('color', models.CharField(max_length=6)),
                ('icono', models.CharField(max_length=25)),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
