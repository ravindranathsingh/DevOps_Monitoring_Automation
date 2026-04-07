#!/bin/bash

BACKUPDIR=/home/vagrant/DevOps/phase1-monitoring-project/backups
WEBSITEDIR=/home/vagrant/DevOps/phase1-monitoring-project/website
LOGDIR=/home/vagrant/DevOps/phase1-monitoring-project/logs

RESTORELOG=$LOGDIR/restore.log

echo "===== Restore Operation $(date) =====" >> $RESTORELOG

LATEST_BACKUP=$(ls -t $BACKUPDIR | head -n 1)

if [ -z "$LATEST_BACKUP" ]
then
	echo "No backup found!" >> $RESTORELOG
	exit 1
fi

echo "Latest Backup found: $LATEST_BACKUP" >> $RESTORELOG

tar -xzf $BACKUPDIR/$LATEST_BACKUP -C $WEBSITEDIR

echo "Website Restored Successfully." >> $RESTORELOG

sudo systemctl restart nginx

echo "Nginx service restarted after Backup restore." >> $RESTORELOG

echo "====================================================" >> $RESTORELOG
echo "" >> $RESTORELOG
