#!/bin/bash

# AT port
device='/dev/ttyUSB2'
# time duration to check
t_check=0
t_up=10
cat "$device" > log &
sleep 0.5


echo 'ATE0' >> "$device"
echo 'AT' >> "$device"


test1(){
for i in {1..5}
do
	echo 'at+qeng="servingcell"' >> "$device"
	sleep 0.5
	echo 'at+QLTS=2' >> "$device"
	sleep 0.5

	if [ $t_check == $t_up ]
	then
		t_check=0
		echo "$t_check"
		echo "reset"
	else
		t_check=$((t_check+1))
		echo "$t_check"
		echo "counting"
	fi

done

killall cat
cat log
}

ramdisk()
{
	mkdir /tmp/ramdisk
	chmod 777 /tmp/ramdisk
	mount -t tmpfs -o size=2G tmpfs /tmp/ramdisk/
	touch /tmp/ramdisk/initialfile
       	echo "/tmp/ramdisk initialization done"
	df -h	
}
ramdiskfree()
{
	moveall
	umount /tmp/ramdisk
	rm -r /tmp/ramdisk/
}

moveall()
{
	mv /tmp/ramdisk/* ./
}


check()
{
	numoffile=`find /tmp/ramdisk -maxdepth 1 -type f | wc -l`
	echo "$numoffile"
	filename=`ls /tmp/ramdisk -t | tail -1`
#      	echo "$filename"
	curdir=$PWD
#	echo "$curdir"
	if [ $numoffile -gt 1 ]
	then
		mv /tmp/ramdisk/"$filename" "$curdir"/"$filename"
		echo "$filename moving done"
	else
		echo "No target file to be moved"
	fi
}

exp()
{
	for i in {1..100}
	do
		echo 'at+qeng="servingcell"' >> "$device"
		sleep 0.5
		echo 'at+QLTS=2' >> "$device"
		sleep 0.5

		if [ $t_check == $t_up ]
		then
			t_check=0
			echo "$t_check"
			echo "reset & checking"
			check
		else
			t_check=$((t_check+1))
			echo "counting $t_check"
		fi
	
	done

	killall cat
	cat log
}
# testing start
$1
