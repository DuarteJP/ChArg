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
from django.contrib.auth.models import User
from apps.preguntas.models import Pregunta
import random
# Create your views here.

def contarPregunta(request, preg_num = 0):
	preg_num = preg_num + 1
	return preg_num

def limpiarPreguntas(request):
	preguntas = Pregunta.objects.filter(mostrada == True)
	for pregunta in preguntas:
		pregunta.mostrada = False
		pregunta.save()

@login_required
def mostrarPregunta(request):
	context ={}
	pregunta = Pregunta.objects.get(mostrada == False)
	pregunta = random.sample(pregunta, 1)
	pregunta.mostrada = True
	context['pregunta'] = pregunta.descripcion
	return render(request, 'partidas/jugando.html', context)

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

