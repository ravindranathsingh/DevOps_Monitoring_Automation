#!/bin/bash

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/system.log
ALERTFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/alerts.log

echo "===== ALERT CHECK $(date) =====" >> $ALERTFILE

if ! systemctl is-active --quiet nginx
then
	echo "CRITICAL ALERT: nginx is DOWN at $(date)" >> $ALERTFILE
fi

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -gt 80 ]
then
	echo "WARNING: Disk usage is above 80% at $(date)" >> $ALERTFILE
fi
