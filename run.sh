#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
DEVICES=$(jq --raw-output '.devices | length' $CONFIG_PATH)

# Create devices file with input from options.json
for (( i=0; i < "$DEVICES"; i++ )); do
    STRING=$(jq --raw-output ".devices[$i].string" $CONFIG_PATH)

    {
      echo "$STRING"
    } >> /qsusb/QSUSB/devices
done

echo "Starting"
/qsusb/QSUSB/qsusb
