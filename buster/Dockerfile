FROM debian:buster-slim

RUN apt-get update
RUN apt-get install -y debootstrap parted dosfstools
RUN apt-get install -y kpartx zerofree

RUN mkdir -p /build

RUN touch /usr/bin/udevadm && chmod +x /usr/bin/udevadm

WORKDIR /build/
ENTRYPOINT /build/build.sh
