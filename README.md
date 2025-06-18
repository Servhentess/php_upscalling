# PHP Upscalling

This project provides a simple PHP application with Docker and Terraform configurations.

## Docker Setup

1. Build the image:
   ```bash
   docker build -t php_app .
   ```
2. Run the container:
   ```bash
   docker run -p 8080:80 php_app
   ```
   The app will be available at [http://localhost:8080](http://localhost:8080).

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
   This starts a container exposing the app on port 8080.
