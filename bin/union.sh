#! /bin/bash
# author miaoyichan
#2013-11-25
#transfer union ad to node conf named adSite.js

script_path="$(cd $(dirname "$0"); pwd -P)"
[[ ! -f "$script_path" ]] && module_dir="$(dirname $script_path)"


address="wget ftp://10.26.94.9/home/work/datainf/data/export/cprojoinedurl/cprojoinedurl.txt"
rm -f ${module_dir}/bin/cprojoinedurl.txt
rm -f ${module_dir}/bin/ad_host.txt
wget -P ${module_dir}/bin ftp://10.26.94.9/home/work/datainf/data/export/cprojoinedurl/cprojoinedurl.txt
date=$(date +%Y%m%d%H%M$S)

function replace_ad(){
    if [ -f ${module_dir}/bin/adSite.js ]
    then
        cd ${module_dir}/app/tcwise/conf
        if [ -f ${module_dir}/bin/adSite.js ]
        then
            mv ${module_dir}/app/tcwise/conf/adSite.js ${module_dir}/app/tcwise/conf/adSite.js.$date
            cp ${module_dir}/bin/adSite.js ${module_dir}/app/tcwise/conf/adSite.js 
        else
            cp ${module_dir}/bin/adSite.js ${module_dir}/app/tcwise/conf/adSite.js 
        fi
    else
        printf $date,"update adSite.js error because no such file adSite.js is: %d\n"$1 >> ${module_dir}/log/node.log
        exit
    fi

}

function pro_conf(){
    rm -f ${module_dir}/bin/adSite.js
    touch ${module_dir}/bin/adSite.js
    
    if [ $1 -lt 1000 ]
    then
        printf $date,"update adSite.js error because the num of ad_host.txt is: %d\n"$1 >> ${module_dir}/log/node.log
        exit 0
    fi

    echo "module.exports = {" > ${module_dir}/bin/adSite.js
    #type="typeunion"
    type=" : { type : 'union' },"
    last=" : { type : 'union' }"
    awk '{if(i<num-1){printf("\047%s\047%s\n",$1,type);i++;}else printf("\047%s\047%s\n",$1,last)}' type="$type" num="$1" last="$last"  ${module_dir}/bin/ad_host.txt >> ${module_dir}/bin/adSite.js
    echo "}" >> ${module_dir}/bin/adSite.js

    #test the num of adSite.js
    n=$( cat ${module_dir}/bin/adSite.js|wc -l )
    if [ $n -lt 5 ]
    then
        printf $date,"update adSite.js error because the num of adSite.js is: %d\n"$1 >> ${module_dir}/log/node.log
        exit 0
    fi
    
    #replace original adSite.js
    replace_ad
    
    printf $date,"update adSite.js success in %s \n"$date >> ${module_dir}/log/node.log
    rm -f ${module_dir}/bin/ad_host.txt
    rm -f ${module_dir}/bin/cprojoinedurl.txt
    rm -f ${module_dir}/bin/adSite.js

}

function pro_ad(){
    if [ -f ${module_dir}/bin/cprojoinedurl.txt ]
    then
        cat ${module_dir}/bin/cprojoinedurl.txt|awk -F'\t' '{print $2}' > ${module_dir}/bin/ad_host.txt
        n=$( cat ${module_dir}/bin/cprojoinedurl.txt|wc -l )
        if [ -f ${module_dir}/bin/ad_host.txt ]
        then
            pro_conf $n
        else
            printf $date,"update adSite.js error because no ad_host.txt\n" >> ${module_dir}/log/node.log
            exit 0
        fi
    else
        printf $date,"update adSite.js error because no such cprojoinedurl.txt\n" >> ${module_dir}/log/node.log
        exit 0
     fi
}

if test $? -eq 0
then
    pro_ad
    #restart
   # sh ${module_dir}/bin/tcwise_control stop && sh ${module_dir}/bin/tcwise_control start 
else
    printf $date,"prodcut adSite.js error because %s failed\n" $address >> ${module_dir}/log/node.log
    exit 0
fi

