DEBUG = False
STATIC_ROOT = os.path.join(BASE_DIR, "staticfiles")

import django_heroku
django_heroku.settings(locals())