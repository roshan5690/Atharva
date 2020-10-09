#!/bin/bash

COUNT=2

LOGFILE="/var/log/Solarwind-Agent-Install.log"
LOGDATE=$(date +"%d-%m-%Y")



function log {

   if [ $# -lt 1 ]; then
        echo "Logging failed due to insufficient parameters"
        exit 1
    fi
    for log in ${LOGDIR[@]}; do
        echo "$LOGDATE $1" >> $LOGFILE
    done
}


function Agen_Install {
for i in `cat Node_List-2`; do
    count=$(ping -c $COUNT $i |grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }') >> $LOGFILE
        if [ $count != $COUNT ]; then
            log echo "Node is not reachable $i " >> $LOGFILE

        else

        if [ $(ssh root@$i [[ -f /etc/redhat-release ]]; echo $?) -eq 0 ]; then
            scp REDHAT-CE-Command.sh root@$i:~
            ssh root@$i yum remove -y swiagent
            sleep 30
            ssh root@$i sh /root/REDHAT-CE-Command.sh
            sleep 60
        elif [ $(ssh root@$i [[ -f /etc/os-release ]]; echo $?) -eq 0 ]; then
            scp SLES-Command.sh root@$i:~
#            ssh root@$i zypper remove -y swiagent
#            sleep 30
            ssh root@$i sh /root/SLES-Command.sh
            sleep 60

        else
            if [ $(ssh root@$i [[ -f /etc/SuSE-release ]]; echo $?) -eq 0 ]; then
              scp SLES-Command.sh root@$i:~
 #             ssh root@$i zypper remove -y swiagent
 #             sleep 30
              ssh root@$i sh /root/SLES-Command.sh
              sleep 60

            fi
        fi
        fi



done

}
