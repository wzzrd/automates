#!/bin/bash

while true; do
    curl -s loadbalancer.ibm.nontoonyt.com | grep -io "This request was served from: .*\."
    sleep 1
done