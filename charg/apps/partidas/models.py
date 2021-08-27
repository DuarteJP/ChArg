from django.db import models
from apps.core.models import TimeModels
from django.contrib.auth.models import User

class Partida(TimeModels):
	usuario = models.ForeignKey(User, related_name = 'mi_usuario', on_delete = models.CASCADE)
	#descripcion = models.CharField(max_length = 50, null = True)
	puntaje = models.IntegerField(default = 0)
	finalizada = models.BooleanField(default = False)

	def __str__(self):
		return str(self.puntaje)
