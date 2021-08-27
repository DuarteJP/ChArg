from django.urls import path, include
from .import views

app_name = 'partidas'


urlpatterns = [
  path('jugar/', views.mostrarPregunta, name='jugar'),
  path('ranking/', views.ranking, name='ranking'),
  path('misPartidas/<int:pk>', views.misPartidas, name='misPartidas'),
]