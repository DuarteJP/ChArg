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
#from .forms import SeleccionarRespuestas
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
	Partida.objects.raw('INSERT INTO partidas_partida (usuario) VALUES (%s)', [request.user.id])
	categoria = Categoria.objects.all()
	context['categorias'] = categoria
	return render(request, 'partidas/seleccionarCategoria.html', context)

@login_required
def mostrarPregunta(request, pk):
	categoria = Categoria.objects.get(id=pk)
	#partida = Partida.objects.get(usuario_id=pk)
	#id_partida = partida.id
	#partida = Partida.objects.filter(id=id_partida).update(modo=pk)
	partida = Partida.objects.create(usuario = request.user)
	preguntas = Pregunta.objects.filter(mostrada = False, categoria_id = pk)
	preg = list(Pregunta.objects.filter(mostrada=False, categoria_id=pk))
	rand = random.choice(preg)
	id_preg = rand.id
	pregunta = Pregunta.objects.filter(id=id_preg).update(mostrada=True)
	pregunta = Pregunta.objects.get(id=id_preg)
	respuestas = Respuesta.objects.filter(pregunta_id=id_preg)
	context={'categoria': categoria, 'pregunta': pregunta, 'respuesta': respuestas}
	return render(request, 'partidas/mostrarPregunta.html', context)

@login_required
def mostrarResultado(request):
	context = {}
	if request.method=="POST":
		seleccion = []
		for i in request.POST:
			if i != "csrfmiddlewaretoken":
				seleccion.append(i)

		# seleccionadas = 0
		# for s in seleccion:
		# 	respuesta=Respuesta.objects.filter(id=seleccion).update(mostrada=True)
		# 	seleccionadas += 1
		# correctas = count(Respuesta.objects.filter(correcta=True, mostrada=True))
		# partida = Partida.objects.all().last()
		# pk = partida.id
		# total = correctas - (seleccionadas - correctas)
		# if (total < 0):
		# 	total = 0
		# total = total + partida.puntaje
		# puntaje = Partida.objects.filter(id = pk).update(puntaje=total)
		# context['puntaje'] = puntaje
		context['seleccion']=seleccion
		return render(request, 'partidas/mostrarResultado.html', context)
	else:
		return render(request, 'partidas/mostrarResultado.html')


#form.fields['choice'].choices = list()
