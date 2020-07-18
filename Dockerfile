FROM ubuntu

add root /
RUN export DEBIAN_FRONTEND=noninteractive && apt update && apt install -y git fuse unionfs-fuse unrar unzip curl mkvtoolnix ffmpeg

EXPOSE 22

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.0.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / --exclude='./bin' && tar xzf /tmp/s6-overlay-amd64.tar.gz -C /usr ./bin

RUN curl https://rclone.org/install.sh | bash

ENTRYPOINT ["/init"]
