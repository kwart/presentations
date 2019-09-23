FROM kwart/wildfly

COPY *.war /opt/wildfly/standalone/deployments/
COPY modify-ha-config.cli /opt/wildfly/

RUN /opt/wildfly/bin/jboss-cli.sh --file=/opt/wildfly/modify-ha-config.cli
