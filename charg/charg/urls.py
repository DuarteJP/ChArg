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
from django.contrib.auth import views as auth
from .import views
from apps.usuarios.views import listar_usuarios,crear_usuario,eliminar_usuario,modificar_usuario,ver_usuario

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.Home, name = 'home'),
    #registro
    path('registro/', views.Registro, name = 'registroUsuario'),
    

    path('',auth.LoginView.as_view(template_name='usuarios/login.html'), name='login'),
    path('logout/',auth.LogoutView.as_view(), name='logout'),

    #path direccion a las app
    #path('productos/', include('apps.productos.urls'))  
    
    #usuarios
    path('usuarios/listado', listar_usuarios, name='listar_usuarios'),
    path('usuarios/crear', crear_usuario, name='crear_usuario'),
    path('usuarios/ver/<int:id>', ver_usuario, name='ver_usuario'),
    path('usuarios/modificar/<int:id>', modificar_usuario, name='modificar_usuario'),
    path('usuarios/eliminar/<int:id>', eliminar_usuario, name='eliminar_usuario')
    
]
