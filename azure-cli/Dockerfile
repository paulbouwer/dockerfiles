ARG AZURECLI_VERSION

FROM mcr.microsoft.com/azure-cli:$AZURECLI_VERSION

ARG AZURECLI_VERSION
ARG KUBECTL_VERSION
ARG HELM_VERSION
ENV LANG C.UTF-8

RUN apk add bash-completion --update \
    && echo "" >> ~/.bashrc \
    && echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && mkdir -p ~/completions \
    && kubectl completion bash > ~/completions/kubectl.bash \
    && echo "source ~/completions/kubectl.bash" >> ~/.bashrc \
    && echo "alias k=kubectl" >> ~/.bashrc \
    && echo "complete -o default -F __start_kubectl k" >> ~/.bashrc

RUN mkdir helm-$HELM_VERSION \
    && curl -L "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | tar xz -C helm-${HELM_VERSION} --strip-components 1 \
    && cd ./helm-$HELM_VERSION \
    && mv helm /usr/local/bin/ \
    && chmod +x /usr/local/bin/helm \
    && cd ../ \
    && rm -fr ./helm-$HELM_VERSION \
    && helm completion bash > ~/completions/helm.bash \
    && echo "source ~/completions/helm.bash" >> ~/.bashrc

COPY ./start-message.txt /tmp/start-message.txt

RUN sed -i s/{{AZURECLI_VERSION}}/${AZURECLI_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{KUBECTL_VERSION}}/${KUBECTL_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{HELM_VERSION}}/${HELM_VERSION}/ /tmp/start-message.txt \
    && mv /tmp/start-message.txt ~/start-message.txt \
    && echo "cat ~/start-message.txt"  >> ~/.bashrc

RUN echo "export PS1=$'\n\e[0;37;100m azure-cli \e[0;90;43m\UE0B0\e[0;90;43m ${AZURECLI_VERSION} \e[0;33;44m\UE0B0\e[0;37;44m \w \e[0;34;40m\UE0B0\e[0;39m\n$ '" >> ~/.bashrc
