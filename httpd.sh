#!/bin/bash
# 필수 패키지: cowsay / boxes


# 패키지 설치
PKG="httpd mod_ssl"
yum -y install $PKG > /dev/null 2>&1
[ $? -eq 0 ] \
    && echo "[  OK  ] $PKG has been installed." \
    || echo "[ FAIL ] $PKG has not been installed."

# 서비스 설정
cat << EOF > /var/www/html/index.html
<pre>
$(cowsay -f dragon-and-cow HTTPD | boxes -d stone)
</pre>
EOF
[ $? -eq 0 ] \
    && echo "[  OK  ] index.html has been created." \
    || echo "[ FAIL ] index.html has not been created."

# 서비스 기동
systemctl enable httpd >/dev/null 2>&1
systemctl start httpd
[ $? -eq 0 ] \
    && echo "[  OK  ] service has been started." \
    || echo "[ FAIL ] service has not been started."

# 방화벽 - Windows는 여기까지
# SELinux -Linux는 여기까지


