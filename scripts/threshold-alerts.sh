#!/bin/bash

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/alerts.log
THRESHOLDFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/thrshold.log
THRESHOLD=2

echo "===== THRESHOLD CHECK $(date) =====" >> $THRESHOLDFILE

CRITICAL_COUNT=$(grep "CRITICAL" $LOGFILE | wc -l) >> $THRESHOLDFILE

echo "Total Critical alerts : $CRITICAL_COUNT"  >> $THRESHOLDFILE

if [ $CRITICAL_COUNT -gt $THRESHOLD ]
then
	echo "HIGH ALERTS: TOO MANY CRITICAL ALERTS!" >> $THRESHOLDFILE
else
	echo "SYSTEM IS UNDER CONTROL" >> $THRESHOLDFILE
fi


