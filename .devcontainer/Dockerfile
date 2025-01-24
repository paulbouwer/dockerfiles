FROM ubuntu:24.04

# install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        bash-completion \
        ca-certificates \
        curl \
        fzf \
        git \
        jq \
        less \
        vim \
    && echo "" >> ~/.bashrc \
    && echo ". /etc/bash_completion" >> ~/.bashrc \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p ~/completions

WORKDIR /workspaces
CMD bash