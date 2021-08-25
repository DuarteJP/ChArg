from django.shortcuts import render
from django.contrib import messages


def Home(request):
	return render(request, 'home.html')