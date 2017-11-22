# Lab - WildFly - CLI configuration

## Task 1: Use Management console

**What:** use management console to view server log files

**How:**
1. Use `bin/add-user.sh` script to add a new Management User
  * username: `student`
  * password: `student`
  * groups: `[ ]` (empty)
2. Start the standalone server
  * `bin/standalone.sh`
3. Open Management console in a browser:
  * http://localhost:9990
4. View server logs
  * Navigate to `Runtime` -> `Standalone Server` -> `Log Files` -> `View`
  * select `server.log` and press `View` button

## Task 2: Configure running server using CLI

**What:** Disable `http2` protocol support in `http` listener

**How:**

* verify the server is started and `http2` enabled
```bash
nghttp http://localhost:8080/
```

* start JBoss CLI tool with `--connect / -c` parameter to connect to a running server:
```bash
bin/jboss-cli.sh -c
```

* disable the http2 support in `http` listener

```
/subsystem=undertow/server=default-server/http-listener=default:write-attribute(name=enable-http2, value=false)
# you have to reload server to changes take effect
reload
```

* verify the `http2` is disabled
```bash
nghttp http://localhost:8080/
```


## Task 3: Configure server when it's not running

**What:** Without server running use the JBoss CLI for configuration

**How:**

* Start JBoss CLI:
```bash
bin/jboss-cli.sh
```

* Run `embed-server` and use it

```bash
# start WildFly as an embedded server
embed-server

# add a system property
/system-property=test:add(value="Hello world!")

# stop the embedded server
stop-embedded-server

# quit the cli
quit
```

## Optional task

Play more with the CLI:

```bash
# print whole resource tree (complete configuration)
:read-resource(recursive=true)

# list web configuration - use command
ls /subsystem=undertow/server=default-server/http-listener=default

# or use operation instead
/subsystem=undertow/server=default-server/http-listener=default:read-resource
```
