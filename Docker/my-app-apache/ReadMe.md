# Apache Web Server in Docker

This project sets up a simple Apache web server inside a Docker container using the official Ubuntu 20.04 image as a base.

## Prerequisites

Make sure you have the following installed:

- [Docker](https://www.docker.com/get-started)

## Dockerfile Overview

This Dockerfile:

1. **Uses Ubuntu 20.04** as the base image.
2. **Sets an environment variable** to prevent interactive prompts during installation (`DEBIAN_FRONTEND=noninteractive`).
3. **Installs Apache** using `apt-get` without installing recommended but unnecessary packages.
4. **Cleans up** unnecessary files after installation to reduce image size.
5. **Copies the `index.html` file** into the Apache web server root directory (`/var/www/html/`).
6. **Exposes port 80** for web traffic.
7. **Starts Apache** in the foreground using the `apachectl` command.

## Building the Docker Image

To build the Docker image, run the following command in the directory containing your Dockerfile and `index.html` file:

```bash
docker build -t apache-web-server .
