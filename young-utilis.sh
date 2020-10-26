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

$1
