#!/bin/bash
set -euxo pipefail

# Nginx config for React SPA
cat > /etc/nginx/conf.d/react-app.conf << 'EOL'
server {
    listen 80;
    server_name _;
    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
EOL

# Remove default if present
if [ -f /etc/nginx/conf.d/default.conf ]; then
  rm -f /etc/nginx/conf.d/default.conf
fi

# Permissions + restart
chmod -R 755 /usr/share/nginx/html
nginx -t
systemctl reload nginx || systemctl restart nginx
