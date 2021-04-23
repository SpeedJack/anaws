FROM ubuntu:latest

USER root
WORKDIR /root

COPY ENTRYPOINT.sh /

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    iproute2 \
    iputils-ping \
    mininet \
    net-tools \
    openvswitch-switch \
    tcpdump \
    vim \
    x11-xserver-utils \
    xterm \
    sudo \
    ssh \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /ENTRYPOINT.sh

 RUN sed -Ei 's/^#?PermitRootLogin (yes|no|prohibit-password)/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 6633 6653 6640 22

ENTRYPOINT ["/ENTRYPOINT.sh"]
