FROM ubuntu:20.04

ARG KUBECTL_VERSION
ARG HELM_VERSION
ARG KUBIE_VERSION
ARG AZBROWSE_VERSION

# install bash completion
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

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && kubectl completion bash > ~/completions/kubectl.bash \
    && echo "source ~/completions/kubectl.bash" >> ~/.bashrc \
    && echo "alias k=kubectl" >> ~/.bashrc \
    && echo "complete -o default -F __start_kubectl k" >> ~/.bashrc

# install helm
RUN mkdir helm-$HELM_VERSION \
    && curl -L "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | tar xz -C helm-${HELM_VERSION} --strip-components 1 \
    && cd ./helm-$HELM_VERSION \
    && mv helm /usr/local/bin/ \
    && chmod +x /usr/local/bin/helm \
    && cd ../ \
    && rm -fr ./helm-$HELM_VERSION \
    && helm completion bash > ~/completions/helm.bash \
    && echo "source ~/completions/helm.bash" >> ~/.bashrc

# install kubie
RUN curl -LO https://github.com/sbstp/kubie/releases/download/v$KUBIE_VERSION/kubie-linux-amd64 \
    && chmod +x ./kubie-linux-amd64 \
    && mv ./kubie-linux-amd64 /usr/local/bin/kubie \
    && curl -LO https://raw.githubusercontent.com/sbstp/kubie/master/completion/kubie.bash \
    && mv kubie.bash ~/completions/ \
    && echo "source ~/completions/kubie.bash" >> ~/.bashrc

# configure startup message with installed versions
COPY ./start-message.txt /tmp/start-message.txt
RUN sed -i s/{{KUBECTL_VERSION}}/${KUBECTL_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{HELM_VERSION}}/${HELM_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{KUBIE_VERSION}}/${KUBIE_VERSION}/ /tmp/start-message.txt \
    && mv /tmp/start-message.txt ~/start-message.txt \
    && echo "cat ~/start-message.txt"  >> ~/.bashrc

# configure bash prompt
COPY ./k8s.omp.json /tmp/k8s.omp.json
RUN curl -L https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -o /usr/local/bin/oh-my-posh \
    && chmod +x /usr/local/bin/oh-my-posh \
    && mkdir ~/.oh-my-posh \
    && mv /tmp/k8s.omp.json ~/.oh-my-posh/k8s.omp.json \
    && echo "export KUBECTL_VERSION=${KUBECTL_VERSION}" >> ~/.bashrc \
    && echo 'eval "$(oh-my-posh --init --shell bash --config ~/.oh-my-posh/k8s.omp.json)"' >> ~/.bashrc

RUN echo "alias k=kubectl" >> ~/.bashrc \
    && echo "complete -o default -F __start_kubectl k" >> ~/.bashrc

WORKDIR /workspace
CMD bash
