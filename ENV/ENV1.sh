
. ./functions.sh

echo "(1. 단순패키지 설치)"
PkgInstall epel-release
PkgInstall gnome-tweaks boxes cowsay 


##############################
# 2. 서비스 기동
##############################
# - telnet
# - ftp
# - web
echo "(2. 서비스 기동)"

# 1) telnet 서비스
#  - 패키지 설치
PkgInstall telnet telnet-server
#  - 서비스 기동
SvcStart start telnet.socket

# 2) ftp 서비스
#  - 패키지 설치
PkgInstall vsftpd ftp
#  - 서비스 설정
sed -i 's/^root/#root/' /etc/vsftpd/ftpusers
sed -i 's/^root/#root/' /etc/vsftpd/user_list
#  - 서비스 기동
SvcStart start vsftpd.service

# 3) web 서비스
#  - 패키지 설치
PkgInstall httpd mod_ssl
#  - 서비스 설정
cat << EOF > /var/www/html/index.html
<pre>
$(cowsay -f dragon-and-cow HTTPD | boxes -d boy)
</pre>
EOF
#  - 서비스 기동
SvcStart start httpd.service

