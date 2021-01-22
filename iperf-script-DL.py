import os
import sys


if __name__ == '__main__':
	# func = sys.argv[1]
	# port = sys.argv[2]
	file= open('enable','r')
	check=file.readline()
	file.close()
	while (check == 'true\n'):
		os.system('iperf3 -c bouygues.iperf.fr -R -p 9207')
		file= open('enable','r')
		check=file.readline()
		file.close()
	# os.system('echo "false" > enable')
	# print(check)
