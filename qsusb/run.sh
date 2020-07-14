#!/bin/bash
set -e

CONFIG_PATH=/data/options.json
DEVICES=$(jq --raw-output '.devices | length' $CONFIG_PATH)
PORT=$(jq --raw-output ".port" $CONFIG_PATH)

# Create devices file with input from options.json
for (( i=0; i < "$DEVICES"; i++ )); do
    STRING=$(jq --raw-output ".devices[$i].string" $CONFIG_PATH)

    {
      echo "$STRING"
    } >> /qsusb/QSUSB/devices
done

if [ ! -f "$PORT" ]; then
  sed -i "s|2020|$PORT|g" /qsusb/QSUSB/setup.ini
fi

echo "Starting"
/qsusb/QSUSB/qsusb
