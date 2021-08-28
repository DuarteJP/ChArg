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
from apps.respuestas.models import Respuesta
import random

# Create your views here.

@login_required
def ranking(request):
	context ={}
	rank = Partida.objects.order_by('-puntaje')[:50]
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
	preguntas = Pregunta.objects.filter(mostrada=True).update(mostrada=False)
	respuestas = Respuesta.objects.filter(mostrada=True).update(mostrada=False)
	categoria = Categoria.objects.all()
	context['categorias'] = categoria
	return render(request, 'partidas/seleccionarCategoria.html', context)

@login_required
def mostrarPregunta(request, pk):
	categoria = Categoria.objects.get(id=pk)
	preguntas = Pregunta.objects.filter(mostrada = False, categoria_id = pk)
	preg = list(Pregunta.objects.filter(mostrada=False, categoria_id=pk))
	rand = random.choice(preg)
	id_preg = rand.id
	pregunta = Pregunta.objects.filter(id=id_preg).update(mostrada=True)
	pregunta = Pregunta.objects.get(id=id_preg)
	respuestas = Respuesta.objects.filter(pregunta_id=id_preg)
	context={'categoria': categoria, 'pregunta': pregunta, 'respuesta': respuestas}
	return render(request, 'partidas/mostrarPregunta.html', context)

