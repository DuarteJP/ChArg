from django.urls import path, include
from .import views

app_name = 'respuestas'

urlpatterns = [
  path('crear/', views.Agregar, name='crear'),
  path('listar/', views.ListarRespuestas, name='listar'),
  #path('Asignar/<int:pk>', views.AsignarRespuestas, name='asignar'),
]