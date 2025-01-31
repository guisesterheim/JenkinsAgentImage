FROM jenkins/inbound-agent

CMD ["bash"]

USER root

# Add base packages
RUN apt-get update && apt-get install -y curl vim wget sudo jq

# Install AWS cli
RUN apt-get update && apt-get install -y awscli

# Install kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]