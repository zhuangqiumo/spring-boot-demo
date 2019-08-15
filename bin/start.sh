#!/bin/sh
echo "begin starting....."

# cd /opt/fit2cloud-demo
echo going to start app
nohup python -m SimpleHTTPServer 8080 > log.txt 2>&1 &
echo app started!
ps aux | grep SimpleHTTPServer | grep -v grep


echo "end start."


function open_port()
{
    echo 'port opening....'
    centos_version=`cat /etc/redhat-release|sed -r 's/.* ([0-9]+)\..*/\1/'`

    if [[ $centos_version -eq 7 ]];then
        # echo "the centos version 7"
        # firewall-cmd --zone=public --add-port=$port/tcp --permanent
        # echo $?
        # firewall-cmd --reload
        systemctl disable firewalld
        systemctl stop firewalld
        echo $?
    elif [[ $centos_version -eq 6 ]];then
        echo "the centos version 6"
        iptables -I INPUT -p tcp --dport $port -j ACCEPT
        /etc/init.d/iptables save
        service iptables restart
    else
        echo "not match centos version "
    fi
}


open_port