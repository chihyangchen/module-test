import os
import sys


if __name__ == '__main__':
	# func = sys.argv[1]
	# port = sys.argv[2]
	file= open('enable','r')
	check=file.readline()
	file.close()
	while (check == 'true\n'):
		os.system('iperf3 -c bouygues.iperf.fr -p 9206')
		file= open('enable','r')
		check=file.readline()
		file.close()
	# os.system('echo "false" > enable')
	# print(check)
