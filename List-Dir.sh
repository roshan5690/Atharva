#!/bin/bash

DIR_HOME="/home"
HOME_FILE_DATA="home-data.txt"
COUNT=1

for i in `cat Node_List`; do

count=$(ping -c $COUNT $i |grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')

if [ $count != $COUNT ]; then
     echo "Node is not reachable $i" >> Server-Not-reachable.txt
else

   ssh root@$i  ls -lart $DIR_HOME |grep ^d |awk '{print $9}'|cut -f 2 -d'.' >> $HOME_FILE_DATA

fi

done
