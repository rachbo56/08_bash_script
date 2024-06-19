PkgInstall() {
    PKGS=$*
    yum -q -y install $PKGS
    RET=$? && TrueFalse "$RET" "$PKGS 패키지 설치"
    # if [ $? -eq 0 ] ; then
    #     echo "[  OK  ] $PKGS has been installed."
    # else
    #     echo "[ FAIL ] $PKGS has not been installed." 
    #     exit 2
    # fi
}

#  [ $? -eq 0 ] \
#    &&   echo "[  OK  ] $PKGS has been installed." \
#    ||   echo "[ FAIL ] $PKGS has not been installed." 

TrueFalse() {
    PRE_RET=$1 
    PRE_MESS=$2
    if [ $PRE_RET -eq 0 ]; then
        echo "[ OK ] $2"
    else 
        echo "[ FAIL ] $2"
        exit 2
    fi
}

SvcStart() {
    # SvcStart stop/start/restart <ServiceName>
    ACTION=$1
    SVCNAME=$2
    case $ACTION in
        'start') 
            systemctl enable --now $SVCNAME > /dev/null 2>&1
            RET=$? && TrueFalse "$RET" "$SVCNAME 기동"
            ;;
        'stop') 
            systemctl disable --now $SVCNAME >/dev/null 2>&1
            RET=$? && TrueFalse "$RET" "$SVCNAME 기동"
            ;;
        'restart')
            systemctl disable --now $SVCNAME > /dev/null 2>&1
            systemctl enable --now $SVCNAME > /dev/null 2>&1
            RET=$? && TrueFalse "$RET" "$SVCNAME 기동"           
            ;;
        *) echo "잘못된 입력입니다." ; exit 3 ;;
    esac
}

RebootYes() {
while true
do
    echo -n "[ WARNING ] Reboot a system? (yes/no) : "
    read ANS
    case $ANS in
        'yes'|'y'|'YES'|'Yes'|'Y') 
            RESULT=YES
            shutdown -r +1 "재부팅합니다." ;;
        'no'|'n'|'NO'|'No'|'N') 
            RESULT=NO
            break
            ;;
        *) echo "Invaild Response."
           ;;
    esac
done
}


