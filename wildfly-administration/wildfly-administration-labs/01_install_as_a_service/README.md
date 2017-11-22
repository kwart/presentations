# Lab - WildFly - install as a service

## Guided demo

**What:**
Install the WildFly server as a Linux (systemd) service.

**How:**

Steps taken from `docs/contrib/scripts/systemd/README`, run them as `root` (`sudo su -`)

```
# Create a wildfly user
groupadd -r wildfly
useradd -r -g wildfly -d /opt/wildfly -s /sbin/nologin wildfly

# Install WildFly
unzip wildfly-11.0.0.Final.zip -d /opt
mv /opt/wildfly-11.0.0.Final /opt/wildfly
chown -R wildfly:wildfly /opt/wildfly
cd /opt/wildfly/docs/contrib/scripts/systemd

# Configure systemd
mkdir /etc/wildfly
cp wildfly.conf /etc/wildfly/
cp wildfly.service /etc/systemd/system/
cp launch.sh /opt/wildfly/bin/
chmod +x /opt/wildfly/bin/launch.sh

# Start and enable service
systemctl start wildfly.service
systemctl enable wildfly.service
```
