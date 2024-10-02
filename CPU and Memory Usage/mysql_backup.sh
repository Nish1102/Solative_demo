
#!/bin/bash

# MySQL credentials
DB_USER="root"  # MySQL username
DB_PASSWORD="your_password"  # MySQL password
DB_NAME="your_database"  # Name of the database you want to back up
BACKUP_DIR="/path/to/backup"  # Directory where backups will be stored

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform MySQL backup
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > "$BACKUP_DIR/${DB_NAME}_backup_$(date +%F_%T).sql"

if [ $? -eq 0 ]; then
    echo "MySQL backup successful! Backup stored in: $BACKUP_DIR/${DB_NAME}_backup_$(date +%F_%T).sql"
else
    echo "MySQL backup failed!"
fi
