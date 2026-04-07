#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs
ALERTFILE=$LOGFILE/alerts.log

echo -e "${BLUE}====================================="
echo "     SYSTEM MONITORING DASHBOARD	   "
echo -e "=====================================${NC}"

echo ""
echo "DATE: $(date)"

echo ""
echo -e "${YELLOW}----- Service Status -----${NC}"

if systemctl is-active --quiet nginx
then
	echo -e "Nginx status: ${GREEN}RUNNING${NC}"
else
	echo -e "Nginx status: ${RED}STOPPED${NC}"
fi

echo ""
echo -e "${YELLOW}----- System Health -----${NC}"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "CPU Usage: $CPU%" 
echo "Memory Usage: $MEM"
echo "Disk Usage: $DISK"

echo ""
echo -e "${YELLOW}----- Alert Summary -----${NC}"

CRITICAL_COUNT=$(grep "CRITICAL" $ALERTFILE | wc -l)

if [ "$CRITICAL_COUNT" -gt 0 ]
then
	echo -e "Total Critical Alerts: ${RED}$CRITICAL_COUNT${NC}"
else
	echo -e "Total Critical Alerts: ${GREEN}$CRITICAL_COUNT${NC}"
fi

echo ""
echo "====================================="
