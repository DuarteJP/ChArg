from django.shortcuts import render

from django.contrib.auth.forms import UserCreationForm

def Home(request):
	return render(request, 'home.html')

def Registro(request, ):
	if request.method == 'POST':
		form = UserCreationForm(request.POST)
		if form.is_valid():
			username = form.cleaned_data['username']
			mensaje.success(request, f'Usuario {username} creado')

	else:
		form = UserCreationForm()
	context = {'form': form}
	return render(request, 'registroUsuario.html', context)
	
		

