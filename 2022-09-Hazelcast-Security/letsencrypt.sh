#!/bin/bash

DOMAIN=securitydemo.hazelcast.org
KEYSTORE=/opt/hazelcast-keystore.p12
TRUSTSTORE=/opt/hazelcast-truststore.p12

set -x
sudo rm "$KEYSTORE" "$TRUSTSTORE"


# generate Certificate by using embedded http server of the letsencrypt client
sudo certbot certonly --standalone -d $DOMAIN

# import private key to a keystore
sudo openssl pkcs12 -export -out "$KEYSTORE" \
  -in /etc/letsencrypt/live/$DOMAIN/fullchain.pem \
  -inkey /etc/letsencrypt/live/$DOMAIN/privkey.pem \
  -password pass:C0X8rJhkWl160iW

wget -O /tmp/ca.crt https://letsencrypt.org/certs/isrgrootx1.pem

sudo keytool -import -noprompt \
	-alias ca -keystore "$TRUSTSTORE" \
       	-storepass 123456 -storetype PKCS12 -file /tmp/ca.crt
