ARG BASE_IMAGE="public.ecr.aws/docker/library/alpine:3.18"

FROM ${BASE_IMAGE}

ENV NGINX_VERSION="1.24.0-r7" \
    PHP_VERSION="8.1.25-r0"

RUN apk update && apk upgrade \
 && apk add nginx=${NGINX_VERSION} \
 && apk add php81=${PHP_VERSION} \
			php81-bz2 \
			php81-calendar \
			php81-ctype \
			php81-curl \
			php81-dom \
			php81-exif \
			php81-fileinfo \
			php81-fpm \
			php81-gettext \
			php81-iconv \
			php81-mbstring \
			php81-mysqli \
			php81-mysqlnd \
			php81-openssl \
			php81-pcntl \
			php81-pdo \
			php81-pdo_mysql \
			php81-pdo_sqlite \
			php81-phar \
			php81-posix \
			php81-session \
			php81-shmop \
			php81-simplexml \
			php81-sockets \
			php81-sqlite3 \
			php81-sysvmsg \
			php81-sysvsem \
			php81-sysvshm \
			php81-tokenizer \
			php81-xml \
			php81-xmlreader \
			php81-xmlwriter \
			php81-xsl \
			php81-opcache \
 && apk add python3 py3-pip \
 && pip3 install --upgrade pip \
 && pip3 install supervisor

COPY --chown=root:root ./container-files /

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]



