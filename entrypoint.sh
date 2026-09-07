#!/bin/sh
set -e

# Injecter les variables d'environnement dans config.js 
BOT_TOKEN="${TELEGRAM_BOT_TOKEN}"
CHAT_ID="${TELEGRAM_CHAT_ID:-6078788670}"

# Créer le fichier config.js
mkdir -p /usr/share/nginx/html
cat > /usr/share/nginx/html/config.js << EOF
window.telegramConfig = {
    BOT_TOKEN: '$BOT_TOKEN',
    CHAT_ID: '$CHAT_ID'
};
EOF

# Remplacer le port 80 par le PORT dynamique de Railway
PORT=${PORT:-80}
sed -i "s/listen 80;/listen $PORT;/" /etc/nginx/conf.d/default.conf

# Vérifier que la modification a fonctionné
grep "listen $PORT" /etc/nginx/conf.d/default.conf || echo "Warning: PORT substitution may have failed"

# Démarrer Nginx
exec nginx -g "daemon off;"
