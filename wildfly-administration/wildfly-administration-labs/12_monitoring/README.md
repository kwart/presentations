# Lab - WildFly - Monitoring

## Task 1: Monitor WildFly server

**What:** Use JConsole to monitor remote WildFly server

**How:**

* We will use WildFly server running in a docker container:
```
# start docker container
docker run -it --rm kwart/wildfly

# add a new Management user to WildFly
wildfly/bin/add-user.sh -u admin -p password

# start WildFly with Full profile
wildfly/bin/standalone.sh -c standalone-full.xml -bmanagement $MY_IP
```
* in a new terminal (outside docker container) install WildFly and run
  `jconsole` with WildFly extensions:
```
bin/jconsole.sh
```
* In the "JConsole New Connection" dialog fill:
  * Remote Process: `service:jmx:http-remoting-jmx://172.17.0.2:9990`
  * Username: `admin`
  * Password: `password`
* Connect and you should see Overview page with several monitoring graphs:
  * Memory usage
  * Loaded classes
  * Threads
  * CPU usage

* Switch to other tabs to see more details
