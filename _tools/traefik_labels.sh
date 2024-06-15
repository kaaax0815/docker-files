read -p 'Name: ' var
read -p 'Port: ' var2
cat << EOF
    networks:
      - traefik
    labels:
      - traefik.enable=true
      - traefik.http.routers.$var.tls=true
      - traefik.http.routers.$var.tls.certresolver=letsencrypt
      - traefik.http.routers.$var.rule=Host(\`$var.REPLACE_ME\`)
      - traefik.http.routers.$var.entrypoints=websecure
      - traefik.http.routers.$var.service=$var
      - traefik.http.services.$var.loadbalancer.server.port=$var2

networks:
  traefik:
    external: true
EOF