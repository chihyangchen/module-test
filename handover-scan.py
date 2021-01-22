#!/usr/bin/python

# Script composed by Young Chen
# This script is to do the experiment outside measuring the cell information.

# test flow (The harddisk must be linked on the plateform.)
# 1. initialize a ramdisk directory in the /tmp 
# 2. send ATE0 to disable the echo function from module
# 3. cat the return value to a log file
# 4. QLog to /tmp/ramdisk  
# 5. periodically check the files and move them to HDD
# Output files will be
	# log: at command return value
	# file-time-log: time of qxdm files  
	# tcp-file: tcpdump file

import os
import sys





if __name__ == '__main__':


	# top to monitor	

	# 
	# print(sys.argv[0])
	if (sys.argv[1] == 'set'):
		print('set')
		os.system('echo "true" > enable')		
		os.system('./MRT-test.sh ramdisk')
		os.system('./MRT-test.sh exp_init')
		os.system('./MRT-test.sh exp')
		# os.system('tcpdump net 140.112.20.182 -w tcpdump-files/tcp-file- -C 500M &')
		# os.system('/home/work/quectel/QLog -s /tmp/ramdisk')

	if (sys.argv[1] == 'start'):
		print('start to iperf')
		os.system('python iperf-script-UL.py &')
		os.system('python iperf-script-DL.py &')
		os.system('/home/work/quectel/QLog -s /tmp/ramdisk')


	if(sys.argv[1] == 'stop'):
		os.system('echo "false" > enable')
		os.system('killall -9 tcpdump net 140.112.20.182 -w tcpdump-files/tcp-file- -C 500M')
		os.system('killall -9 python iperf-script-UL.py')
		os.system('killall -9 python iperf-script-DL.py')
	# 

	# thread for experiment
	# while loop script of iperf for UL -D
	# while loop script of iperf for DL -D



	# stop echo "false" > enable time to stop? variable=input() in while loop