#!/bin/bash

# Manually: setup newer Maven version into /opt/maven

git clone -b wildfly-training https://github.com/kwart/quickstart.git wildfly-quickstarts
pushd wildfly-quickstarts
mvn -s settings.xml install
popd

mkdir wildfly-labs-resources
pushd wildfly-labs-resources
wget http://download.jboss.org/wildfly/11.0.0.Final/wildfly-11.0.0.Final.zip
wget https://jdbc.postgresql.org/download/postgresql-42.1.4.jar
wget https://github.com/kwart/ldap-server/releases/download/2017-09-04/ldap-server.jar
popd

# docker pull jboss/wildfly:11.0.0.Final
docker pull postgres:10.1-alpine
docker pull kwart/alpine-ext:wildfly-11
