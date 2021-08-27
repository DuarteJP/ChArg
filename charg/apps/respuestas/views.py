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








'''
class CreateViewRespuesta(CreateView):
    template_name = 'respuestas/agregar.html'
    form_class = Form_respuesta
    success_message = 'Success: Creado correctamente.'
    success_url = reverse_lazy('respuestas:listar')

    def get(self, request, *args, **kwargs):
        context = {'form': Form_respuesta()}
        return render(request,'respuestas/agregar.html', context)

    def post(self, *args, **kwargs):
        template_name = 'respuestas/agregar.html'
        form = self.Form_respuesta(request.POST)
        if form.is_valid():
            form.save()
            return redirect('respuestas:listar')
        else:
            form=self.Form_respuesta()
            return render(request, template_name, self.get_context_data())'''
