FROM ubuntu:artful

RUN apt-get update && \
    apt-get install build-essential gettext autoconf automake libproxy-dev libxml2-dev libtool vpnc-scripts pkg-config iptables libgnutls28-dev libopenconnect-dev git -y

RUN git clone https://github.com/dlenski/openconnect.git

WORKDIR openconnect

RUN git checkout globalprotect && ./autogen.sh && ./configure && make && make install

RUN  echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

COPY entrypoint.sh /
COPY iptables.sh /

ENTRYPOINT ["/entrypoint.sh"]
