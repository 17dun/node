#!/bin/bash
cd /home/work/opbin/crontab/logrotate_all/bin;
./backuplog.sh -D 01 -S 3 -P /home/work/node-tcwise/log/ -F tcwise.log,resinfo.log,tcwise.log.rig -T h -B ./log_bak/ -X 1
./backuplog.sh -D 02 -S 3 -P /home/work/node-tcwise/log/ -F tcwise.log.wf -T h -B ./log_bak/ -X 1
