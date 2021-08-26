from django import forms
from django.http import request
from .forms import Form_pregunta
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView

from django.urls import reverse_lazy
#from bootstrap_modal_forms.generic import BSModalCreateView



from .models import Pregunta
from .import models
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
    form_class = Form_pregunta
    success_message = 'Success: Creado correctamente.'
    success_url = reverse_lazy('preguntas:listar')


#class CreateViewPregunta(CreateView):
 #   model = Pregunta
  #  Form_pregunta = forms
   # template_name = 'preguntas/listarPreguntas.html'
    #success_url = reverse_lazy('preguntas:listar')

    def get(self, request, *args, **kwargs):
        context = {'form': Form_pregunta()}
        return render(request, 'preguntas/agregar.html', context)

    def post(self, *args, **kwargs):
        template_name = 'preguntas/agregar.html'
        form = self.form_pregunta(request.POST)
        if form.is_valid():
            form.save()
            return redirect('preguntas:listar')
        else:
            form=self.form_pregunta()
            return render(request, template_name, self.get_context_data())




