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
	partida = Partida.objects.create(usuario = request.user)
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

@login_required
def mostrarResultado(request):
	if request.method=="POST":
		seleccion = []
		for i in request.POST:
			if i != "csrfmiddlewaretoken":
				seleccion.append(i)
		seleccionadas = 0
		for s in seleccion:
			respuesta=Respuesta.objects.filter(id=int(s)).update(mostrada=True)
			seleccionadas += 1
		correctas = (Respuesta.objects.filter(correcta=True, mostrada=True)).count()
		incorrectas = (Respuesta.objects.filter(correcta=False, mostrada=True)).count()
		partida = Partida.objects.all().last()
		pk = partida.id
		total = correctas - incorrectas
		if (total < 0):
			total = 0
		total = total + partida.puntaje
		puntaje = Partida.objects.filter(id = pk).update(puntaje=total)
		puntaje = Partida.objects.get(id=pk)
		respuestas_seleccionadas=[]
		for s in seleccion:
			respuestas_seleccionadas.append(Respuesta.objects.get(id=int(s)))
		print(respuestas_seleccionadas)
		id_respuesta = int(seleccion[0])
		pregunta = Respuesta.objects.get(id=id_respuesta)
		id_pregunta = pregunta.pregunta_id
		cat = Pregunta.objects.get(id=id_pregunta)
		id_categoria = cat.categoria_id
		categoria = Categoria.objects.get(id=id_categoria)
		context={'puntaje': puntaje, 'respuestas_seleccionadas': respuestas_seleccionadas, 'categoria': categoria}
		return render(request, 'partidas/mostrarResultado.html', context)
	else:
		return render(request, 'partidas/mostrarResultado.html')

