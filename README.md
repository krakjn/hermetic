```
.s    s.                                                                  
      SS. .s5SSSs.  .s5SSSs.  .s5ssSs.  .s5SSSs.  .s5SSSSs. s.  .s5SSSs.  
sS    S%S       SS.       SS.    SS SS.       SS.    SSS    SS.       SS. 
SS    S%S sS    `:; sS    S%S sS SS S%S sS    `:;    S%S    S%S sS    `:; 
SSSs. S%S SSSs.     SS .sS;:' SS :; S%S SSSs.        S%S    S%S SS        
SS    S%S SS        SS    ;,  SS    S%S SS           S%S    S%S SS        
SS    `:; SS        SS    `:; SS    `:; SS           `:;    `:; SS        
SS    ;,. SS    ;,. SS    ;,. SS    ;,. SS    ;,.    ;,.    ;,. SS    ;,. 
:;    ;:' `:;;;;;:' `:    ;:' :;    ;:' `:;;;;;:'    ;:'    ;:' `:;;;;;:' 
                                                                          
```

# Hermetic - no blood loss here

Docker is great, until it's not. Hermetic is intended to keep you in your repo
while providing an airtight build environment that doesn't pollute your system. 

## Features
1. You stay you, enter the container as a normal user not a root (docker's default)
2. If you need to `sudo` you can! Just like a natural env, this helps permission headaches
3. Natural environment is a great test bed for packaging installs

## How to
1. `just img` to build the docker image
2. `just sh` to enter the environment


### Notes
> If you want to test out arm on amd then you need `qemu-user-static` (debian) or a similar package for your distro


```
hermetic on  main [!+] 
❯ just sh 
tony@docker:~/hermetic$ ls -l 
total 12
-rw-rw-r-- 1 tony tony 1032 Oct 24 03:59 Dockerfile
-rw-rw-r-- 1 tony tony 1422 Oct 24 03:59 README.md
-rw-rw-r-- 1 tony tony  537 Oct 24 03:57 justfile
tony@docker:~/hermetic$ 
```