from .models import Categoria
from .forms import Form_categoria
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.http import request
# Create your views here.

@login_required
def ListarCategorias(request):
    context = {}
    listado = Categoria.objects.all() # ORM de django
    context['categorias'] = listado
    return render(request, 'categorias/listadoCategoria.html', context)

class CreateViewCategoria(CreateView):
    template_name = 'categorias/agregar.html'
    form_class = Form_categoria
    success_message = 'Success: Creado correctamente.'
    success_url = reverse_lazy('categorias:listar')

    def get(self, request, *args, **kwargs):
        context = {'form': Form_categoria()}
        return render(request,'categorias/agregar.html', context)

    def post(self, *args, **kwargs):
        template_name = 'categorias/agregar.html'
        form = self.Form_respuesta(request.POST)
        if form.is_valid():
            form.save()
            return redirect('categorias:listar')
        else:
            form=self.Form_respuesta()
            return render(request, template_name, self.get_context_data())
