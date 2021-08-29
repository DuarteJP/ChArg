# from django.forms import ModelForm
# from django.http import request
# from apps.preguntas.models import Pregunta
# from apps.respuestas.models import Respuesta


# class Check_respuesta(ModelForm):
#     def __init__(self, pregunta_id, *args, **kwargs):
#         super(Check_respuesta, self).__init__(*args, **kwargs)
#         respuesta = Respuesta.objects.filter(pregunta_id=pregunta_id)
#         for i in respuesta:
#             self.fields["%d" %i.descripcion] = CheckboxSelectMultiple(respuesta.descripcion)
        
