FROM oven/bun:1.3.5

RUN apk update && \
    apk add --no-cache \
    bash \
    make \
    curl \
    openssh-client \
    git \
    jq \
    aws-cli \
    groff \
    less  

CMD ["/bin/bash"]
