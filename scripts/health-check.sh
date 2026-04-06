#!/bin/bash

LOGFILE=/home/vagrant/phase1-monitoring-project/logs/system.log

echo "===== HEALTH CHECK $(date) =====" >> $LOGFILE

echo "CPU load: " >> $LOGFILE

top -b -n1 | head -5 >> $LOGFILE

echo "Memory usage: " >> $LOGFILE

free -h >> $LOGFILE

echo "Disk usage: " >> $LOGFILE

df -h >> $LOGFILE

echo "" >> $LOGFILE
