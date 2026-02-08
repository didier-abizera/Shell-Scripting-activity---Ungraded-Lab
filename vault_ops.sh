#!/usr/bin/env bash
# Vault Operations - Menu-driven secret management system

# Define file paths
VAULT_DIR=~/secure_vault
SECRETS_FILE=$VAULT_DIR/secrets.txt
LOGS_FILE=$VAULT_DIR/logs.txt
KEYS_FILE=$VAULT_DIR/keys.txt

# Main menu loop
while true; do
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "SECURE VAULT OPERATIONS"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "1. Add Secret"
    echo "2. Update Secret"
    echo "3. Add Log Entry"
    echo "4. Access Keys"
    echo "5. Exit"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    read -p "Choose an option [1-5]: " choice
    
    case $choice in
        1)
            # Option 1: Add Secret
            echo ""
            echo "Adding new secret..."
            read -p "Enter your secret: " secret
            echo "$secret" >> $SECRETS_FILE
            echo "Secret added successfully!"
            ;;
        
        2)
            # Option 2: Update Secret
            echo ""
            echo "Update existing secret"
            echo "Current secrets:"
            cat -n $SECRETS_FILE
            echo ""
            read -p "Enter the text you want to replace: " old_text
            read -p "Enter the new text: " new_text
            
            # Check if the text exists before replacing
            if grep -q "$old_text" $SECRETS_FILE; then
                sed -i "s/$old_text/$new_text/g" $SECRETS_FILE
                echo "Secret updated successfully!"
            else
                echo "No match found."
            fi
            ;;
        
        3)
            # Option 3: Add Log Entry
            echo ""
            echo "Adding log entry..."
            read -p "Enter log message: " log_message
            timestamp=$(date "+%Y-%m-%d %H:%M:%S")
            echo "[$timestamp] $log_message" >> $LOGS_FILE
            echo "Log entry added with timestamp!"
            ;;
        
        4)
            # Option 4: Access Keys (always denied)
            echo ""
            echo "ACCESS DENIED "
            ;;
        
        5)
            # Option 5: Exit
            echo ""
            echo " Exiting Vault Operations. Stay secure!"
            exit 0
            ;;
        
        *)
            # Invalid option
            echo ""
            echo "Invalid option. Please choose 1-5."
            ;;
    esac
done
