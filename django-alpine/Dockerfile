FROM alpine:edge
MAINTAINER snicolet <snicolet95@gmail.com>
RUN apk add --update nginx python3
RUN pip3 install --upgrade pip
RUN pip3 install requests pymongo gunicorn pytz django && mkdir -p /var/www/static /var/www/app /etc/nginx
RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*
RUN mkdir -p /var/tmp/nginx/client_body /run/nginx/
WORKDIR /var/www/app
COPY nginx.conf /etc/nginx/
COPY entrypoint.sh /var/www/entrypoint.sh
CMD ["/var/www/entrypoint.sh"]
