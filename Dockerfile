FROM nginx:alpine

# Copy scanner and entrypoint
COPY index.html /usr/share/nginx/html/index.html
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Railway uses port 8080 — change nginx default listen port
RUN sed -i 's/listen\s*80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Runtime env var for API URL (injected at container start)
ENV IMPREZA_API_URL=""

EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
