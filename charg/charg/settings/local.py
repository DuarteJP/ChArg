from .base import *

DEBUG = True

ALLOWED_HOSTS = []

DATABASES = {
    'default': {

        'ENGINE': 'sql_server.pyodbc',
<<<<<<< HEAD
        'NAME': 'FINAL',
=======
        'NAME': 'BDCHARG',
>>>>>>> 1c4aabc60adba85372d49011fe87cacba372a3b4
        'Trusted_Connection':'yes',
        'HOST':'localhost\SQLEXPRESS',
        'OPTIONS':{
            'driver':'SQL Server Native Client 11.0',

        }
    }
}