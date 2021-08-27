from django.urls import path
from .import views

app_name = 'categorias'

urlpatterns = [
  path('crear/', views.CreateViewCategoria.as_view(), name='crear'),
  path('listar/', views.ListarCategorias, name='listar'),
  #path('Asignar/<int:pk>', views.AsignarRespuestas, name='asignar'),
]