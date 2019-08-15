#!/bin/sh
echo "stop.sh .........."

ps -ef|grep  spring-boot-demo | grep 8088 | awk '{print "kill -9 " $2}' | bash
processesNum=`ps -ef|grep  spring-boot-demo | grep 8088 | grep -v grep | wc -l | sed 's/ //g'`
if [ "$processesNum" == "0" ];then
    echo stopped app successfully!
    exit 0
else
    echo stopped app failed!
    exit 1
fi
