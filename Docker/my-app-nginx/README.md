# NGINX Web Server in Docker with Docker Compose

This project sets up a simple NGINX web server inside a Docker container using the official NGINX image as a base. Docker Compose is used to manage the container configuration.

## Prerequisites

Make sure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Docker Compose Overview

The `docker-compose.yml` file:

1. **Defines a service** named `web` that uses the current directory (`.`) as the build context.
2. **Exposes port 8081** on the host and maps it to port 80 in the container, allowing you to access the web server at `http://localhost:8081`.

### NGINX Dockerfile Overview

The `Dockerfile`:

1. **Uses the official NGINX image** as the base image.
2. **Copies the `index.html` file** into the NGINX default web server directory (`/usr/share/nginx/html/`).
3. **Exposes port 80** in the container to serve HTTP traffic.
4. **Runs NGINX in the foreground** to keep the container active (`daemon off;`).

## Setting Up and Running the Application

### 1. Clone the Repository

If you're using a version control system, clone the repository or download the files into your working directory.

### 2. Add the `index.html` File

Make sure you have an `index.html` file in the same directory as your `Dockerfile`. This will be the webpage served by NGINX.

### 3. Build and Run with Docker Compose

To build and run the NGINX web server using Docker Compose, navigate to the directory containing the `docker-compose.yml` file and run:

```bash
docker-compose up --build
