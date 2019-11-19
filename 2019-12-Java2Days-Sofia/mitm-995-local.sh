#!/bin/bash

# cleanup
sudo killall openssl
rm /tmp/tls-{request,response}

# create a request/response pipes
mkfifo /tmp/tls-{request,response}

# fake pop.gmail.com IP address
sudo sed -i '/pop.gmail.com/d' /etc/hosts
echo "127.0.0.1 pop.gmail.com" | sudo tee -a /etc/hosts

# start an s_server with some certificate which Java trusts (e.g. an Let's Encrypt one)
sudo openssl s_server -quiet -cert cert.pem -key privkey.pem -cert_chain chain.pem -accept 995 < /tmp/tls-response \
  | tee -a /tmp/tls-request | grep -v PASS &

# use s_client started from another terminal to forward requests
while true; do
  openssl s_client -quiet -connect 74.125.133.109:995 < /tmp/tls-request \
    | tee -a /tmp/tls-response
done
