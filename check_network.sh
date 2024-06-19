#!/bin/bash

. functions.sh

# 네트워크 점검 스크립트
# 1) ping 192.168.10.2
# 2) ping 8.8.8.8
# 3) ping www.google.com
IP1=192.168.10.2
IP2=8.8.8.8
IP3=www.google.com

# 1. 내부 네트워크 점검
print_info "1. 내부 네트워크 점검"

ping -c 1 -W 1 $IP1 >/dev/null 2>&1

if [ $? -eq 0 ] ; then
    print_good "내부 네트워크 점검 완료"
else
    print_error "내부 네트워크 점검 이상"
    cat << EOF
    (a) # ip addr - IP설정확인
    (b) (WIN) services.msc > VMware* - 서비스점검
    (c) (WIN) VMware > VM > Settings (VMnet0 or VMnet8)
        * (VMnet0) VMware > Edit > VirtualNetwork Editor > VMnet0
        * (VMnet8) VMware > Edit > VirtualNetwork Editor > VMnet8
    (d) (WIN) ncpa.cpl > VMnet8 - vNIC 설정점검
EOF
    exit 1
fi


# 2. 외부 네트워크 점검
print_info "2. 외부 네트워크 점검"

ping -c 1 -W 1 $IP2 >/dev/null 2>&1

if [ $? -eq 0 ] ; then
    print_good "외부 네트워크 점검 완료"
else
    print_error "외부 네트워크 점검 이상"
    cat << EOF
    (a) # ip route
EOF
    exit 2
fi


# 3. 이름 네트워크 점검
print_info "3. 이름 네트워크 점검"

ping -c 1 -W 1 $IP3 >/dev/null 2>&1

if [ $? -eq 0 ] ; then
    print_good "이름 네트워크 점검 완료"
else
    print_error "이름 네트워크 점검 이상"
    cat << EOF
    (a) # cat /etc/resolv.conf
        => nameserver directive [DNS 지시자]
EOF
    exit 3
fi


