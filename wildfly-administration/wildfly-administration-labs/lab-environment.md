# The Lab Environment

This WildFly Administration Training uses CentOS Linux Operating System for demos and labs.

## Access

Login:
* Username: `student`
* Password: `student`

The `student` user has a `sudo` right (administrator). If you need to
switch to the `root` account run `sudo su -`.

There are 3 important subfolders in student's home directory (`/home/student`):
* `wildfly-administration-labs` - the lab exercises
* `wildfly-labs-resources` - binaries used during lab exercises
* `wildfly-quickstarts` - WildFly quickstart application sources

## Linux console basics

Get help for a `command`
 * `man command` - shows manual pages (use `q` to quit)
 * `command --help` - standard way to provide help in Linux world

Keyboard shortcuts:
`Ctrl-C` - exit application
`Ctrl-D` - logout

Main commands:
```
# cd - Change directory
cd /home/student

# mkdir - Make directory
mkdir /tmp/test

# rm - Remove file/directory (-r recursive, -f force)
rm -rf file.txt
```


## Tools

### Terminator
Allows you to work efficiently in command line. application. Terminator is a terminal with horizontal 
(`Ctrl-Shift-E`) and vertical (`Ctrl-Shift-O`)
window splitting. You can cycle through window splits by `Ctrl-Shift-N`.

Tabs:
* `Ctrl-Shift-T` New tab
* `Ctrl-PgUp` / `Ctrl-PgDown` - cycle throug tabs

### Geany

Text editor with syntax highlight.

### Apache Maven

Build tool for java projects. It reads configuration from `pom.xml` in project directory.

Typical build command:
```bash
mvn clean install
```

### Docker

Virtualization on the process level: lightweight, simple, fast.

Run temporary container in interactive mode:
```
docker run -it --rm [imageName]
```

Docker containers have their own IP address, so it is simple to emulate
servers in a LAN with Docker containers.
