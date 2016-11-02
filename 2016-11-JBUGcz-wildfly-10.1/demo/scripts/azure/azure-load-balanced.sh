#!/bin/bash

export STORAGE_KEY="ItsMyKey...."

set -x
rm -rf wildfly-10.1.0.Final
unzip -q wildfly-10.1.0.Final.zip

export MY_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

cp single-jsp/counter-distributable.war wildfly-10.1.0.Final/standalone/deployments

cp wildfly-10.1.0.Final/docs/examples/configs/standalone-azure-ha.xml \
  wildfly-10.1.0.Final/standalone/configuration/

wildfly-10.1.0.Final/bin/jboss-cli.sh <<EOT
embed-server -c=standalone-azure-ha.xml
/subsystem=modcluster/mod-cluster-config=configuration:write-attribute(name=advertise,value=false)
/socket-binding-group=standard-sockets/remote-destination-outbound-socket-binding=proxy1:add(host=10.32.0.6,port=8090)
/subsystem=modcluster/mod-cluster-config=configuration:list-add(name=proxies,value=proxy1)
EOT

wildfly-10.1.0.Final/bin/standalone.sh -c standalone-azure-ha.xml \
  -b $MY_IP -bprivate $MY_IP \
  -Djboss.jgroups.azure_ping.storage_account_name=jbugczdemo \
  -Djboss.jgroups.azure_ping.storage_access_key=$STORAGE_KEY \
  -Djboss.jgroups.azure_ping.container=jbugczcontainer

