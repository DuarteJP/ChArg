from django.shortcuts import render
from apps.usuarios.forms import SignUpForm
from django.contrib import messages


def Home(request):
	return render(request, 'home.html')

def Registro(request, ):
	if request.method == 'POST':
		form = SignUpForm(request.POST)
		if form.is_valid():
			username = form.cleaned_data['username']
			messages.success(request, f'Usuario {username} creado')

	else:
		form = SignUpForm()
	context = {'form': form}
	return render(request, 'registroUsuario.html', context)
	
		

