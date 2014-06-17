#!/bin/bash

#在启动之前执行的操作
echo "stop node-tcwise-2 "
sh /home/work/node-tcwise-2/bin/tcwise_control stop
sleep 5;
echo "exec copy file start"
sh bin/copy.sh
echo "exec copy file end"

