# Use alpine as the base image
FROM alpine:latest

# Set environment variables
ENV container_user=docker_alpine
ENV UID=1000
ENV port=8011

# Install packages, configure time zone, add a user and other configurations
RUN apk update && apk upgrade && \
    apk add tzdata vim doas && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/* && \
    echo -e "permit nopass :wheel\npermit nopass :wheel as root cmd /usr/bin/*\n" >> /etc/doas.d/doas.conf && \
    chown -c root:root /etc/doas.d/doas.conf && \
    chmod -c 0400 /etc/doas.d/doas.conf && \
    doas -C /etc/doas.d/doas.conf && echo "config ok" || echo "config error" && \
    adduser \
    -D \
    -S \
    -s /bin/ash \
    -u $UID \
    -G wheel \
    -g $container_user \
    $container_user

EXPOSE $port

# Switch to the user
USER $container_user

# Set working directory
WORKDIR /home/$container_user

# Set default shell
ENTRYPOINT [ "/bin/ash" ]
