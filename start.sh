#!/bin/ash

GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"
log_success() { printf "${GREEN}[SUCCESS] %s${RESET}\n" "$1"; }
log_warning() { printf "${YELLOW}[WARNING] %s${RESET}\n" "$1"; }
log_error() { printf "${RED}[ERROR] %s${RESET}\n" "$1"; }

echo "⏳ Cleaning up temporary files..."
rm -rf /home/container/tmp/*
mkdir -p /home/container/tmp
log_success "tmp directory cleaned and recreated"

if id nginx >/dev/null 2>&1; then
    chown -R nginx:nginx /home/container/tmp
    chmod 770 /home/container/tmp
    log_success "tmp folder ownership/permissions set for nginx"
else
    log_warning "nginx user not found, skipping folder ownership"
fi

echo "⏳ Starting PHP-FPM..."
/usr/sbin/php-fpm8 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize || { log_error "PHP-FPM failed"; exit 1; }
log_success "PHP-FPM started"

sleep 0.25

if [ -S /home/container/tmp/php-fpm.sock ]; then
    chmod 777 /home/container/tmp/php-fpm.sock
else
    log_warning "PHP-FPM socket not found; Nginx may fail to connect"
fi

echo "⏳ Starting Nginx..."

log_success "Web server is running. All services started successfully."
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/

tail -f /dev/null
