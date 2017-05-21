FROM alpine:edge

# Add some packages
RUN apk add --no-cache \
    bash \
    coreutils \
    curl \
    findutils \
    git \
    grep \
    libarchive-tools \
    make \
    openssh-server \
    pciutils \
    tar \
    sed \
    tini \
    util-linux \
    vim \
    wget
# tweak
RUN mkdir -p /etc/bash_completion.d \
    && rm /bin/grep

WORKDIR /root

# Environment
RUN git clone https://github.com/rneugeba/env.git \
    && cp env/misc/git-prompt.sh /etc/bash_completion.d/git-prompt \
    && (cd env && ./setup.sh)

# Install the docker CLI
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 17.05.0-ce
ENV DOCKER_SHA256 340e0b5a009ba70e1b644136b94d13824db0aeb52e09071410f35a95d94316d9
RUN set -x \
    && curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
    && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
    && tar -xzvf docker.tgz \
    && mv docker/docker /usr/bin/ \
    && mv docker/completion/bash/docker /etc/bash_completion.d \
    && rm -rf docker docker.tgz

# Install notary
ENV NOTARY_URL https://github.com/docker/notary/releases/download/v0.4.3/notary-Linux-amd64
ENV NOTARY_SHA256 06cd02c4c2e7a3b1ad9899b03b3d4dde5392d964c675247d32f604a24661f839
RUN set -x \
    && curl -fSL ${NOTARY_URL} -o notary \
    && echo "${NOTARY_SHA256} notary" | sha256sum -c - \
    && mv notary /usr/bin

# setup ssh
RUN mkdir -p /etc/ssh /root/.ssh && chmod 0700 /root/.ssh
COPY authorized_keys /root/.ssh/
COPY ssh.sh /usr/bin/ssh.sh
CMD ["/sbin/tini", "/usr/bin/ssh.sh"]
