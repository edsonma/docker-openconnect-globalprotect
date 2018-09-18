FROM debian:stretch

RUN apt-get update && \
    apt-get install -y build-essential gettext autoconf automake \
                       libproxy-dev libxml2-dev libtool vpnc-scripts \
                       pkg-config iptables libgnutls28-dev libopenconnect-dev \
                       git sshpass procps

#RUN git clone git://git.infradead.org/users/dwmw2/openconnect.git
# using the mirror from gitlab cause the local network at Lappis doesn't
# allows connection to git:// protocol
RUN git clone https://gitlab.com/dwmw2/openconnect.git

WORKDIR openconnect

RUN ./autogen.sh && ./configure && make

RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
