from django.shortcuts import render

from django.contrib.auth.decorators import login_required

from .models import Respuesta

# Create your views here.

@login_required
def ListarRespuestas(request):
    context = {}
    listado = Respuesta.objects.all() # ORM de django
    context['respuestas'] = listado
    return render(request, 'respuestas/listadoRespuestas.html', context)