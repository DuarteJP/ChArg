from django.db import models

from apps.core.models import TimeModels

from apps.usuarios.models import Usuario

class Partida(TimeModels):
	usuario = models.ForeignKey(Usuario, on_delete = models.SET_NULL , null = True)
	descripcion = models.CharField(max_length = 50)
	puntaje = models.IntegerField(default = 0)
	finalizada = models.BooleanField(default = False)

# Create your models here.
