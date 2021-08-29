from io import IOBase
from django import forms
from django.core.checks import messages
from django.http import request, HttpResponse
from .forms import Form_pregunta
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.http.response import HttpResponse
from django.urls import reverse_lazy
#from bootstrap_modal_forms.generic import BSModalCreateView
from .models import Pregunta
from django.template.loader import render_to_string



# Create your views here.

@login_required
def ListarPreguntas(request):
    context = {}
    listado = Pregunta.objects.all().order_by('descripcion') # ORM de django
    context['preguntas'] = listado
    return render(request, 'preguntas/listarPreguntas.html', context)


def AsignarRespuestas(request, pk):
    context = {}
    #SELECT * FROM PRODUCTOS WHERE id = pk
    objeto = Pregunta.objects.get(id = pk) # ORM de django
    print(objeto)
    context['pregunta'] = objeto
    return render(request, 'respuestas/listadoRespuestas.html', context)


def Agregar(request):
    form = Form_pregunta(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            formulario = form.save()
            #messages.success(request, 'Pregunta agregada')
            return redirect('preguntas:listar')
    context = {
        "form": form
    }
    return render(request, 'preguntas/agregar.html', context)


def filtrarPregunta(request):
    context = {}
    if request.GET["criterio"]:
        criterio = request.GET["criterio"]
        print(criterio)
        listado = Pregunta.objects.filter(descripcion__icontains=criterio)
        context['encontrado'] = listado
        #print()
        return render(request,'preguntas/listarPreguntas.html', context)
    elif request.GET["criterio"] == "":
        #criterio = "Introduzca criterio de busqueda"
        listado = Pregunta.objects.all().order_by('descripcion') # ORM de django
        context['preguntas'] = listado
        return render(request, 'preguntas/listarPreguntas.html', context)

def modificarPregunta(request, pk):
    objeto = Pregunta.objects.filter(id = pk).first() # ORM de django
    form = Form_pregunta(instance=objeto)
    #context['pregunta'] = objeto
    return render(request, 'preguntas/modificar.html', {"form": form,'objeto':objeto})

def actualizarPregunta(request, pk):
    objeto = Pregunta.objects.get(id = pk)
    form = Form_pregunta(request.POST, instance=objeto)
    if form.is_valid():
        form.save()
    preguntas = Pregunta.objects.all()
    return render(request,'preguntas/listarPreguntas.html', {"preguntas":preguntas})
    


    def eliminarPregunta(request):
        pass