#!/bin/sh  

moxaip()
{
	:>/etc/resolv.conf
	echo nameserver 10.144.200.13 >> /etc/resolv.conf  
	echo nameserver 10.144.200.12 >> /etc/resolv.conf
	ip route add default via 10.144.25.254

	cat /etc/resolv.conf
	ip route
	echo "Done"
}

delip(){
	route=`ip route | grep "default"`
	ip route del $route
	echo "IP route delete Done"
}

# Connect by the qmi tool

connect()
{
	delip
	cd /home/work/
	./connect-5g-by-qmi.sh
}
linkdown()
{
	ifconfig wwan0 down
	moxaip
}


# here to build and mount a ramdisk 
buildramdisk()
{
	mkdir /tmp/ramdisk
	chmod 777 /tmp/ramdisk
	mount -t tmpfs -o size=2G tmpfs /tmp/ramdisk
}

check()
{
	numoffile=`find /tmp/ramdisk -maxdepth 1 -type f | wc -l`
	echo "$numoffile"
	filename=`ls /tmp/ramdisk -t | tail -1`
       	echo "$filename"
	curdir=$PWD
	echo "$curdir"
	mv /tmp/ramdisk/"$filename" "$curdir"/"$filename"
	echo "$?"	
}
#function

$1




