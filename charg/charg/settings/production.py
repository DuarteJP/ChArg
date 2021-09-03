from .base import *
if ENVIROMENT == "PROD":
    DEBUG = False
    STATIC_ROOT = os.path.join(BASE_DIR, "staticfiles")

    if ambiente == "PROD":
        import django_heroku
        django_heroku.settings(locals())