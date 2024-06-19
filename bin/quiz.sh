
QuizReq1() {
cat << EOF
[문제 01]. 차도가 없는 나라는?
1) 인도
2) 차도
3) 속도

EOF
}
# EOF 닫을 때 tab key 사용하려면 dash(-)넣어야 함

QuizReq2() {
cat << EOF
[문제 02]. 세상에서 가장 빠른 차는?
1) 막차
2) 첫차
3) 차차차

EOF
}

QuizReq3() {
cat << EOF
[문제 03]. 반성문을 영어로 하면?
1) 이글루
2) 다이빙
3) 글로벌

EOF
}

cat << EOF > truekey.txt
1
2
3
EOF

> choice.txt

for i in $(seq 1 3)
do
    TRUE=$(sed -n "${i}p" truekey.txt)
    CHOICE=0
    while [ $TRUE != $CHOICE ]
    do
        "QuizReq${i}"
        echo -n "Enter your choice? (1|2|3)"
        read CHOICE
        case $CHOICE in
            1|2|3) echo "$CHOICE" > choice.txt ;;
            *)
                echo "[ FAIL ] 잘못된 입력입니다. 다시 입력하세요."
                echo
                continue ;;
        esac
    done
done




# QuizReq01

