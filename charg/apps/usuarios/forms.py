from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.utils.translation import ugettext_lazy as _
from .models import Usuario


class SignUpForm(UserCreationForm):

    username = forms.CharField(label=_('Usuario'),
                                error_messages={'required': _('Se requiere Usuario'),
                                                'invalid': _('El Usuario puede contener sólo letras, números o guión bajo.')}, required=True,
                                widget=forms.TextInput(attrs={'class': 'form-control'}))
    password1 = forms.CharField(label=_('Contraseña'), widget=forms.PasswordInput(render_value=True, attrs={'class': 'form-control'}),
                               error_messages={'required': _('Se requiere Contraseña'),
                                               'invalid': _('La Contraseña puede contener sólo letras y números.')})
    password2 = forms.CharField(label=_('Confirmar Contraseña'), widget=forms.PasswordInput(render_value=True, attrs={'class': 'form-control'}),
                                       error_messages={'required': _('Se requiere Contraseña'),
                                                       'invalid': _('La Contraseña puede contener sólo letras y números.')})

    class Meta:
        model = Usuario
        fields = (
            'username',
            'password1',
            'password2',
        )



    def clean_user_name(self):
        username = self.cleaned_data.get('username')
        try:
            User.objects.get(username=username)
        except User.DoesNotExist:
            return username
        raise forms.ValidationError(_(f'El Usuario {username} ya existe, por favor ingresa uno diferente.'))