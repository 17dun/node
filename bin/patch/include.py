#! /home/users/miaoyichan/.jumbo/bin/python
import sys
import os
print 'into include.py'
def complement_path (file, current_path) :
    file = file.strip("\n")
  #  print file
    f = open(file,'r')
    line_list = f.readlines()
    f.close()
    f = open(file,'w')
    for line in line_list :
        #print line+"\r\n"
        #print 1
        if line.find('include file') != -1 :
            #print line+"\r\n"
            #print 2
            start = line.find('../');
            if line.find('../../') != -1 :
                pos1 = current_path.rfind('/')
                current_path1 = current_path[0:pos1]
                pos2 = current_path1.rfind('/')
                current_path1 = current_path1[0:pos2]
                line = line.replace('../../',current_path1+'/')
            elif line.find('../') != -1 :
                pos = current_path.rfind('/')
                current_path2 = current_path[0:pos]
                line = line.replace('../',current_path2+'/')
            elif line.find('./') != -1 :
                line = line.replace('./',current_path+'/')
                #print line+"\r\n"
                #print 3
        f.writelines(line)
            




#complement_path('page.tpl','yundu/iphone.pa')
#sys.exit(0)
def get_tpl_in_dir (dir) :
    # get the relative path of the dir
#    os.system('cd '+dir)
    current_path_tmp = os.popen('pwd').readlines()
    current_path_absolute = current_path_tmp[0].strip("\n")
    path_temp = current_path_absolute.split('template/')
    current_path_relative = path_temp[1]
    
    print current_path_relative
    tpl_list_arr = os.popen('ls *.tpl').readlines()
    print tpl_list_arr
    if(len(tpl_list_arr) <=0 ) :
        print 'no tpl file'
        return 0
    else :
        for tpl_file in tpl_list_arr :
            print tpl_file
            complement_path(tpl_file,current_path_relative) 
    return 1

get_tpl_in_dir(sys.argv[1])
