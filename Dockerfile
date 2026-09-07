FROM nginx:alpine

# Copier tous les fichiers HTML
COPY *.html /usr/share/nginx/html/

# Copier le dossier des images
COPY images/ /usr/share/nginx/html/images/

# Copier la configuration Nginx personnalisée
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exposer le port 80
EXPOSE 80

# Commande de démarrage
CMD ["nginx", "-g", "daemon off;"]
