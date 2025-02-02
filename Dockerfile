# Version 1.0.1
FROM node:22-alpine

# Install base and dev packages
RUN apk update && \
    apk add --no-cache \
    bash \
    make \
    curl \
    openssh \
    git \
    jq \
    python3 \
    py3-pip \
    groff \
    less \
    gcc \
    python3-dev \
    libffi-dev \
    musl-dev \
    openssl-dev

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install AWS CLI and EB CLI
RUN pip3 install --no-cache-dir awscli awsebcli && \
    rm -rf /var/cache/apk/*

# Install global Node.js packages
RUN yarn global add typescript pnpm

CMD ["/bin/bash"]