# Playing live demos

I've created simple script for "playing" live demos on Linux.

The script utilizes Linux `xdotool` and brings workarounds for its "insert new-line" issues.

## About the live demos

The [demo-step](../bin/demo-step) bash script is used to type [commands](demo.commands) into console window.

It gets (and removes) the first line from `demo.commands` file in your `$HOME` directory. 
The line is then typed into the current window. 

Escape sequentions in line are supported.

Example content of the `~/demo.commands` could be:

```plain
#\n# search images in Docker public registry (Docker hub)\ndocker search wildfly
#\n# run container from an image\ndocker run -it jboss/wildfly
```

Typical usage workflow:
* start console window
* press keyboard shortcut, which executes the `demo-step` script
* it types a line from `demo.commands` into the console window

So after first execution of the `demo-step` with the `demo.commands` content above,
you'll have in console:

```bash
$ #
$ # search images in Docker public registry (Docker hub)
$ docker search wildfly
```

and you can explain the command to audience and just press `Enter` to execute the command.

### How To Install demo-step

The header section of the script describes how to install and use it:

```bash
########################################################################
###
### Script for demoing on Linux (automated typing during live demos)
### Author: Josef Cacek (josef.cacek@gmail.com)
###
### Usage:
### * put this script on your PATH
### * install xdotool into your system
### * make 2 keyboard shortcuts to your system setting
###   * the first runs "demo-step" command (e.g. I use Ctrl-Shift-E)
###   * the second runs "demo-step reply" command (e.g. I use Ctrl-Shift-R)
### * put commands as a lines into ~/demo.commands file
###   use escape sequences to enter special charaters
###   E.g. one line in my demo.commands file contains:
###   #\n# search images in Docker public registry (Docker hub)\ndocker search wildfly
### * and DEMO!
###   * press your demo-step keyboard shortcut and watch what is script typing
###   * it gets (and removes) first line from demo.commands puts it into new file 
###     with escape sequences already resolved. Then using xdotool type the lines
###   * when you need to replay last command use the "demo-step replay" 
###     keyboard shortcut
###
########################################################################
```

## Presentation - slides

The related presentation is located in [index.html](index.html) file. It's just few
Docker-related slides from my presentation about Linux Containers.

The [remark.js library](http://gnab.github.io/remark/) which utilizes 
MarkDown markup is used for this presentation. 

It supports following shortcuts:
* `left/right`, `PgUp/PgDown`, `Home/End` - slides navigation
* `p` - switch to preview mode (with speakers notes)
* `c` - clone the window (so it can be in 2 windows - one with notes and one full-screen)
* `f` - display in fullscreen
