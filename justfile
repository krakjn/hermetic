_:
    @just --list

# contextless docker build
img ARCH='amd64':
    docker build -t hermetic/{{ARCH}}:latest --platform linux/{{ARCH}} -< Dockerfile

# hermetic shell, enter environment persisting current working directory
sh ARCH='amd64' *COMMAND: 
    @docker run --rm -it \
        --hostname docker \
        --platform linux/{{ARCH}} \
        -e UID=$(id -u) \
        -e GID=$(id -g) \
        -e USERNAME=$(whoami) \
        -e WORKDIR=$(pwd) \
        -v $(pwd):$(pwd) \
        hermetic/{{ARCH}}:latest \
        {{COMMAND}}
