# Lab - WildFly - EJB subsystem

## Task 1: Configure separate thread pool for remote calls

**What:** Create separate thread pool with custom size for remote connections

**How:**

By default the remote, async and timer invocations share a `default`
thread pool. Let's have better control over resources for remote calls
and assign them a new thread pool:

* Let's use maximal number of threads based on CPU cores available: `2 * countOfCpuCores
* Check number of cores:
```
cat /proc/cpuinfo

# As you can see, we have just one core in the test environment
```

* Use JBoss CLI to create new thread pool and assign it to remote invocations
```
/subsystem=ejb3/thread-pool=remote:add(max-threads=2)

/subsystem=ejb3/service=remote:write-attribute(name=thread-pool-name, value=remote)

# reload to apply changes
reload
```
