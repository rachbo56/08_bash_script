#!/bin/bash
# service.sh start httpd
# -> systemctl start httpd
# -> systemctl enable --now httpd

# service.sh stop httpd
# -> systemctl stop httpd
# -> systemctl disable httpd

# service.sh restart httpd
# -> systemctl stop httpd
# -> systemctl start httpd
# -> systemctl enable --now httpd 

if [ $# -ne 2 ]; then
    echo "Usage: $0 <start|stop|restart> <ServiceName>"
    exit 1
fi
ACTION=$1
SERVICE=$2

case $ACTION in
    'start') 
        systemctl start $SERVICE
        systemctl enable $SERVICE
        ;;
    'stop')
        systemctl stop $SERVICE
        systemctl disable $SERVICE 
        ;;
    'restart')
        systemctl restart $SERVICE
        systemctl enable $SERVICE
        ;;
    'status')
        echo "------ Current Servie Status ------"
        systemctl status $SERVICE 
        echo "------ Permanent Servie Status ------"
        systemctl is-enabled $SERVICE
        ;;
    *)  echo "Usage: $0 <start|stop|restart> <ServiceName>"
        exit 1
        ;;
esac







