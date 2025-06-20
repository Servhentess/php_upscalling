# PHP Upscalling

This project provides a simple PHP application with Docker and Terraform configurations.

## Docker Setup

1. Build the image:
   ```bash
   docker build -t php_app .
   ```
2. Run the container (mount the Docker socket so Terraform can manage Docker):
   ```bash
   docker run -p 8181:80 \
     -v /var/run/docker.sock:/var/run/docker.sock \
     php_app
   ```
   The app will be available at [http://localhost:8181](http://localhost:8181).

The container adds `www-data` to the `docker` group (GID `999` by default).
If your host uses a different group ID for Docker, update the Dockerfile accordingly.

## Terraform Setup

Terraform configuration in `terraform/` directory provisions a container using the Docker provider.

1. Initialize Terraform:
   ```bash
   terraform init
   ```
2. Apply the configuration:
   ```bash
   terraform apply
   ```
   This starts a container exposing the app on port 8181.
