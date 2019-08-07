FROM staticfloat/nginx-certbot

COPY *.conf /etc/nginx/conf.d/

COPY _site /usr/share/nginx/html
