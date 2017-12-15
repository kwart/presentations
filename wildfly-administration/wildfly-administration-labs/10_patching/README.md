# Lab - WildFly - Patching

## Task 1: Create WildFly patch

**What:** Prepare patch with updated slf4j logging library

**How:**

WildFly 11 includes slf4j-api library in version 1.7.22, we will update it to version 1.7.25.

We will use WildFly Patch Generation Tool available on GitHub: https://github.com/jbossas/patch-gen

Steps:
* Prepare clean installation of WildFly 11 (simply unzip)
* Prepare a copy of the clean installation where the changes will be applied
```
cp -r wildfly-11.0.0.Final wildfly-modified
```
* download the new slf4j-api version to the module directory, edit module descriptor, remove old version
```
# change working directory to the slf4j module
pushd wildfly-modified/modules/system/layers/base/org/slf4j/main/

# download the new slf4j-api library version
wget https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar

# replace version in module descriptor
sed -i 's#1.7.22#1.7.25#' module.xml

# remove the old library version
rm slf4j-api-1.7.22.jar

# return working directory to the previous path
popd
```

* download a release of the WildFly Patch Generation Tool:
```
wget https://github.com/jbossas/patch-gen/releases/download/2.0.0.Final/patch-gen-2.0.0.Final-shaded.jar
```

* generate config file and then generate a patch:
```
# create a patch config file template - it generates a file named patch-config-slf4j-patch.xml
java -jar patch-gen-2.0.0.Final-shaded.jar --create-template --cumulative slf4j-patch

# !!! usually you edit the config file at this point and provide some metadata into it

# generate the patch file by comparing clean and modified WildFly instances
java -jar patch-gen-2.0.0.Final-shaded.jar --applies-to-dist=wildfly-11.0.0.Final \
  --updated-dist=wildfly-modified --patch-config=patch-config-slf4j-patch.xml \
  --output-file=wildfly-11-slf4j.patch.zip
```

* verify the patch file is created. You can also list its content:
```
unzip -l wildfly-11-slf4j.patch.zip
```

## Task 2: Apply the patch

**What:** Use JBoss CLI to patch clean server installation

**How:**
* verify the original clean installation has still old slf4j version
```
find wildfly-11.0.0.Final/ -name 'slf4j*'
```
* Apply the patch by using JBoss CLI:
```
wildfly-11.0.0.Final/bin/jboss-cli.sh "patch apply wildfly-11-slf4j.patch.zip"
```
* Run the `find` command again to verify the new slf4j version is present

**The old version still lives in the old location, the new version is in a new overlay layer:**
```
wildfly-11.0.0.Final/modules/system/layers/base/.overlays/layer-base-slf4j-patch/org/slf4j/main/slf4j-api-1.7.25.jar
```

## (Optional) Task 3: Rollback the patch

**What:** use JBoss CLI to review installed patches and rollback our slf4j version upgrade

**How:** use `patch` command - to list possible command options use `patch --help`
