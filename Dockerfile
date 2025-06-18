FROM php:8-apache
RUN echo "🟣 Dockerfile is running..."
COPY src/ /var/www/html/
RUN ls -la /var/www/html/