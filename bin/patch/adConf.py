#! /home/users/miaoyichan/.jumbo/bin/python
import sys
import os
print 'into adConf.py'
def conf (file1, file2) :
    print file1
    print file2
    file1 = file1.strip("\n")
  #  print file
    f = open(file1,'r')
    line_list = f.readlines()
#    print line_list
    f.close()
    f = open(file2,'w')
    i = 0
    new_line = '';
    for line in line_list :
        #print line
        if line == '\r\n':
            continue
        #print line
        line = line.strip('\r\n')
        line = line.strip()
        #print line+"\r\n"
        #print 1
        if line.find('@site') != -1 :
            i = 1
            #print 'site'
            new_line = ''
            #print new_line
        #elif line.find('type:') != -1 :
        elif line.find('type:') != -1 and i==1:
            
            new_line += ' { ' + line[0:4] + ' : ' + "'" + line[5:] + "' },\r\n"
            print new_line
           # print 'type'
            f.writelines(new_line)
#        elif line.find('host:') :
        elif line.find('host') != -1 and i==1 :
            host = line[5:]
            print host
            host.strip()
            new_line += "'" + host + "' :"
            
            #print 'host'
            #print new_line
            #print line+"\r\n"
            #print 2
    
conf(sys.argv[1],sys.argv[2])
