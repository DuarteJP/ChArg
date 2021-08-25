from django.shortcuts import render
from django.contrib.auth.decorators import login_required

from .models import Pregunta


# Create your views here.

@login_required
def ListarPreguntas(request):
    context = {}
    listado = Pregunta.objects.all() # ORM de django
    context['preguntas'] = listado
    return render(request, 'preguntas/listarPreguntas.html', context)

@login_required
def AsignarRespuestas(request, pk):
    context = {}
    #SELECT * FROM PRODUCTOS WHERE id = pk
    objeto = Pregunta.objects.get(id = pk) # ORM de django
    print(objeto)
    context['pregunta'] = objeto
    return render(request, 'respuestas/listadoRespuestas.html', context)

