from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class Usuario(AbstractUser):
    #username = models.CharField()
    #first_name = models.CharField()
    #last_name = models.CharField()
    #password = models.CharField()
    #email = models.CharField()
    

<<<<<<< Updated upstream
#    class Meta:
 #       proxy = True
=======
    #class Meta:
    #    proxy = True
>>>>>>> Stashed changes

    def __str__(self):
        return self.username