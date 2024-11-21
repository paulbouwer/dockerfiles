ARG AZURECLI_VERSION

FROM mcr.microsoft.com/azure-cli:$AZURECLI_VERSION

ARG AZURECLI_VERSION
ARG KUBECTL_VERSION
ARG HELM_VERSION
ARG AZBROWSE_VERSION
ENV LANG C.UTF-8

# install bash completion
RUN tdnf update -qy tdnf \
    && tdnf -y install \
        bash-completion \
        ca-certificates \
        curl \
        tar \
    && echo "" >> ~/.bashrc \
    && echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && mkdir -p ~/completions \
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

# install azbrowse
RUN mkdir azbrowse-$AZBROWSE_VERSION \
    && curl -L "https://github.com/lawrencegripper/azbrowse/releases/download/v${AZBROWSE_VERSION}/azbrowse_linux_amd64.tar.gz" | tar xz -C azbrowse-$AZBROWSE_VERSION \
    && cd ./azbrowse-$AZBROWSE_VERSION \
    && mv azbrowse /usr/local/bin/ \
    && chmod +x /usr/local/bin/azbrowse \
    && cd ../ \
    && rm -fr ./azbrowse-$AZBROWSE_VERSION \
    && azbrowse completion bash > ~/completions/azbrowse.bash \
    && echo "source ~/completions/azbrowse.bash" >> ~/.bashrc

# configure startup message with installed versions
COPY ./start-message.txt /tmp/start-message.txt
RUN sed -i s/{{AZURECLI_VERSION}}/${AZURECLI_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{KUBECTL_VERSION}}/${KUBECTL_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{HELM_VERSION}}/${HELM_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{AZBROWSE_VERSION}}/${AZBROWSE_VERSION}/ /tmp/start-message.txt \
    && mv /tmp/start-message.txt ~/start-message.txt \
    && echo "cat ~/start-message.txt"  >> ~/.bashrc

# configure bash prompt
COPY ./az.omp.json /tmp/az.omp.json
RUN curl -L https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -o /usr/local/bin/oh-my-posh \
    && chmod +x /usr/local/bin/oh-my-posh \
    && mkdir ~/.oh-my-posh \
    && mv /tmp/az.omp.json ~/.oh-my-posh/az.omp.json \
    && /usr/local/bin/oh-my-posh --init --shell bash --config ~/.oh-my-posh/az.omp.json > ~/.oh-my-posh/init.bash \
    && echo "export AZURECLI_VERSION=${AZURECLI_VERSION}" >> ~/.bashrc \
    && echo 'source ~/.oh-my-posh/init.bash' >> ~/.bashrc

