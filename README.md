# OpenConnect Global VPN 

This container runs PaloNetworks' GlobalProtect VPN using OpenConnect from
latest upstream source code.

## Getting Started

Build your own image using docker build and then use that image to automatically connecting to your VPN server.

## To run your container

docker run -itd --privileged --cap-add=NET_ADMIN -p <localport:insideport> -e VPN_PASSWORD='<passwd>' -e VPN_SERVER='<server>' -e VPN_USER='<username>' -e SERVICE_IP='<serviceIp>' -e SERVICE_PORT='<servicePort>' <imageName>

## Image build with

* distro: Debian Stretch
* packages: build-essential gettext autoconf automake libproxy-dev libxml2-dev libtool vpnc-scripts pkg-config iptables libgnutls28-dev libopenconnect-dev git
* iptables: nat to your local service (example: dockerLocalIp:172.16.0.10 -> remoteLocalIp:10.0.0.100)

## Update dockerhub image

* docker build -t lappis/openconnect-globalprotect .
* docker push lappis/openconnect-globalprotect

## Authors

* Edson Ma - [github](https://github.com/edsonma)
* Lappis Team - [github](https://github.com/lappis-unb)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
