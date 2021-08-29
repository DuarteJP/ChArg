from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.http import request
from django.contrib.auth.decorators import login_required
from .forms import Form_respuesta
from django.shortcuts import redirect, render
from .models import Respuesta

# Create your views here.

@login_required
def ListarRespuestas(request):
    context = {}
    listado = Respuesta.objects.all() # ORM de django
    context['respuestas'] = listado
    return render(request, 'respuestas/listadoRespuestas.html', context)

# def respuestaPregunta(request):
#     context = {}
#     listado = Pregunta.objects.all() # ORM de django
#     context['pregunta'] = listado
#     return render(request, 'respuestas/listadoRespuestas.html', context)

def Agregar(request):
    form = Form_respuesta(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            formulario = form.save()
            #messages.success(request, 'Pregunta agregada')
            return redirect('respuestas:listar')
    context = {
        "form": form
    }
    return render(request, 'respuestas/agregar.html', context)

def filtrarRespuesta(request):
    context = {}
    if request.GET["criterio"]:
        criterio = request.GET["criterio"]
        print(criterio)
        listado = Respuesta.objects.filter(descripcion__icontains=criterio)
        context['encontrado'] = listado
        #print()
        return render(request,'respuestas/listadoRespuestas.html', context)
    elif request.GET["criterio"] == "":
        criterio = "Introduzca criterio de busqueda"
        listado = Respuesta.objects.all().order_by('descripcion') # ORM de django
        context['respuestas'] = listado
        return render(request, 'respuestas/listadoRespuestas.html', context)

def modificarRespuesta(request, pk):
    objeto = Respuesta.objects.filter(id = pk).first() # ORM de django
    form = Form_respuesta(instance=objeto)
    return render(request, 'respuestas/modificar.html', {"form": form,'objeto':objeto})

def actualizarRespuesta(request, pk):
    objeto = Respuesta.objects.get(id = pk)
    form = Form_respuesta(request.POST, instance=objeto)
    if form.is_valid():
        form.save()
    respuestas = Respuesta.objects.all()
    return render(request,'respuestas/listadoRespuestas.html', {"respuestas":respuestas})
