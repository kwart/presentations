#!/bin/bash

set -x
rm -rf wildfly-10.1.0.Final
unzip -q wildfly-10.1.0.Final.zip

# Copy demo application which requires HTTPs
cp single-jsp/checksecure-confidential.war wildfly-10.1.0.Final/standalone/deployments

# Run WildFly 10.1
wildfly-10.1.0.Final/bin/standalone.sh

