#!/bin/bash

PROJECT_DIR=/home/vagrant/DevOps/phase1-monitoring-project
SOURCE_DIR=website
BACKUP_DIR=$PROJECT_DIR/backups
LOGFILE=$PROJECT_DIR/logs/system.log

mkdir -p $BACKUP_DIR

if [ ! -d "$PROJECT_DIR/$SOURCE_DIR" ]
then
	echo "Website folder missing! Backup Failed." >> $LOGFILE
	exit 1
fi

TIMESTAMP=$(date +%y-%m-%d_%H-%M-%S)

echo "===== BACKUP STARTED $TIMESTAMP =====" >> $LOGFILE

tar -czvf $BACKUP_DIR/website_backup_$TIMESTAMP.tar.gz -C $PROJECT_DIR $SOURCE_DIR

echo "===== Backup Completed at $TIMESTAMP =====" >> $LOGFILE
