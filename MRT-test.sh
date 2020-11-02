#!/bin/bash
device='/dev/ttyUSB2'
cat "$device" > log &
sleep 0.5
echo 'ATE0' >> "$device"
#test(){
for i in {1..5}
do
	echo 'at+qeng="servingcell"' >> "$device"
	sleep 0.5
	echo 'at+cclk?' >> "$device"
	sleep 0.5
done

killall cat
cat log
#}




