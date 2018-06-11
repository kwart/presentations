# Lab - WildFly Managed Domain

## Task 1: Configure servers on 3 machines as one domain 

**What:** 
We will use 3 machines (Docker containers) with WildFly installed. We will
join them into one WildFly managed domain and configure servers on them.

**How:**
Start WildFly docker containers without starting the WildFly in them.

Use 3 terminal windows - one for each container:

### First terminal - start domain controller - master host
```bash
docker run -it --rm --name wildfly-master kwart/alpine-ext:wildfly-11

# Following steps are executed in the running container

# add management users, so hosts can authenticate to domain controller
wildfly/bin/add-user.sh -u slave1 -p slave
wildfly/bin/add-user.sh -u slave2 -p slave

# print useful information for slaves
echo "Master node IP is: $MY_IP"
echo "Secret for both slaves is: $(echo -n slave | base64)"

# start domain controller and bind interfaces to correct IP adresses
wildfly/bin/domain.sh --host-config=host-master.xml -b $MY_IP -bmanagement $MY_IP
```

### 2nd and 3rd terminals - slave hosts
Run following steps in 2nd terminal

```
docker run -it --rm --name wildfly-slave1 kwart/alpine-ext:wildfly-11

# configure slave name - sed is used here to simplify automation
sed -i 's#<host #<host name="slave1" #' wildfly/domain/configuration/host-slave.xml

# configure slave authentication
wildfly/bin/jboss-cli.sh <<EOT
  embed-host-controller --host-config=host-slave.xml
  /host=slave1/core-service=management/security-realm=ManagementRealm/server-identity=secret:write-attribute(name=value,value="c2xhdmU=")
EOT

# start the slave and provide master adress
wildfly/bin/domain.sh --host-config=host-slave.xml -b $MY_IP -bmanagement $MY_IP -Djboss.domain.master.address=172.17.0.2
```

Use the same steps for 3rd terminal, just replace the **`slave1`** value with **`slave2`**

### Verify the domain is running
Console window on master host should contain following log entries:
```
[Host Controller] 17:57:02,374 INFO  [org.jboss.as.domain.controller] (Host Controller Service Threads - 7) WFLYHC0019: Registered remote slave host "slave1", JBoss WildFly Full 11.0.0.Final (WildFly 3.0.8.Final)
[Host Controller] 18:17:21,035 INFO  [org.jboss.as.domain.controller] (Host Controller Service Threads - 7) WFLYHC0019: Registered remote slave host "slave2", JBoss WildFly Full 11.0.0.Final (WildFly 3.0.8.Final)
```


## Task 2: Deploy application to domain

Use management console on master host to deploy `hello` application:
* go to http://172.17.0.2:9990/
* login with a slave credentials (`slave1`/`slave`)

1. Add a new deployment to the content repository
  * Deployments -> Content Repository -> Add
2. Assign the deployment to one or more server groups
  * Deployments -> Unassigned Content -> Assign -> `main-server-group`
3. Enable the deployment
  * Deployments -> Server groups -> main-server-group -> Enable `hello.war`

### Verify the application runs

The `master` host controller (domain controller) doesn't have running servers, so let's check
if the application is running on slaves:

* http://172.17.0.3:8080/hello/
* http://172.17.0.4:8080/hello/
