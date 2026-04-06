#!/bin/bash

LOG_DIR=/home/vagrant/DevOps/phase1-monitoring-project/logs
ARCHIVE_DIR=$LOG_DIR/archive

mkdir -p $ARCHIVE_DIR

TIMESTAMP=$(date +%y-%M-%d_%H-%M-%S)

echo "===== LOG ROTATION STARTED $TIMESTAMP ====="

for LOGFILE in $LOG_DIR/*.log
do
	BASENAME=$(basename $LOGFILE)

	mv $LOGFILE $ARCHIVE_DIR/${BASENAME}_$TIMESTAMP
	echo "Rotated: $BASENAME"
done

echo "===== LOG ROTATION COMPLETED ====="
