#!/usr/bin/env bash
# This script manages permissions for vault files

# Function to update file permissions
update_permission() {
    local file=$1
    local default_perm=$2
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "File: $file"
    echo "Current permissions:"
    ls -l ~/secure_vault/$file
    echo ""
    
    read -p "Do you want to update permissions? (y/n or press Enter for default): " choice
    
    if [ "$choice" = "y" ]; then
        read -p "Enter new permission (e.g., 600): " new_perm
        chmod $new_perm ~/secure_vault/$file
        echo " Permission updated to $new_perm"
    elif [ -z "$choice" ]; then
        # User pressed Enter (empty input) - use default
        chmod $default_perm ~/secure_vault/$file
        echo " Applied default permission: $default_perm"
    else
        echo "Keeping current permission"
    fi
    echo ""
}

# Main script starts here
echo " Vault Permission Manager"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Step 1: Check if vault exists
if [ ! -d ~/secure_vault ]; then
    echo " ERROR: secure_vault directory does not exist!"
    echo "Please run vault_setup.sh first."
    exit 1
fi

# Step 2: Update permissions for each file
update_permission "keys.txt" "600"
update_permission "secrets.txt" "640"
update_permission "logs.txt" "644"

# Step 3: Display final permissions
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Final Permissions Summary:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ls -l ~/secure_vault
echo ""
echo " Permission management complete!"
