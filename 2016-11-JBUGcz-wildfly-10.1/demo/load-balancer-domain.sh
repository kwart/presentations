#!/bin/bash

set -x
rm -rf wildfly-10.1.0.Final
unzip -q wildfly-10.1.0.Final.zip

# add a management user - so we can use Management console
wildfly-10.1.0.Final/bin/add-user.sh -u admin -p admin.1234

MY_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

# start managed domain
wildfly-10.1.0.Final/bin/domain.sh -b $MY_IP -bprivate $MY_IP

