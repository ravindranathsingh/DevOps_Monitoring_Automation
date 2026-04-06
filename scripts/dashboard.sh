#!/bin/bash

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs
ALERTFILE=$LOGFILE/alerts.log

echo "====================================="
echo "     SYSTEM MONITORING DASHBOARD	   "
echo "====================================="

echo ""
echo "DATE: $(date)"

echo ""
echo "----- Service Status -----"

if systemctl is-active --quiet nginx
then
	echo "Nginx status: RUNNING"
else
	echo "Nginx status: STOPPED"
fi

echo ""
echo "----- System Health -----"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "CPU Usage: $CPU%" 
echo "Memory Usage: $MEM"
echo "Disk Usage: $DISK"

echo ""
echo "----- Alert Summary -----"

CRITICAL_COUNT=$(grep "CRITICAL" $ALERTFILE | wc -l)

echo "Total Critical Alerts: $CRITICAL_COUNT"

echo ""
echo "====================================="
