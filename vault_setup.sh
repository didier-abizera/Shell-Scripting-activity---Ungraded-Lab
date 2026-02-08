#!/usr/bin/env bash 
# This script sets up the secure vault system

# Step 1: Create the main vault directory 
echo "Setting up secure vault..."
mkdir -p ~/secure_vault 

# Step 2: Create the 3 required files 
touch ~/secure_vault/keys.txt
touch ~/secure_vault/secrets.txt
touch ~/secure_vault/logs.txt

# Steps 3: Add welcome messages to each file 
echo "Welocome to the encryption keys vault" > ~/secure_vault/keys.txt
echo "Welocome to the encryption keys vault" > ~/secure_vault/secrets.txt
echo "Welocome to the encryption keys vault" > ~/secure_vault/logs.txt

# Step 4: Print success message 
echo " Vault created successfully!"
echo ""
echo "Files in secure_vault:"
ls -l ~/secure_vault
