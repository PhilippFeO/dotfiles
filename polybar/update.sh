#!/bin/bash

nmb=$(sudo apt-get update > /dev/null && apt-get upgrade -s | grep ^Inst | wc -l)
echo "$nmb" > nmb_updates.txt

