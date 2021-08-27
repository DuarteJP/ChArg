"""charg URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from .import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.Home, name = 'home'),
    #path('tablero/', views.Tablero, name = 'tablero'),
    #path direccion a las app

    path("usuarios/", include("apps.usuarios.urls")),
    
    #usuarios
    # path('usuarios/listado', listar_usuarios, name='listar_usuarios'),
    # path('usuarios/crear', crear_usuario, name='crear_usuario'),
    # path('usuarios/ver/<int:id>', ver_usuario, name='ver_usuario'),
    # path('usuarios/modificar/<int:id>', modificar_usuario, name='modificar_usuario'),
    # path('usuarios/eliminar/<int:id>', eliminar_usuario, name='eliminar_usuario')

<<<<<<< Updated upstream
   #apps
    path('preguntas/', include('apps.preguntas.urls')),
    path('respuestas/', include('apps.respuestas.urls')),
    path('categorias/', include('apps.categorias.urls')),
    
=======
    #pregunta
    path('preguntas/', include('apps.preguntas.urls')),

    #respuestas
    path('respuestas/', include('apps.respuestas.urls')),

    #partidas
    path('partidas/', include('apps.partidas.urls')),

    #categorias
    #path('categorias/', include('apps.categorias.urls'))    
>>>>>>> Stashed changes
]
