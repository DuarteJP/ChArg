from ChArg.charg.charg.settings.local import DEBUG
from .base import *
if ENVIROMENT == "PROD":
    DEBUG = False
    STATIC_ROOT = os.path.join(os.path.dirname(BASE_DIR),'staticfiles')

    if ambiente == "PROD":
        import django_heroku
        django_heroku.settings(locals())