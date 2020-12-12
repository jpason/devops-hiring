#!/bin/bash

. $HOME/devops-hiring.settings

echo 'Enter password for Django Admin:'
read -s ADMIN_PASS


docker exec -i devops-hiring bash <<SETTINGS

python manage.py migrate
python manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', '$ADMIN_PASS')"

SETTINGS

