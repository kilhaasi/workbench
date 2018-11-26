FROM ubuntu

add root /
RUN apt update && apt install -y git fuse unionfs-fuse

EXPOSE 22

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.7.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

ENTRYPOINT ["/init"]
