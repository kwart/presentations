# Lab - WildFly - JDBC drivers and datasources

## Task 1: Install the PostgreSQL JDBC driver as a WildFly module

**What:** Download JDBC driver and add it as a module.

**How:**
* Download PostgreSQL driver version 42.1.4 (JDBC 4.2) from https://jdbc.postgresql.org/download.html
  * store it to `/home/student/postgresql-42.1.4.jar`
* Use JBoss CLI to install it as a core module:
```
# the CLI doesn't to be connected to a running server. This is a local CLI command:
module add --name=com.postgresql \
  --resources=/home/student/postgresql-42.1.4.jar \
  --dependencies=javax.api,javax.transaction.api
```

* Check if the module was created by looking into modules directory:
  * it should contain 2 files (the driver JAR and `module.xml`)
```
ls wildfly-11.0.0.Final/modules/com/postgresql/main/
```

## Task 2: Add a datasource

**What:** We will run PostgreSQL database in docker and configure
a new datasource to use it.

**How:**
* Start the PostgreSQL server in a Docker container:
```
docker run -it --rm --name postgres \
  -e POSTGRES_USER=student \
  -e POSTGRES_PASSWORD=training \
  postgres:10.1-alpine
```

* Use JBoss CLI (connected) to register driver and add the datasource:
```
connect

/subsystem=datasources/jdbc-driver=postgresql:add( \
  driver-name=postgresql, driver-module-name=com.postgresql, \
  driver-xa-datasource-class-name=org.postgresql.xa.PGXADataSource)

data-source add --name=GreeterQuickstartDS \
  --jndi-name=java:jboss/datasources/GreeterQuickstartDS \
  --driver-name=postgresql \
  --connection-url=jdbc:postgresql://172.17.0.2:5432/student \
  --user-name=student --password=training
```

* Verify the DB connections works in the datasource (in JBoss CLI)
```
/subsystem=datasources/data-source=GreeterQuickstartDS:test-connection-in-pool
``` 

## Task 3: Deploy and test sample application

**What:** Deploy sample application which will use the datasource

**How:**
* copy `quickstart/greeter/target/greeter.war` to WildFly deployment directory
* open application in the browser and play with it
  * http://localhost:8080/greeter/
