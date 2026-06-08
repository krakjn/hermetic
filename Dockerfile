FROM debian:13

SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

ENV DEBIAN_FRONTEND=noninteractive
RUN <<DEPS
apt-get update
apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    sudo \
    build-essential \
    curl \
    ncurses-dev
rm -rf /var/lib/apt/lists/*
curl -fsSL https://just.systems/install.sh | bash -s -- --to /usr/local/bin
DEPS

# Configure sudo to work without password for any user ID
RUN echo 'ALL ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

COPY <<'EOF' /entrypoint.sh
#!/bin/bash
set -e

# Create group first if it doesn't exist
if ! getent group ${GID:-1000} >/dev/null 2>&1; then
    groupadd -g ${GID:-1000} ${USERNAME:-hermes}
fi

# assume user mounts thier cwd from a home directory
# so we create a user without home
useradd --no-create-home \
        --no-user-group \
        -u ${UID:-1000} \
        -g ${GID:-1000} \
        -G sudo \
        -s /usr/bin/bash \
        ${USERNAME:-hermes}

# If no arguments provided, default to bash
if [ $# -eq 0 ]; then
    exec su --pty -l ${USERNAME:-hermes} -c "cd ${WORKDIR:-/workspace} && exec /usr/bin/bash"
else
    exec su --pty -l ${USERNAME:-hermes} -c "cd ${WORKDIR:-/workspace} && $*"
fi
EOF

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]