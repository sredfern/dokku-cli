#!/bin/bash

# dokku-helper: Additional convenience commands for dokku-cli
# Usage: dokku-helper [command] [arguments]

# Path to dokku-cli script
DOKKU_CLI_PATH=$(which dokku-cli)

# Check if dokku-cli is available
if [ -z "$DOKKU_CLI_PATH" ]; then
    echo "Error: dokku-cli not found in