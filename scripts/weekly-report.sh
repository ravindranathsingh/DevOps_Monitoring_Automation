#!/bin/bash

LOGDIR=/home/vagrant/DevOps/phase1-monitoring-project/logs
ALERTFILE=$LOGDIR/alerts.log
REPORTFILE=$LOGDIR/weekly-report.log

echo "===== Weekly Report $(date) =====" >> $REPORTFILE

TOTAL=$(wc -l < $ALERTFILE 2>/dev/null)

CRITICAL=$(grep -c "CRITICAL" $ALERTFILE 2>/dev/null)

WARNING=$(grep -c "WARNING" $ALERTFILE 2>/dev/null)

if systemctl is-active --quiet nginx
then
	SYSTEM_STATUS="RUNNING"
else
	SYSTEM_STATUS="STOPPED"
fi

echo "System Status: $SYSTEM_STATUS" >> $REPORTFILE
echo "Total Alerts: $TOTAL" >> $REPORTFILE
echo "Critical Alerts: $CRITICAL" >> $REPORTFILE
echo "Warning Alerts: $WARNING" >> $REPORTFILE

echo "=================================================" >> $REPORTFILE
echo "" >> $REPORTFILE
