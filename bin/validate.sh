#!/bin/bash

processesNum=`ps -ef|grep  spring-boot-demo | grep 8088 | grep -v grep | wc -l | sed 's/ //g'`
ps -ef|grep  spring-boot-demo | grep 8088 | grep -v grep
echo process number is $processesNum
if [ "$processesNum" == "1" ];then
    echo app deployed successfully!
    exit 0
else
    echo app deployed failed!
    exit 1
fi
