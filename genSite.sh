#!/bin/sh
DOMENNAME=$1
WORKDIR=$2
cat << EOF
server {

     listen 80;
     server_name $DOMENNAME www.$DOMENNAME;
     set \$MAGE_ROOT $WORKDIR/$DOMENNAME;
     include $WORKDIR/$DOMENNAME/nginx.conf.sample;
	 include snippets/phpmyadmin.conf;
     location ~ \.php\$ {
     proxy_set_header X-Forwarded-Proto \$scheme;
     fastcgi_split_path_info ^(.+\.php)(/.+)\$;
	#fastcgi_pass unix:/var/run/php/php7.1-fpm.sock;
	 fastcgi_pass 127.0.0.1:50001;
     fastcgi_index index.php;
	 include fastcgi_params;
	#fastcgi_buffering off; # This must be here for WSL as of 11/28/2018
     fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
     fastcgi_param PHP_VALUE "upload_max_filesize = 20M \n post_max_size=21M";
     include /etc/nginx/fastcgi.conf;

	proxy_connect_timeout       70;
    proxy_send_timeout          90;
    proxy_read_timeout          90;
    send_timeout                90;

	}
}
EOF

