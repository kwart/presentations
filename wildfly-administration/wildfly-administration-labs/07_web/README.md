# Lab - WildFly - Web subsystem

## Task 1: Configure root application

**What:** Deploy and configure the root web application

**How:**
* Check the `hello.war` is ready in `applications/hello/target` directory
  * if not, build it using Maven: `mvn clean install`
* start WildFly with default profile
* run JBoss CLI commands:
```
# deploy the application
deploy [/path/to/]applications/hello/target/hello.war

# configure `default-web-module` in Undertow
/subsystem=undertow/server=default-server/host=default-host:write-attribute(name=default-web-module, value=hello.war)
```
* check the home page in browser
  * http://localhost:8080/

## Task 2: Configure a virtual host

**What:** Add virtual host with custom root application

**How:**
Your test environment is reachable also under `my-server.my.company.example`
domain name. We will set a custom web application for it.

* start WildFly with default profile
* Build the `counter.war` application (in `applications/counter` directory)
* check you see the `hello` application, when open in browser the custom domain name:
  * http://my-server.my-company.example:8080/
* run JBoss CLI commands:
```
# set the default host
/subsystem=undertow/server=default-server/host=my-server.my-company.example:add(default-web-module=counter.war)

# deploy the application
deploy [/path/to/]applications/counter/target/counter.war
```
* check you see now the `counter` application in the browser:
  * http://my-server.my-company.example:8080/
