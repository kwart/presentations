# Lab - WildFly - JMS (Topics & Queues)

## Task 1: Add a new Queue

**What:** We will add a new durable queue using `jms-queue` CLI command

**How:**
* start WildFly with full profile (`standalone-full.xml`)
* run JBoss CLI, connect to the server and add the `testQueue`

```
jms-queue add --queue-address=testQueue --entries=queue/test,java:jboss/exported/jms/queue/test

# You can verify the newly created queue by reading the resource:
/subsystem=messaging-activemq/server=default/jms-queue=testQueue:read-resource()

# Disable message buffering/caching on clients, to 
# let the :list-messages and :remove-messages work properly
/subsystem=messaging-activemq/server=default/connection-factory=RemoteConnectionFactory \
    :write-attribute(name=consumer-window-size,value=0)
```

## Task 2: Use the Queue

**What:** We will use the queue from `helloworld-jms` quickstart

**How:**
* verify the WildFly is started with the full profile
* add test user for the client application

```
bin/add-user.sh -a -u guest -p guest -g guest
```
* build the test application:
```
cd ~/wildfly-quickstarts/helloworld-jms
mvn clean package
```
* start the Producer and/or the Consumer
```
# the Producer
java -jar target/helloworld-jms.jar -producer

# the Consumer
java -jar target/helloworld-jms.jar -consumer
```


* use JBoss CLI to review the queue status:
```
# message count
/subsystem=messaging-activemq/server=default/jms-queue=testQueue:count-messages()

# list messages
/subsystem=messaging-activemq/server=default/jms-queue=testQueue:list-messages()

# remove messages
/subsystem=messaging-activemq/server=default/jms-queue=testQueue:remove-messages()
```


## (Optional) Task 3: Change the Queue to non-durable

