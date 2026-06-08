FROM nginx:alpine

RUN apk add --no-cache openssl

# Generate htpasswd with default credentials (admin:admin)
RUN printf "admin:$(openssl passwd -apr1 admin)\n" > /etc/nginx/.htpasswd && \
    chmod 640 /etc/nginx/.htpasswd

COPY nginx/gateway.conf /etc/nginx/conf.d/default.conf
COPY www/ /var/www/gateway/

# /var/www/protected must be volume-mounted at runtime and contain gateway_rsa

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD wget -q --spider http://localhost/health || exit 1
