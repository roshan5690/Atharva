#!/bin/bash

JOB_PID=`ps -ef |grep sshd |grep -v grep | awk '{print $2}' |

for JOB_KILL in $JOB_PID
do
    echo $JOB_KILL
done
