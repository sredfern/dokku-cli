# Dokku CLI

A simple command-line interface for managing remote Dokku deployments from your local machine.

## Prerequisites

- SSH access to your Dokku server
- SSH key pair for authentication

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/sredfern/dokku-cli.git
   cd dokku-cli
   ```

2. Make the script executable:
   ```bash
   chmod +x dokku-cli.sh
   ```

3. Create a symbolic link to make it available globally:
   ```bash
   sudo ln -s $(pwd)/dokku-cli.sh /usr/local/bin/dokku-cli
   ```

4. Create your configuration file:
   ```bash
   cp dokku-cli.conf.example ~/.dokku-cli.conf
   ```

5. Edit your configuration file with your Dokku server details:
   ```bash
   nano ~/.dokku-cli.conf
   ```

## Configuration

Edit `~/.dokku-cli.conf` with your Dokku server details:

```bash
# Your Dokku server hostname or IP address
DOKKU_HOST="your-dokku-server.com"

# SSH key to use for authentication
DOKKU_SSH_KEY="~/.ssh/id_rsa"

# Dokku user (usually 'dokku')
DOKKU_USER="dokku"
```

## SSH Key Setup

If you haven't already set up an SSH key for your Dokku server:

1. Generate an SSH key pair:
   ```bash
   ssh-keygen -t rsa -b 4096
   ```

2. Add the public key to your Dokku server:
   ```bash
   cat ~/.ssh/id_rsa.pub | ssh user@your-dokku-server.com "sudo dokku ssh-keys:add admin"
   ```

## Usage

Run Dokku commands on your remote server:

```bash
# List all apps
dokku-cli apps:list

# Get app information
dokku-cli apps:info your-app-name

# Restart an app
dokku-cli ps:restart your-app-name

# View logs
dokku-cli logs your-app-name -t
```

All commands are forwarded to the Dokku instance on your remote server.

## Troubleshooting

If you encounter any issues:

1. Ensure your SSH key is correctly set up and has been added to the Dokku server
2. Verify you can SSH into your Dokku server manually: `ssh dokku@your-dokku-server.com`
3. Check the permissions on the script: `chmod +x dokku-cli.sh`
