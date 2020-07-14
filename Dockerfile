FROM ubuntu:xenial

add root /
RUN apt update && apt install -y git fuse unionfs-fuse unrar unzip curl

EXPOSE 22

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.7.0/s6-overlay-amd64.tar.gz /tmp/
RUN curl https://rclone.org/install.sh | bash
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

ENTRYPOINT ["/init"]
