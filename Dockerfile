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
    aws-cli \
    python3 \
    py3-pip \
    groff \
    less

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Install EB CLI
RUN apk add --no-cache \
    python3-dev \
    libffi-dev \
    musl-dev \
    openssl-dev \
    gcc && \
    pip3 install --upgrade pip && \
    pip3 install --no-cache-dir ebcli && \
    apk del python3-dev libffi-dev musl-dev openssl-dev gcc

# Install global Node.js packages
RUN yarn global add typescript pnpm

# Clean up
RUN rm -rf /var/cache/apk/*

CMD ["/bin/bash"]