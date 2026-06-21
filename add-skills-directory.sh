#!/bin/bash

# Script to add the current git repository root as a skills directory in pi settings

SETTINGS_FILE="$HOME/.pi/agent/settings.json"
CURRENT_DIR="$(pwd)"

# Check if settings file exists
if [ ! -f "$SETTINGS_FILE" ]; then
    echo "Settings file not found at $SETTINGS_FILE"
    exit 1
fi

# Add current directory to skills array in the settings JSON
jq --arg dir "$CURRENT_DIR" '.skills += [$dir]' "$SETTINGS_FILE" > "${SETTINGS_FILE}.tmp" && mv "${SETTINGS_FILE}.tmp" "$SETTINGS_FILE"

echo "Added skills directory '$CURRENT_DIR' to pi settings"