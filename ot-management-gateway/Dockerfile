FROM nginx:alpine

RUN apk add --no-cache openssl

# Generate htpasswd with default credentials (admin:admin)
RUN printf "admin:$(openssl passwd -apr1 admin)\n" > /etc/nginx/.htpasswd && \
    chmod 644 /etc/nginx/.htpasswd

COPY nginx/gateway.conf /etc/nginx/conf.d/default.conf
COPY www/ /var/www/gateway/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# /var/www/protected must be volume-mounted at runtime and contain gateway_rsa (chmod 644)
# OT_DEVICE_MODEL, OT_DEVICE_IP, OT_DEVICE_PORT (all optional) populate /api/v1/ot/assets at startup; unset MODEL serves an empty registry
# IT_IFACE_NAME, IT_IFACE_IP, OT_IFACE_NAME, OT_IFACE_IP (all optional, CIDR notation) populate /api/v1/network/interfaces at startup

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD wget -q --spider http://localhost/health || exit 1

ENTRYPOINT ["/entrypoint.sh"]
