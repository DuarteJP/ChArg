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
from .forms import Form_pregunta



# Create your views here.

@login_required
def ListarPreguntas(request):
    context = {}
    listado = Pregunta.objects.all() # ORM de django
    context['preguntas'] = listado
    return render(request, 'preguntas/listarPreguntas.html', context)


def AsignarRespuestas(request, pk):
    context = {}
    #SELECT * FROM PRODUCTOS WHERE id = pk
    objeto = Pregunta.objects.get(id = pk) # ORM de django
    print(objeto)
    context['pregunta'] = objeto
    return render(request, 'respuestas/listadoRespuestas.html', context)

class CreateViewPregunta(CreateView):
    template_name = 'preguntas/agregar.html'
    form_pregunta = Form_pregunta()
    success_message = 'Success: Creado correctamente.'
    success_url = reverse_lazy('preguntas:listar')

    def post(self, *args, **kwargs):
        #form_pregunta = Form_pregunta()
        template_name = 'preguntas/agregar.html'
        #form = self.form_pregunta(request.POST)
        if request.method == "POST":
            form = form_pregunta(request.POST)
            if form.is_valid():
                form.save()
                return redirect('preguntas:listar')
            else:
                form=self.form_pregunta()
                return render(request, template_name, self.get_context_data())

#def filtrarPregunta(request):
 #   context = {}
  #  criterio = request.Get.get('criterio')
   # print(" llegue", criterio)
    #if len(criterio) > 0:
        #lista = Pregunta.objects.all()
     #   listado = Pregunta.objects.filter(criterio)
      #  context['criterio'] = listado
      #  return render(request,'listarPreguntas.html', context)
   # elif criterio == "":
   #     context['error'] = 'criterio de busqueda vacio'
    #    return render(request,'listarPreguntas.html')
   # elif not criterio in Pregunta:
    #    context['error'] =messages.CheckMessage("El campo no existe")
     #   return render(request,'listarPreguntas.html', context)
   # else:
        #listado = Pregunta.objects.filter(criterio)
    #    context['criterio'] = listado
     #   return render(request,'listarPreguntas.html', context)
