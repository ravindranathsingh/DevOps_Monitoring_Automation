#!/bin/bash

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/alerts.log
REPORTFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/report.log

echo "===== LOG ANALYSIS $(date) =====" >> $REPORTFILE

CRITICAL_COUNT=$(grep "CRITICAL" $LOGFILE | wc -l)
echo "Total CRITICAL alerts: $CRITICAL_COUNT" >> $REPORTFILE

WARNING_COUNT=$(grep "WARNING" $LOGFILE | wc -l)
echo "Total WARNING alerts: $WARNING_COUNT" >> $REPORTFILE
