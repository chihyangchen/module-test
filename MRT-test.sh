#!/bin/bash

cat /dev/$1 > $2 &
echo 'at+cclk?' > /dev/$1
killall cat
