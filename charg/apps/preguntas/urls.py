from django.urls import path, include
from .import views

app_name = 'preguntas'

urlpatterns = [
  path('crear/', views.Agregar, name='crear'),
  path('listar/', views.ListarPreguntas, name='listar'),
  path('asignar/<int:pk>', views.AsignarRespuestas, name='asignar'),
]