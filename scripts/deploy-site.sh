#!/bin/bash

LOGFILE=/home/vagrant/DevOps/phase1-monitoring-project/logs/system.log

echo "Deploying website..." >> $LOGFILE

sudo cp /home/vagrant/DevOps/phase1-monitoring-project/website/index.html /var/www/html/index.nginx-debian.html

sudo systemctl restart nginx

echo "Deployement completed at $(date)" >> $LOGFILE
