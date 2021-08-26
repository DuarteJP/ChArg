from django.urls import path
from .import views

app_name = 'preguntas'

urlpatterns = [
  path('crear/', views.CreateViewPregunta.as_view(), name='crear'),
  path('listar/', views.ListarPreguntas, name='listar'),
  path('asignar/<int:pk>', views.AsignarRespuestas, name='asignar'),
]