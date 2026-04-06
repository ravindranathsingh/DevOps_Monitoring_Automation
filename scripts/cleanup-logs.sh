#!/bin/bash

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs
CLEANUP_LOG=$LOGFILE/cleanup.log

echo "===== LOG CLEANUP $(date) =====" >> $CLEANUP_LOG

find $LOGFILE -name "*.log" -type f -mtime +7 -exec rm {} \;

echo "Older files deleted (only Older than 7 days)" >> $CLEANUP_LOG
