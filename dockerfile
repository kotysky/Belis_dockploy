FROM docker.n8n.io/n8nio/n8n:1.83.2

USER root

# Actualiza apk e instala bash
RUN apk update \
  && apk add --no-cache bash \
  && rm -rf /var/cache/apk/*

# Instala nodos comunitarios o personalizados (reemplaza con tus paquetes npm)
RUN npm install -g \
  @n8n-nodes-imap \
  @n8n-nodes-evolution-api\
  && npm prune --production

# Ajusta permisos de usuario
RUN chown -R node:node /home/node

# Cambia de nuevo al usuario node para ejecutar n8n
USER node