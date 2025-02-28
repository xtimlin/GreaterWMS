#!/bin/bash
python3 manage.py makemigrations
python3 manage.py migrate
supervisord -c /etc/supervisor/supervisord.conf


PORT=${PORT:-8000}  # Default to 8000 if PORT is not set
echo "Starting Django backend on port $PORT"
daphne -b 0.0.0.0 -p $PORT GreaterWMS.asgi:application