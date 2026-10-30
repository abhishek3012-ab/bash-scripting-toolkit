
# Bash Scripting Toolkit

A collection of real-world Bash scripts designed for Linux
administration, DevOps automation, monitoring, and system management.

## Projects

### 1. Server Health Monitoring
- Monitors CPU, memory, and disk usage.
- Displays system load and top memory-consuming processes.
- Generates a server health report.

### 2. Automated Backup with Retention
- Creates compressed backups using tar.
- Uses timestamps for backup files.
- Automatically removes old backups based on retention days.

### 3. Linux Service Monitoring
- Checks the status of Linux services.
- Identifies stopped or inactive services.
- Returns a failure exit code if any service is down.

### 4. Log Error Analyzer
- Searches application and system log files.
- Identifies ERROR, CRITICAL, and FATAL messages.
- Generates a timestamped error report.

### 5. Application URL Health Checker
- Checks application availability using curl.
- Validates HTTP response codes.
- Identifies unavailable endpoints.

## Technologies & Tools

- Bash Shell Scripting
- Linux Administration
- Git & GitHub
- AWS EC2
- Cron Jobs
- Linux Commands
- Automation & Monitoring

## Requirements

- Linux operating system
- Bash 4+
- Git
- curl (for endpoint monitoring)
- systemd (for service monitoring)

## How to Use

Clone this repository:

    git clone https://github.com/abhishek3012-ab/bash-scripting-toolkit.git

Navigate into the repository:

    cd bash-scripting-toolkit

Give execution permission:

    chmod +x 01-server-monitoring/server_health.sh

Run the script:

    ./01-server-monitoring/server_health.sh

For other scripts, make respective changes.

## Important Notes

- Test scripts in a development environment before production use.
- Review directory paths and permissions before executing backups.
- Some scripts require Linux privileges or systemd.
- Do not commit passwords, API keys, or sensitive server information.

## Author

Abhishek Birajdar

## Purpose

Created to practice and demonstrate practical Bash scripting
skills used in real-world DevOps and Cloud Engineering workflows.
