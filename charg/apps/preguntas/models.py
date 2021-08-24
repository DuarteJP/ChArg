from django.db import models

from apps.core.models import TimeModels

from apps.categorias.models import Categoria

class Pregunta(TimeModels):
	categoria = models.ForeignKey(Categoria, on_delete = models.SET_NULL , null = True)
	descripcion = models.CharField(max_length = 50)
	

