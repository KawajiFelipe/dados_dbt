FROM jenkins/jenkins:lts-jdk17

USER root

# Instala o cliente Docker para que o Jenkins possa rodar comandos docker
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

# Volta para o usuário jenkins por segurança
USER jenkins