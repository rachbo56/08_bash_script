#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <httpd|nginx>"
    exit 1
fi

WEBSVC=$1

HTTPD() {
    systemctl disable --now nginx >/dev/null 2>&1
    ./httpd.sh
}

NGINX() {
    systemctl disable --now httpd >/dev/null 2>&1
    ./nginx.sh
}


case $WEBSVC in
    'httpd') HTTPD ;;
    'nginx') NGINX ;;
    *) echo "[ FAIL ] Please enter either 'httpd' or 'nginx'"
        exit 1 ;;
esac


