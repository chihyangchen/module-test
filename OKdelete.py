print("OK delete")

fname = 'log'
f = open(fname)
output=[]
for line in f:
    if line[0][0] == '+':
        output.append(line)
#    if not "OK" in line:
#        output.append(line)
f.close()
f=open(fname+'new','w')
f.writelines(output)
f.close()



