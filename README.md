# Monitoring Automation Project

## Project Overview

This project is a Linux-based DevOps monitoring system built using Bash scripting and Cron jobs.
It monitors system services, system health, logs, and generates alerts automatically.

The system simulates real-world monitoring tools using lightweight shell scripts.

---

## Technologies Used

- Linux (Ubuntu)
- Bash Scripting
- Cron Jobs
- Git & GitHub
- Nginx Web Server

---

## Project Structure

phase1-monitoring-project/

scripts/ → All monitoring scripts
logs/ → Log files
backups/ → Backup files 
website/ → Sample deployed website

---

## Architecture Diagram

User
   │
   ▼
Cron Scheduler
   │
   ▼
Monitoring Scripts
(service-check, health-check, alerts)
   │
   ▼
Log Files Generated
   │
   ▼
Dashboard & Reports

---

## Features

Service Monitoring (Nginx)
CPU, Memory, Disk Health Checks
Automatic Alert Generation
Threshold-based Alerts
Notification System
Log Rotation
Log Cleanup
Multi-log Scanning
Monitoring Dashboard
Cron-based Automation

---

## Scripts Included

- service-check.sh → Monitors nginx service
- health-check.sh → Monitors CPU, memory, disk
- alert.sh → Generates alerts
- threshold-alerts.sh → Checks alert thresholds
- notification.sh → Sends notifications
- log-analyzer.sh → Analyzes logs
- multi-log-scanner.sh → Scans multiple logs
- log-rotate.sh → Rotates logs
- cleanup-logs.sh → Deletes old logs
- dashboard.sh → Displays monitoring dashboard
- deploy-site.sh → Deploys sample website
- backup.sh → Creates compressed backup of website files.
- system-report.sh → Generates periodic system reports
- alerts-history.sh → Tracks alert history
- weekly-report.sh → Generates weekly reports
- restore-backup.sh → Restores latest backup

---

## Cron Jobs Used

Service check → Every 1 minute
Health check → Every 5 minutes
Alert system → Every 2 minutes
Threshold check → Every 3 minutes
Notification check → Every 4 minutes
Log rotation → Daily
Log cleanup → Daily

---

## How to Run

Clone the repository:

git clone https://github.com/ravindranathsingh/DevOps_Monitoring_Automation.git

Navigate to scripts folder:

cd scripts

Run dashboard:

./dashboard.sh

---

## Sample Dashboard Output

Displays:

- Service Status
- CPU Usage
- Memory Usage
- Disk Usage
- Critical Alerts Count

---

## Reporting System

The project generates system reports automatically.

system-report.sh → Generates system status reports periodically.

alerts-history.sh → Tracks alert counts and history.

weekly-report.sh → Generates weekly monitoring summary.

Reports are stored inside:

logs/system-report.log
logs/alerts-history.log 
logs/weekly-report.log

---

## Learning Outcome

This project demonstrates:

- Linux system monitoring
- Bash scripting automation
- Cron scheduling
- Log management
- DevOps workflow practices
- Git version control

---

## Author

Ravindranath Singh
