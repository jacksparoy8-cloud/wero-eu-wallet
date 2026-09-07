#!/bin/sh
# Remplacer le port 80 par la variable d'environnement PORT
PORT=${PORT:-80}
sed -i "s/listen 80;/listen $PORT;/" /etc/nginx/conf.d/default.conf
exec nginx -g "daemon off;"
