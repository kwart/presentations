#!/bin/bash

set -x

rm -rf wildfly-10.1.0.Final
unzip -q wildfly-10.1.0.Final.zip
cp wildfly-10.1.0.Final/docs/examples/configs/standalone-load-balancer.xml wildfly-10.1.0.Final/standalone/configuration/

export MY_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

wildfly-10.1.0.Final/bin/standalone.sh -b $MY_IP -bprivate $MY_IP -c standalone-load-balancer.xml
