#!/bin/bash

# 언제 종료될지 모르니 while구문 사용

HELP() {
    cat << EOF
    명령을 간략하게 표시할 수 있습니다. 명령은 다음과 같습니다.

!               delete          literal         prompt          send
?               debug           ls              put             status
append          dir             mdelete         pwd             trace
ascii           disconnect      mdir            quit            type
bell            get             mget            quote           user
binary          glob            mkdir           recv            verbose
bye             hash            mls             remotehelp
cd              help            mput            rename
close           lcd             open            rmdir

EOF
}


ERROR() {
    echo "올바르지 않은 명령입니다."
}

LS() {
    ls -l
}



while true
do
    echo -n "ftp> "
    read CMD

    [ -z "$CMD" ] && continue
    case $CMD in
        'help') HELP ;;
        'quit') break ;;
        'ls') LS ;;
    #    '') : ;;     
        *) ERROR ;;
    esac
done
echo    

# :는 무시라는 뜻. 아무동작을 하지 않음


