#!/bin/bash

LOGDIR=/home/vagrant/DevOps/phase1-monitoring-project/logs
ALERTFILE=$LOGDIR/alerts.log
HISTORYFILE=$LOGDIR/alerts-history.log

echo "===== Alerts History $(date) =====" >> $HISTORYFILE

TOTAL=$(wc -l < $ALERTFILE 2>/dev/null)

CRITICAL=$(grep -c "CRITICAL" $ALERTFILE 2>/dev/null)

WARNING=$(grep -c "WARNING" $ALERTFILE 2>/dev/null)

TODAY=$(date "+%b %e")
TODAY_COUNT=$(grep "$TODAY" $ALERTFILE 2>/dev/null | wc -l)

echo "Total Alerts: $TOTAL" >> $HISTORYFILE
echo "Critical Alerts: $CRITICAL" >> $HISTORYFILE
echo "Warning Alerts: $WARNING" >> $HISTORYFILE
echo "Today's ALerts: $TODAY_COUNT" >> $HISTORYFILE

echo "====================================================" >> $HISTORYFILE

echo "" >> $HISTORYFILE
