FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    obs-studio \
    ffmpeg \
    v4l2loopback-dkms \
    pulseaudio \
    x11-xserver-utils \
    xauth \
    wget curl unzip ca-certificates \
    && apt-get clean

# Création de l'utilisateur non-root
RUN useradd -m streamer
USER streamer
WORKDIR /home/streamer

COPY obs-config/ .config/obs-studio/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]