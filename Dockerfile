FROM php:8.3-apache-bullseye

# Installe Terraform
RUN apt-get update && \
    apt-get install -y wget unzip gnupg && \
    wget https://releases.hashicorp.com/terraform/1.8.2/terraform_1.8.2_linux_amd64.zip && \
    unzip terraform_1.8.2_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform_1.8.2_linux_amd64.zip

# Ajoute l'utilisateur www-data au groupe docker (GID a adapter selon l'hote)
RUN groupadd -g 999 docker && usermod -aG docker www-data
    
COPY src/ /var/www/html/
