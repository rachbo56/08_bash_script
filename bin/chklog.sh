#!/bin/bash

# 프로그램 작성 목적: 
# - 로그 파일 (/var/log/messages)을 30초에 한 번씩 점검
# - 에러 단어 (warn|fail|error|crit|alert|emerg)가 새로 추가되는지 확인
# - 이상 있으면 관리자에게 메일로 전송

# 조건:
# - 이 프로그램은 Daemon처럼 동작해야 한다. (24/7)

# 필수 프로그램
# - sendmail, s-nail (replaced from mailx)

LOGFILE="/var/log/messages"
TMP1=/tmp/.tmp1 && > $TMP1
TMP2=/tmp/.tmp2 && > $TMP2
TMP3=/tmp/.tmp3 && > $TMP3

egrep -ni 'warn|error|fail|crit|alert|emerg' $LOGFILE > $TMP1
while true
do
    sleep 10
    egrep -ni 'warn|error|fail|crit|alert|emerg' $LOGFILE > $TMP2
    diff $TMP1 $TMP2 > $TMP3 && continue 
    
    mailx -s '[ WARN ] Check the Logs ASAP' root  < $TMP3
    egrep -ni 'warn|error|fail|crit|alert|emerg' $LOGFILE > $TMP1
done





