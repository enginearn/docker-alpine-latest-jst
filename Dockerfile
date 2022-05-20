FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add tzdata vim doas && \
    cp usr/share/zoneinfo/Asia/Tokyo etc/localtime && \
    echo -e "permit nopass :wheel\npermit nopass :wheel as root cmd /usr/bin/*\n" >> /etc/doas.d/doas.conf && \
    chown -c root:root /etc/doas.d/doas.conf && \
    chmod -c 0400 /etc/doas.d/doas.conf && \
    doas -C /etc/doas.d/doas.conf && echo "config ok" || echo "config error" && \
    USER=docker_alpine && UID=1000 && \
    adduser \
        -D \
        -S \
        -s /bin/sh \
        -u $UID \
        -G wheel \
        -g $USER \
        $USER