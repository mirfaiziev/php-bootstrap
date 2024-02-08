FROM php:8.2-fpm as base

ARG USERNAME=runner 
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME 
# Install system dependencies
RUN apt-get update && apt-get install -y git zip

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . /var/code
WORKDIR /var/code

USER $USERNAME
COPY --chown=runner:runnner ./ ./

FROM base as dev