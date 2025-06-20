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
     -v "$(pwd)/terraform:/var/www/terraform" \
     php_app
   ```
   The app will be available at [http://localhost:8181](http://localhost:8181).

The container adds `www-data` to the `docker` group. The Dockerfile assumes the
group has the ID `999`. If your host (for example under WSL) uses a different
GID, update the `groupadd` command before building. You can obtain the correct
ID with:

```bash
stat -c '%g' /var/run/docker.sock
```

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
