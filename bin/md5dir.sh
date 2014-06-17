#!/bin/bash
echo "第一个参数为目录,先删除目录下的.svn 再做md5,否则部署不通过"
find $1 -type d -name ".svn"|xargs rm -rf;
find $1 -type f -not \( -name '.svn' \) -exec md5sum {} \; >$1.md5
