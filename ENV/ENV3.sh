#!/bin/bash
echo
echo "[ENV3.sh] 환경 설정"

. ./functions.sh

#---------- $PS1 Color ----------
export linux200=31
export linux201=32
export linux202=33
#--------------------------------
short_hostname=$(hostname | awk -F. '{print $1}')

# 환경설정
#  - PS1 변수 (색깔 표시)
# export PS1='\[\e[31;1m]\][\u@\h\[\e[33;1m\] \w] \\$ \[\e[m\]'
#  - alias ls='ls --color=auto -h -F'
#  - alias df='df -hT'
#  - alias ...
# 
echo "[1. ($HOME/.bashrc) 환경 설정]"

cat << EOF > $HOME/.bashrc
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "\$PATH" =~ "\$HOME/.local/bin:\$HOME/bin:" ]]
then
    PATH="\$HOME/.local/bin:\$HOME/bin:\$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
 
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias c='clear'
alias clar='clear'
alias tree='env LANG=C tree'

export PS1='\[\e[$(eval echo \$${short_hostname});1m\][\u@\h\[\e[33;1m\] \w] \\$ \[\e[m\]'
EOF

#$(eval echo \$${short_hostname}) 자리를 숫자로 사용하고 싶음.
#변수라서 한 번 해석하면 ${short_hostname}이 linux200이 됨
# $linux200
# eval을 붙이면 한 번 더 해석돼서 변수값인 31로 됨.
# 변수를 두 번 변환한 것


cat << EOF
--------------------------------
다음과 같이 환경파일을 적용하세요.
# source ~/.bashrc
--------------------------------
EOF







