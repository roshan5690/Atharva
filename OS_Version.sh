#!/bin/bash

for i in `cat test_node`; do
    count=$(ping -c $COUNT $i |grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }') >> Node_down.txt
        if [ $count != $COUNT ]; then
                echo "Node is not reachable $i " >> Node_down.txt

    if ssh root@$i "[ -f /etc/redhat_release ]"; then
        echo "File Exists"
    elif ssh root@$i "[ -f /etc/os-release ]"; then
        echo "File Exists"
    else
        if ssh root@$i "[ -f /etc/SuSE-release ]"; then
            echo "File Exists"
    fi
    fi
done
