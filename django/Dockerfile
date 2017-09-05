FROM nfnty/arch-mini
MAINTAINER snicolet snicolet@student.42.fr
ENV APP_NAME=app
RUN pacman -Sy --noconfirm && pacman -S --noconfirm archlinux-keyring
RUN pacman -Su --noconfirm --ignore ca-certificates-utils && pacman -S --noconfirm --force ca-certificates-utils
RUN pacman -S --noconfirm extra/python-pip git extra/nginx extra/python-django extra/python community/python-pymongo extra/python-requests && pip install --upgrade pip
RUN pip install gunicorn pytz && mkdir -p /var/www/static /var/www/app /etc/nginx
WORKDIR /var/www/app
COPY nginx.conf /etc/nginx/
COPY entrypoint.sh /var/www/entrypoint.sh
CMD ["/var/www/entrypoint.sh"]
