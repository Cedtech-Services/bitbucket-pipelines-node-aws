# Version 1.0.1
FROM node:20-alpine

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

# Install global Node.js packages
RUN yarn global add typescript pnpm

# Clean up
RUN rm -rf /var/cache/apk/*

CMD ["/bin/bash"]
