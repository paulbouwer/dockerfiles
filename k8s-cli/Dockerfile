FROM ubuntu:24.04

ARG KUBECTL_VERSION
ARG HELM_VERSION
ARG NUSHELL_VERSION
ARG CARAPACE_VERSION
ARG GUM_VERSION

#
# Install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        fzf \
        git \
        jq \
        yq \
        less \
        vim \
    && rm -rf /var/lib/apt/lists/*

#
# Install nushell for shell
COPY nushell/config.nu /tmp/nushell/config.nu
RUN mkdir nushell-$NUSHELL_VERSION \
    && curl -LO "https://github.com/nushell/nushell/releases/download/${NUSHELL_VERSION}/nu-${NUSHELL_VERSION}-x86_64-unknown-linux-gnu.tar.gz" \
    && tar -xzf ./nu-${NUSHELL_VERSION}-x86_64-unknown-linux-gnu.tar.gz -C ./nushell-${NUSHELL_VERSION} --strip-components 1 \
    && mv ./nushell-${NUSHELL_VERSION}/nu /usr/local/bin/nu \
    && chmod +x /usr/local/bin/nu \
    && rm -fr ./nushell-${NUSHELL_VERSION} \
    && rm -f ./nu-${NUSHELL_VERSION}-x86_64-unknown-linux-gnu.tar.gz \
    && mkdir -p ~/.config/nushell \
    && mv /tmp/nushell/config.nu ~/.config/nushell/config.nu

#
# Install carapace for shell completions for all binaries
RUN mkdir carapace-$CARAPACE_VERSION \
    && curl -LO "https://github.com/carapace-sh/carapace-bin/releases/download/v${CARAPACE_VERSION}/carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz" \
    && tar -xzf ./carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz carapace \
    && mv ./carapace /usr/local/bin/carapace \
    && chmod +x /usr/local/bin/carapace \
    && rm -f ./carapace-bin_${CARAPACE_VERSION}_linux_amd64.tar.gz \
    && mkdir -p ~/.cache/carapace \
    && carapace _carapace nushell > ~/.cache/carapace/init.nu

#
# Install gum for awesome interactive shell functions
RUN curl -LO "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_Linux_x86_64.tar.gz" \
    && tar -xzf ./gum_${GUM_VERSION}_Linux_x86_64.tar.gz gum_${GUM_VERSION}_Linux_x86_64/gum --strip-components 1 \
    && mv ./gum /usr/local/bin/gum \
    && chmod +x /usr/local/bin/gum \
    && rm -f ./gum_${GUM_VERSION}_Linux_x86_64.tar.gz

#
# Install kubectl and related Kubernetes tools
COPY nushell/kube-context.nu /tmp/nushell/kube-context.nu
RUN curl -L -o /usr/local/bin/kubectl "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x /usr/local/bin/kubectl \
    && mv /tmp/nushell/kube-context.nu ~/.config/nushell/kube-context.nu

# install helm
RUN mkdir helm-$HELM_VERSION \
    && curl -L "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | tar xz -C helm-${HELM_VERSION} --strip-components 1 \
    && mv ./helm-$HELM_VERSION/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && rm -fr ./helm-$HELM_VERSION

# configure startup message with installed versions
COPY ./start-message.txt /tmp/start-message.txt
RUN sed -i s/{{KUBECTL_VERSION}}/${KUBECTL_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{HELM_VERSION}}/${HELM_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{NUSHELL_VERSION}}/${NUSHELL_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{CARAPACE_VERSION}}/${CARAPACE_VERSION}/ /tmp/start-message.txt \
    && sed -i s/{{GUM_VERSION}}/${GUM_VERSION}/ /tmp/start-message.txt \
    && mv /tmp/start-message.txt ~/start-message.txt

# configure bash prompt
COPY ./k8s.omp.json /tmp/k8s.omp.json
RUN curl -L -o /usr/local/bin/oh-my-posh "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64" \
    && chmod +x /usr/local/bin/oh-my-posh \
    && mkdir ~/.oh-my-posh \
    && mv /tmp/k8s.omp.json ~/.oh-my-posh/k8s.omp.json \
    && /usr/local/bin/oh-my-posh init nu --config ~/.oh-my-posh/k8s.omp.json

WORKDIR /workspace
CMD [ "nu" ]
