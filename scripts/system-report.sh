#!/bin/bash

LOGDIR=/home/vagrant/DevOps/phase1-monitoring-project/logs
REPORTFILE=$LOGDIR/system-report.log

echo "===== SYSTEM REPORT $(date) =====" >> $REPORTFILE

if systemctl is-active --quiet nginx
then
	SERVICE_STATUS="RUNNING"
else
	SERVICE_STATUS="STOPPED"
fi

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2}')
DISK=$(df -h / | awk 'NR==2 {print $5}')

ALERTFILE=$LOGDIR/alerts.log
CRITICAL_COUNT=$(grep -c "CRITICAL" $ALERTFILE 2>/dev/null)

echo "Service Status: $SERVICE_STATUS" >> $REPORTFILE
echo "CPU Usage: $CPU%" >> $REPORTFILE
echo "Memory Usage: $MEM" >> $REPORTFILE
echo "Disk Usage: $DISK" >> $REPORTFILE
echo "Critical Alerts: $CRITICAL_COUNT" >> $REPORTFILE

echo "======================================================" >> $REPORTFILE
echo "" >> $REPORTFILE
