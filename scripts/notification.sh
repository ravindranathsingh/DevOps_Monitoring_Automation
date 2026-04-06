#!/bin/bash

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/alerts.log
NOTIFYFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/notification.log

THRESHOLD=2

CRITICAL_COUNT=$(grep "CRITICAL" $LOGFILE | wc -l)

echo "===== NOTIFICATION CHECK $(date) =====" >> $NOTIFYFILE

if [ $CRITICAL_COUNT -gt $THRESHOLD ]
then
	echo "NOTIFICATION: Sending alert to Admin!" >> $NOTIFYFILE
	echo "Critical alerts count: $CRITICAL_COUNT" >> $NOTIFYFILE
else
	echo "No Notification is needed" >> $NOTIFYFILE
fi
