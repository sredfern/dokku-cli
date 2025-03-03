#!/bin/bash

# dokku-cli: A simple command-line interface for Dokku
# Usage: dokku-cli [command]

# Configuration
if [ -f ~/.dokku-cli.conf ]; then
    source ~/.dokku-cli.conf
else
    echo "No configuration file found at ~/.dokku-cli.conf"
    echo "Please create one with the following content:"
    echo "DOKKU_HOST=\"your-dokku-server.com\""
    echo "DOKKU_SSH_KEY=\"~/.ssh/id_rsa\""
    echo "DOKKU_USER=\"dokku\""
    exit 1
fi

# Check if SSH key exists
if [ ! -f "${DOKKU_SSH_KEY/#\~/$HOME}" ]; then
    echo "SSH key not found at $DOKKU_SSH_KEY"
    echo "Please generate an SSH key pair with: ssh-keygen -t rsa -b 4096"
    echo "Make sure to add the public key to your Dokku server:"
    echo "cat ${DOKKU_SSH_KEY/#\~/$HOME}.pub | ssh user@$DOKKU_HOST \"sudo dokku ssh-keys:add admin\""
    exit 1
fi

# Forward all arguments to dokku on the remote server
ssh -i "${DOKKU_SSH_KEY/#\~/$HOME}" $DOKKU_USER@$DOKKU_HOST "$@"

