from django.db import models

from apps.core.models import TimeModels

from apps.categorias.models import Categoria

class Partida(TimeModels):
	categoria = models.ForeignKey(Categoria, on_delete = models.SET_NULL , null = True)
	descripcion = models.CharField(max_length = 50)
	nivel = models.CharField(max_length = 10)
	
# Create your models here.
