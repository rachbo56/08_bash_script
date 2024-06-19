#!/bin/bash

# C:\> ipconfig /all
#--------------------------------------------------------------------------------
# Windows IP 구성
#
#    호스트 이름 . . . . . . . . : DESKTOP-VGVJ08C
#    주 DNS 접미사 . . . . . . . :
#    노드 유형 . . . . . . . . . : 혼성
#    IP 라우팅 사용. . . . . . . : 아니요
#    WINS 프록시 사용. . . . . . : 아니요
#
# 이더넷 어댑터 이더넷:
#
#    연결별 DNS 접미사. . . . :
#    설명. . . . . . . . . . . . : Intel(R) Ethernet Connection (22) I219-LM
#    물리적 주소 . . . . . . . . : F4-F1-9E-23-2C-63
#    DHCP 사용 . . . . . . . . . : 아니요
#    자동 구성 사용. . . . . . . : 예
#    링크-로컬 IPv6 주소 . . . . : fe80::2df5:3285:14c0:4f3e%14(기본 설정)
#    IPv4 주소 . . . . . . . . . : 172.16.6.2(기본 설정)
#    서브넷 마스크 . . . . . . . : 255.255.255.0
#    기본 게이트웨이 . . . . . . : 172.16.6.254
#    DHCPv6 IAID . . . . . . . . : 351596958
#    DHCPv6 클라이언트 DUID. . . : 00-01-00-01-2D-AF-CA-9C-F4-F1-9E-23-2C-63
#    DNS 서버. . . . . . . . . . : 8.8.8.8
#    Tcpip를 통한 NetBIOS. . . . : 사용
#--------------------------------------------------------------------------------

# 1) 호스트 이름
SERVER=$(hostname)

cat << EOF
Linux IP 구성
    호스트 이름 . . . . . . . . : $SERVER

EOF

# 2) 이더넷 어댑터
NICS=$(nmcli device | tail -n +2 | grep -v '^lo' | awk '{print $1}')



for NIC in $NICS
do
    # 3) CONNECTION 이름
    CON=$(echo $(nmcli device show $NIC | grep 'GENERAL.CONNECTION:' | awk -F: '{print $2}'))
    
    # 4) MAC 주소
    MAC=$(echo $(nmcli device show $NIC | grep '^GENERAL.HWADDR:' | awk -F'HWADDR:' '{print $2}'))
    
    # 5) DHCP 사용 유무
    DHCP=$(echo $(nmcli connection show $CON | grep ipv4 | grep 'ipv4.method' | awk -F: '{print $2}'))

    # 6) IP 주소
    IP=$(echo $(nmcli device show $NIC | grep 'IP4.ADDRESS' | awk -F: '{print $2}'))

    # 7) GW 주소
    GW=$(echo $(nmcli device show ens160 | grep 'IP4.GATEWAY' | awk -F: '{print $2}'))

    # 7)
    DNS=$(echo $(nmcli device show ens160 | grep 'IP4.DNS' | awk -F: '{print $2}'))

    cat << EOF
    이더넷 어댑터: $NIC
        커넥션 이름 . . . . . . . . : $CON
        물리적 주소 . . . . . . . . : $MAC
        DHCP 사용 . . . . . . . . . : $DHCP
        IPv4 주소 . . . . . . . . . : $IP
        기본 게이트웨이 . . . . . . : $GW
        DNS 서버. . . . . . . . . . : $DNS
EOF
done



