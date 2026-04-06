#!/bin/bash

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs
SUMMARYFILE=$LOGFILE/summary.log

echo "===== MULTI LOG SCAN $(date) =====" >> $SUMMARYFILE

for file in $LOGFILE/*.log
do
	echo "Scanning file: $file" >> $SUMMARYFILE
	ERROR_COUNT=$(grep "CRITICAL" $file | wc -l)
	echo "Critical count in $file : $ERROR_COUNT" >> $SUMMARYFILE
	echo "-------------------------" >> $SUMMARYFILE
done

