from .models import Categoria
from .forms import Form_categoria
from django.shortcuts import redirect, render
from django.contrib.auth.decorators import login_required
from django.urls import reverse_lazy
from django.views.generic.edit import CreateView
from django.http import request
from django.contrib import messages
# Create your views here.

@login_required
def ListarCategorias(request):
    context = {}
    listado = Categoria.objects.all() # ORM de django
    context['categorias'] = listado
    return render(request, 'categorias/listadoCategoria.html', context)

# class CreateViewCategoria(CreateView):
#     template_name = 'categorias/agregar.html'
#     form_class = Form_categoria
#     success_message = 'Success: Creado correctamente.'
#     success_url = reverse_lazy('categorias:listar')

#     def get(self, request, *args, **kwargs):
#         context = {'form': Form_categoria()}
#         return render(request,'categorias/agregar.html', context)

#     def post(self, *args, **kwargs):
#         template_name = 'categorias/agregar.html'
#         form = self.Form_respuesta(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('categorias:listar')
#         else:
#             form=self.Form_respuesta()
#             return render(request, template_name, self.get_context_data())


def Agregar(request):
    form = Form_categoria(request.POST or None)
    if request.method == "POST":
        if form.is_valid():
            formulario = form.save()
            #messages.success(request, 'Categoria agregada')
            return redirect('categorias:listar')
    context = {
        "form": form
    }
    return render(request, 'categorias/agregar.html', context)

def filtrarCategoria(request):
    context = {}
    if request.GET["criterio"]:
        criterio = request.GET["criterio"]
        print(criterio)
        listado = Categoria.objects.filter(nombre__icontains=criterio)
        context['encontrado'] = listado
        #print()
        return render(request,'categorias/listadoCategoria.html', context)
    elif request.GET["criterio"] == "":
        criterio = "Introduzca criterio de búsqueda"
        listado = Categoria.objects.all().order_by('nombre') # ORM de django
        context['categorias'] = listado
        return render(request, 'categorias/listadoCategoria.html', context)

def modificarCategoria(request, pk):
    objeto = Categoria.objects.filter(id = pk).first() # ORM de django
    form = Form_categoria(instance=objeto)
    return render(request, 'categorias/modificar.html', {"form": form,'objeto':objeto})

def actualizarCategoria(request, pk):
    objeto = Categoria.objects.get(id = pk)
    form = Form_categoria(request.POST, instance=objeto)
    if form.is_valid():
        form.save()
    categorias = Categoria.objects.all()
    return render(request,'categorias/listadoCategoria.html', {"categorias":categorias})

def eliminarCategoria(request, pk):
    objeto = Categoria.objects.get(id = pk)
    objeto.delete()
    objeto = Categoria.objects.all()
    messages.success(request, 'Seleccion eliminada exitosamente!')
    return render(request,'categorias/listadoCategoria.html', {"categorias":objeto, "mensaje":'ok'})