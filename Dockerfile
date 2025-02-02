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

# Install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip

# Install EB CLI using pip
RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir ebcli

# Install global Node.js packages
RUN yarn global add typescript pnpm

# Clean up
RUN rm -rf /var/cache/apk/*

CMD ["/bin/bash"]