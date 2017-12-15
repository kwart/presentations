# Lab - WildFly - Security

## Task 1: Deploy secured web application

**What:** Build and deploy application with BASIC authentication

**How:**

* Find the application under `applications/secured`. Build it with Maven (`mvn install`)
and copy resulting WAR to WildFly's `standalone/deployments` directory.
  * review `src/main/webapp/WEB-INF/web.xml` deployment descriptor to see security settings
* Use the `add-user.sh` script to add a new user:
  * username: admin
  * password: admin
  * group: Admin
* check if application is running on http://localhost:8080/secured/
* verify you can login into the application with the `admin` credentials

## Task 2: Configure LDAP authentication:

**What:** Change the application to authenticate against a corporate LDAP server

**How:**
We will use simple LDAP server to emulate corporate environment
and configure WildFly to use it for authentication to the `secured`
application.

* Start LDAP server
```
java -jar /home/student/wildfly-labs-resources/ldap-server.jar
```
* Use JBoss CLI to create a new security domain named `training` with 
  LDAP login module configuration:
```
/subsystem=security/security-domain=training:add
/subsystem=security/security-domain=training/authentication=classic:add
/subsystem=security/security-domain=training/authentication=classic/login-module=Ldap:add( \
  code=Ldap, flag=required, module-options=[ \
  ("java.naming.provider.url"=>"ldap://my-server.my-company.example:10389"), \
  ("java.naming.security.authentication"=>"simple"), \
  ("java.naming.security.principal"=>"uid=admin,ou=system"), \
  ("java.naming.security.credentials"=>"secret"), \
  ("principalDNPrefix"=>"uid="), \
  ("principalDNSuffix"=>",ou=Users,dc=jboss,dc=org"), \
  ("rolesCtxDN"=>"ou=Roles,dc=jboss,dc=org"), \
  ("roleAttributeIsDN"=>"false"), \
  ("roleAttributeID"=>"cn"), \
  ("uidAttributeID"=>"member"), \
  ("matchOnUserDN"=>"true")])
  
reload
```

* To use non-default security domain, you have to specify the domain name
  in deployment JBoss specific deployment descriptor.
  Create a new file `src/main/webapp/WEB-INF/jboss-web.xml` with content:
```xml
<jboss-web>
    <security-domain>training</security-domain>
</jboss-web>
```

* rebuild the project with Maven and deploy the new WAR file.
* check you can't login anymore with `admin`/`admin`
* check you can login with LDAP account `jduke`/`theduke`
