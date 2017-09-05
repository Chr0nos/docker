#!/bin/sh
cd /var/www/app
nginx
gunicorn -w 9 --log-level debug --error-logfile "-" \
	--enable-stdio-inheritance \
	--reload $APP_NAME.wsgi:application
