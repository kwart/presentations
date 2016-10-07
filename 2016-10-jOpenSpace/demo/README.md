# Sunstone Demo

```java
try (CloudProvider cloudProvider = CloudProvider.create("my-provider")) {
    try (Node node = cloudProvider.createNode("wildfly")) {
        // make HTTP request
        doHttpCall(new URL("http", node.getPublicAddress(), 8080, ""));
        node.exec(
                "tar",
                "-czvf",
                "/tmp/wildfly-logs.tgz",
                "/opt/jboss/wildfly/standalone/log").assertSuccess();
        node.copyFileFromNode("/tmp/wildfly-logs.tgz",
                Paths.get("/tmp/wildfly-" + cloudProvider.getCloudProviderType().getLabel() + ".tgz"));
    }
}
```

## Run in Docker

```bash
mvn clean test
```

## Run on Azure

```bash
AZURE_SUBSCRIPTION_ID=...
AZURE_PRIVATE_KEY_FILE=...
AZURE_PRIVATE_KEY_PASSWORD=...

mvn clean test \
   -Dprovider.type=azure \
   -Dazure.subscriptionId=$AZURE_SUBSCRIPTION_ID \
   -Dazure.privateKeyFile=$AZURE_PRIVATE_KEY_FILE \
   -Dazure.privateKeyPassword=$AZURE_PRIVATE_KEY_PASSWORD
```
