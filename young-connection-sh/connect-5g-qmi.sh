#!/bin/sh

ifconfig wwan0 down
echo Y > /sys/class/net/wwan0/qmi/raw_ip

qmicli -d /dev/cdc-wdm0 --device-open-proxy --wds-start-network="ip-type=4,apn=internet" --client-no-release-cid

ifconfig wwan0 up

udhcpc -f -n -q -t 5 -i wwan0
