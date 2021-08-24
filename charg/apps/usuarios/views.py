from django.http.response import HttpResponse
from django.shortcuts import render

def listar_usuarios(request):
    return HttpResponse("listado de usuarios")

def crear_usuario(request):
    return HttpResponse("crear usuario")

def ver_usuario(request, id):
    return HttpResponse(f"ver usuario {id}")

def modificar_usuario(request, id):
    return HttpResponse(f"modificar usuario {id}")

def eliminar_usuario(request, id):
    return HttpResponse(f"eliminar usuario {id}")

