from django.urls import path
from .import views

app_name = 'respuestas'

urlpatterns = [
  path('listar/', views.ListarRespuestas, name='listar'),
  #path('Asignar/<int:pk>', views.AsignarRespuestas, name='asignar'),
]