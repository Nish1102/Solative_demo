```markdown
# Ansible Playbook: Dependencies Setup for Ubuntu

This Ansible playbook automates the installation of essential packages like Docker, MySQL, Apache2, and more, for setting up a server on Ubuntu.

## Playbook Overview

The playbook performs the following tasks:

1. Updates apt package cache.
2. Installs prerequisite packages for Docker.
3. Adds Docker GPG key and repository.
4. Installs Docker, MySQL, and Apache2.
5. Pulls and runs an NGINX Docker container with ephemeral storage.

## Prerequisites

- Ansible installed on your local machine.
- Ubuntu server (18.04 or later).

### How to Use

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Nish1102/Solative_demo.git
   ```

2. **Navigate to the directory**:
   ```bash
   cd Solative_demo/ansible-playbook-setups
   ```

3. **Run the playbook**:
   ```bash
   ansible-playbook dependencies.yml
   ```

### Customization

You can modify the Docker image, volumes, or services in the `dependencies.yml` file as per your project requirements.
