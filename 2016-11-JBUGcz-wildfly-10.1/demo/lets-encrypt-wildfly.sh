#!/bin/bash

set -x
rm /opt/keystore.p12
rm -rf wildfly-10.1.0.Final
unzip -q wildfly-10.1.0.Final.zip

DOMAIN=jcacek-wildfly.cacek.cz

# generate Certificate by using embedded http server of the letsencrypt client
letsencrypt certonly --standalone -d $DOMAIN

# import private key to a keystore
openssl pkcs12 -export -out /opt/keystore.p12 \
  -in /etc/letsencrypt/live/$DOMAIN/fullchain.pem \
  -inkey /etc/letsencrypt/live/$DOMAIN/privkey.pem \
  -password pass:pass.123

# change the SSL configuration in WildFly
wildfly-10.1.0.Final/bin/jboss-cli.sh <<EOT
  embed-server
  /core-service=management/security-realm=ApplicationRealm/server-identity=ssl:remove
  /core-service=management/security-realm=ApplicationRealm/server-identity=ssl:add( \
    keystore-password=pass.123, keystore-path="/opt/keystore.p12", \
    keystore-provider=PKCS12, protocol=TLS)
EOT

# Run WildFly
wildfly-10.1.0.Final/bin/standalone.sh -b 0.0.0.0

