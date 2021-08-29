from django.urls import path
from .import views

app_name = 'categorias'

urlpatterns = [
  path('crear/', views.Agregar, name='crear'),
  path('listar/', views.ListarCategorias, name='listar'),
  path('buscar/', views.filtrarCategoria, name='listar'),
  #path('Asignar/<int:pk>', views.AsignarRespuestas, name='asignar'),
]