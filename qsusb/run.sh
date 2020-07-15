#!/bin/bash
set -e

echo . && echo ENVIRONMENT - DOCKER BUILD
cat /qsusb/env.txt
echo . && echo ENVIRONMENT - DOCKER RUN
printenv

CONFIG_PATH=/data/options.json
DEVICES=$(jq --raw-output '.devices | length' $CONFIG_PATH)

# Create devices file with input from options.json
for (( i=0; i < "$DEVICES"; i++ )); do
    STRING=$(jq --raw-output ".devices[$i].string" $CONFIG_PATH)
    {
      echo "$STRING"
    } >> /qsusb/QSUSB/devices
done

echo . && echo DEVICES CONFIG
cat /qsusb/QSUSB/devices

echo . && echo LS
ls /qsusb/QSUSB/qsusb* -l

echo "Starting"
[ -f /qsusb/QSUSB/qsusb64 ] && /qsusb/QSUSB/qsusb64
[ -f /qsusb/QSUSB/qsusb ] && /qsusb/QSUSB/qsusb
