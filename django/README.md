This container need to be an intermediate image,
you have to do something like:

> FROM snicolet/django

> MAINTAINER ...

> ENV APP_NAME=your_app

> RUN python3 manage.py migrate

> RUN python3 manage.py collectstatic

the image will use the port 80 so you have to do:
> docker run -d -p 80:80 my/container
