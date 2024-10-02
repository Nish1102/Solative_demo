```markdown
# CPU and Memory Usage Monitoring & MySQL Backup Scripts

This repository contains two useful Bash scripts:
1. **check_system_usage.sh**: Monitors CPU and memory usage, along with listing the top memory-consuming processes.
2. **mysql_backup.sh**: Automates the process of backing up a MySQL database.

## Usage

### 1. System Monitoring (check_system_usage.sh)

1. Clone the repository:
   ```bash
   git clone https://github.com/Nish1102/Solative_demo.git
   ```

2. Navigate to the directory:
   ```bash
   cd Solative_demo/CPU\ and\ Memory\ Usage
   ```

3. Make the script executable:
   ```bash
   chmod +x check_system_usage.sh
   ```

4. Run the script:
   ```bash
   ./check_system_usage.sh
   ```

### 2. MySQL Backup (mysql_backup.sh)

1. Make sure to configure the script with your MySQL credentials and backup directory.
   - **DB_USER**: Your MySQL username.
   - **DB_PASSWORD**: Your MySQL password.
   - **DB_NAME**: The name of the database you wish to back up.
   - **BACKUP_DIR**: The directory where the backup files will be stored.

2. Make the script executable:
   ```bash
   chmod +x mysql_backup.sh
   ```

3. Run the script:
   ```bash
   ./mysql_backup.sh
   ```

## Features

- **check_system_usage.sh**:
  - Displays CPU usage.
  - Displays memory usage.
  - Lists the top 5 memory-consuming processes.

- **mysql_backup.sh**:
  - Automates MySQL database backups with a timestamped filename.

```
