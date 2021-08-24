from django.db import models

from apps.core.models import TimeModel

class Categoria(TimeModel):
	nombre = models.CharField(max_length = 30)
	descripcion = models.CharField(max_length = 50)
	color = models.CharField(max_length = 6)
	icono = models.CharField(max_length = 25)

