```
  |  |                        |   _)      
  __ |   -_)   _| ` \    -_)   _|  |   _| 
 _| _| \___| _| _|_|_| \___| \__| _| \__| 
```
---
Hermetic is intended to keep you in your repo while providing 
an airtight build environment that doesn't pollute your system. 

Build Systems need to be three things:
1. Portable
1. Repeatable
1. Isolated

## Features
1. You stay you, enter the container as a normal user not a root (docker's default)
1. If you need to `sudo` you can! Just like a natural env, this helps permission headaches
1. Natural environment is a great test bed for packaging installs

## How to
Using the `ncurses` lib to showcase how you can build and run in an isolated env.
1. `just img` to build the docker image
1. `just build` to build the app in an **isolated** environment
1. `just sh` to enter the environment
1. `./hello` to run the TUI

![screenshot](screenshot.png)