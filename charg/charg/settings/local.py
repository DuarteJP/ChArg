from .base import *

DEBUG = True

ALLOWED_HOSTS = []

DATABASES = {
    'default': {

        'ENGINE': 'sql_server.pyodbc',
        'NAME': 'FINAL',
        'Trusted_Connection':'yes',
        'HOST':'localhost\\SQLEXPRESS01',
        'OPTIONS':{
            'driver':'SQL Server Native Client 11.0',
        }
    }
}