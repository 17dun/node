#!/bin/bash
for module in {'tcwise','dict','tcwiseList','newsContent'}
do
    # echo $module;
    cp -v /home/work/node-tcwise/app/$module/conf/tcwiseConf.js.online /home/work/node-tcwise/app/$module/conf/tcwiseConf.js;
done

