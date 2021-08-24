from django.db import models

from apps.core.models import TimeModels

from apps.preguntas.models import Pregunta

class Respuesta(TimeModels):
	pregunta = models.ForeignKey(Pregunta, on_delete = models.SET_NULL , null = True)
	descripcion = models.CharField(max_length = 50)
	tipo = models.CharField(max_length = 10)


