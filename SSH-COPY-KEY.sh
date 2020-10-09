#!/bin/bash

for ip in `cat Machine_Name`; do
    ssh-ssh-copy-id -i /root/.ssh/id_rsa.pub $ip
done
