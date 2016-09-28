package sunstone.demo;

import java.io.IOException;
import java.net.URL;
import java.nio.file.Paths;

import org.junit.Test;
import org.wildfly.extras.sunstone.api.CloudProvider;
import org.wildfly.extras.sunstone.api.Node;
import org.wildfly.extras.sunstone.api.OperationNotSupportedException;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.ResponseBody;

public class SunstoneDemoTest {

    @Test
    public void test() throws OperationNotSupportedException, IOException, InterruptedException {
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
    }

    private void doHttpCall(URL url) throws IOException {
        final OkHttpClient client = new OkHttpClient();
        final Request nodeNameRequest = new Request.Builder().url(url).build();
        System.out.println("Requesting URL: " + url);
        try (ResponseBody responseBody = client.newCall(nodeNameRequest).execute().body()) {
            System.out.println(responseBody.string());
        }
    }

}
