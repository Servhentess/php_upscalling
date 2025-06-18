FROM php:8.3-apache-bullseye
RUN echo "🟣 Dockerfile is running..."
COPY src/ /var/www/html/