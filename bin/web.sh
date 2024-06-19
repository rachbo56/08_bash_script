#!/bin/bash

yum install epel-release -y
yum install httpd mod_ssl boxes cowsay -y

mkdir -p /www

cat << EOF > /www/index.html
<pre>
$(cowsay –f dragon-and-cow LINUX | boxes -d boy)
</pre>
EOF

