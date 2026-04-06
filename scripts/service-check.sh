#!/bin/bash

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/system.log

echo "===== SYSTEM CHECK $(date) =====" >> $LOGFILE

SERVICES=("nginx" "ssh")

for SERVICE in "${SERVICES[@]}"
do
	echo "Checking service: $SERVICE" >> $LOGFILE
	if systemctl is-active --quiet $SERVICE
	then
		echo "$SERVICE is running" >> $LOGFILE
	else
		echo "$SERVICE is NOT running - Restarting..." >> $LOGFILE

		sudo systemctl restart $SERVICE

		echo "$SERVICE restarted at $(date)" >> $LOGFILE

	fi
done

echo "" >> $LOGFILE
