#!/usr/bin/env bash
# Vault Monitoring - Security audit and reporting system

# Define paths
VAULT_DIR=~/secure_vault
REPORT_FILE=$VAULT_DIR/vault_report.txt

# Check if vault exists
if [ ! -d "$VAULT_DIR" ]; then
    echo "Error: secure_vault directory not found!"
    exit 1
fi

# Clear previous report and start fresh
> $REPORT_FILE

# Header
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a $REPORT_FILE
echo "VAULT SECURITY MONITORING REPORT" | tee -a $REPORT_FILE
echo "Generated: $(date)" | tee -a $REPORT_FILE
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a $REPORT_FILE
echo "" | tee -a $REPORT_FILE

# Monitor each file in secure_vault
for file in $VAULT_DIR/*.txt; do
    if [ -f "$file" ]; then
        # Extract file information
        filename=$(basename "$file")
        size=$(stat -c%s "$file")
        modified=$(stat -c%y "$file" | cut -d'.' -f1)
        permissions=$(stat -c%a "$file")
        
        # Display file information
        echo " File: $filename" | tee -a $REPORT_FILE
        echo "   Size: $size bytes" | tee -a $REPORT_FILE
        echo "   Last Modified: $modified" | tee -a $REPORT_FILE
        echo "   Permissions: $permissions" | tee -a $REPORT_FILE
        
        # Security check: if permissions are more open than 644
        if [ "$permissions" -gt 644 ]; then
            echo "SECURITY RISK DETECTED" | tee -a $REPORT_FILE
        fi
        
        echo "" | tee -a $REPORT_FILE
    fi
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | tee -a $REPORT_FILE
echo "Monitoring complete! Report saved to: $REPORT_FILE" | tee -a $REPORT_FILE
