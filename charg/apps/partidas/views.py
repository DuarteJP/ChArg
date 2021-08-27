from django.shortcuts import render
from django.http import request
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.http.response import HttpResponse
from django.urls import reverse_lazy
#from bootstrap_modal_forms.generic import BSModalCreateView
from .models import Partida
from apps.categorias.models import Categoria
from django.contrib.auth.models import User
from apps.preguntas.models import Pregunta
import random

# Create your views here.

@login_required
def ranking(request):
	context ={}
	rank = Partida.objects.order_by('-puntaje')
	context['ranking'] = rank
	return render(request, 'partidas/ranking.html', context)

@login_required
def misPartidas(request, pk):
	context ={}
	partida = Partida.objects.filter(usuario_id = pk)
	context['partidas'] = partida
	return render(request, 'partidas/misPartidas.html', context)

@login_required
def seleccionarCategoria(request):
	context ={}
	#Se recorren todas las preguntas para asegurarse que ninguna tenga Mostrada=True
	# preguntas = Pregunta.objects.filter(mostrada == True)
	# for pregunta in preguntas:
	# 	pregunta.mostrada = False
	# 	pregunta.save()
	categoria = Categoria.objects.all()
	context['categorias'] = categoria
	return render(request, 'partidas/seleccionarCategoria.html', context)

@login_required
def categoriaSeleccionada(request, pk):
	context ={}
	categoria = Categoria.objects.get(id = pk)
	context['categoria'] = categoria
	return render(request, 'partidas/categoriaSeleccionada.html', context)

@login_required
def mostrarPregunta(request, pk):
	context ={}
	pregunta = Pregunta.objects.get(mostrada = False, categoria_id = pk)
	context['pregunta'] = pregunta
	return render(request, 'partidas/categoriaSeleccionada.html', context)

@login_required
def mostrarRespuesta(request, pk):
	context ={}
	respuestas = Respuesta.objects.filter(pregunta_id = pk)
	context['respuesta'] = respuestas
	return render(request, 'partidas/categoriaSeleccionada.html', context)