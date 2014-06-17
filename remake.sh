#!/bin/bash
#=============================================================
# @author: wangfeng02@baidu.com
# @version: 1.0
# @time: 2013/07/19
#==============================================================

#以下是localbuild使用的配置,请自行修改
#脚本根据以下三个配置,将测试环境部署到${my_test_host}:/home/work/appui目录
my_sign="mazongqing"

#你的测试机地址,目前不支持除work外的其他账户
#my_test_host="work@yx-testing-wisetf02.vm.baidu.com"
#my_test_host="workdbl-wise-rc-tf14.vm.baidu.com"
my_test_host="work@cq01-testing-wiseci09.vm.baidu.com"
#my_test_host="work@yx-testing-wisetf02.vm.baidu.com"

#以下是ci的总控机配置,请勿修改
master_host="tc-wise-tfci00.vm.baidu.com"
master_user="work"
master_passwd="wisetest"

export MAC=64
#lock 主干代码
lock_svn_trunk="FALSE"
lock_svn_cmd=""

#测试机列表
test_hosts=("work@dbl-sumeru-sapa00.dbl01" "work@dbl-sumeru-sapa01.dbl01" "work@tc-sumeru-sapa00.tc" "work@tc-sumeru-sapa01.tc" "work@yx-testing-qapool70.yx01" "work@tc-wise-rdtf04.tc" "work@cq01-testing-wisetf17.vm")
is_clear_testhost=0

#编译模块信息
current_dir=`pwd`


local_release=`date +"%F-%H-%M-%S"`.tar

#帮助说明
function print_help() {
cat << END
remake.sh [option]
    -d:     部署模块
    -S:     部署代码
    -h:     帮助信息
    -c:     编译模块
 debug:     部署代码和模块

 remake.sh支持local build功能啦:) wiki文档参见: http://wiki.babel.baidu.com/twiki/bin/view/Com/Test/PA_LOCALBUILD
 
 如果这是你第一次使用remake.sh, 请先打开它设置 my_sign(第13行) 和 my_test_host(第16行)

    -s:     指定my_sign wangyong02

    -m:     指定测试机 work@cq01-testing-wisetf16.vm.baidu.com

    -l:     锁定svn主干代码,支持lock \ unlock


    -P:     在测试机上准备测试用例并搭建与线上一致的基础环境
            测试用例存放地址: \${my_test_host}:/home/work/autotest/smartlayout-test
            基础环境存放地址: \${my_test_host}:/home/work/\${my_sign}

    -R:     更新测试机(\${my_test_host})上的测试用例
            使用编译好的模块(./output/bin), 配置(./output/conf), 数据(./output/data), 代码(./output/src)替换测试机上的基础环境
            修改模块配置, 降低资源利用, 防止端口冲突等
            启动模块

    -D:     ./remake.sh -D = ./remake.sh -P -R

    -T [测试类型]:  在测试机上执行测试, 目前可以使用的测试类型: function
            使用方法: ./remake.sh -T function
             function测试: 1. 执行\${my_test_host}:/home/work/autotest/smartlayout-test/case/module/appui 下所有回归用例
                           2. 执行\${my_test_host}:/home/work/autotest/smartlayout-test/local/case/all/appui下所有RB回归用例
                           3. 执行\${my_test_host}:/home/work/autotest/smartlayout-test/local/case/\${my_sign}下所有local用例
                           4. 将上述测试执行结果发到\${my_sign}@baidu.com

    -B:     即localbuild, 一键式完成本地代码编译, 测试环境搭建, 测试用例准备, 测试用例执行, 并发出报告
            注意: localbuild时只更新lib模块的编译依赖
            因此，如果11个模块中某个模块编译依赖有更新，请同步更新到所有11个模块，包括SCM平台上的更新和本地COMAKE文件的更新
            运行的自动化cases是主干目录的cases，https://svn.baidu.com/mc/browser-os/trunk/smartlayout/smartlayout-test/case/module/appui
END
}

#功能函数
#彩色打印
echo_ok()
{
    if [ $1 -eq 0 ];then
        echo -e "\033[32m$2\033[0m"
    else
        echo -e "\033[31m$3\033[0m"
	clear_test_host
        exit 1
    fi
}
#FATAL $Msg
function FATAL() {
    echo "FATAL `date +"%F %T"` : $@" >&2
    clear_test_host
    exit 1;
}

#WARNING $Msg
function WARNING() {
    echo "WARNING `date +"%F %T"` : $@" >&2
}

#NOTICE $Msg
function NOTICE() {
    echo "NOTICE `date +"%F %T"` : $@" >&2
}

#check the return value
#CHK_RET $LEVEL $Msg
function CHK_RET() {
    if [ $? -ne 0 ]
    then
        $@
    fi
}

function CHK_RET1() {
    if [ $? -ne 1 ]
    then
        $@
    fi
}
#function: ssh
function SSH() {
    NOTICE "ssh ${master_user}@${master_host} \"$1\""
    ssh ${master_user}@${master_host} "$1"
    CHK_RET FATAL "ssh ${master_user}@${master_host} \"$1\"执行失败"
}

#function: check and set my_sign
function check_my_sign() {
    if [ "$my_sign" == "" ];then
        FATAL "没有为当前构建或测试设定my_sign, 它应该是你的@baidu邮箱前缀, 请修改remake.sh的第13行"
    fi
}

function get_test_host(){
	num=$(date +%s+%N);
	((test_host_id=num%${#test_hosts[@]}))
	my_test_host=${test_hosts[$test_host_id]}
	local_lockfile="/home/work/.pa_local_lock"
	cmd='
		if [ -f '"$local_lockfile"' ];then
			grep "'"$my_test_host"'" '"$local_lockfile"' >/dev/null 2>&1
			if [ $? -eq 0 ];then
				echo "'"$my_test_host"'测试机正在做LOCALBUILD，系统正在为你重新选择一台..."
				exit 1
			else
				exit 0
			fi
		fi
	'
	ssh ${master_user}@${master_host} "$cmd"
	return $?
}

function update_local_lock(){
	local cmdno=$1
	local local_host=$2
	if [ "$cmdno" == "1" ];then
		cmd=" echo '"$local_host"' >> '"$local_lockfile"'     "
	fi
	if [ "$cmdno" == "2" ];then
		cmd=" sed -i '/"$local_host"/d' '"$local_lockfile"' "
	fi
	ssh ${master_user}@${master_host} "$cmd"
	return $?
}
#function: check and set my_test_host
function check_my_test_host() {
    if [ "$my_test_host" == "" ];then
	ret=1
	for((i=0;i<100;i++)){
		get_test_host
		ret=$?
		if [ "$ret" == "0" ];then
			WARNING "没有为当前构建或测试设定my_test_host,系统自动为你指定为$my_test_host"
			update_local_lock 1 "$my_test_host"
			ret=$?
			if [ "$ret" == "0" ];then
				WARNING "对测试机$my_test_host加锁成功."
				break;
			else
				WARNING "对测试机$my_test_host加锁失败!"
			fi
		fi
		sleep 1
	}
	if [ $ret -ne 0 ];then
		FATAL "sorry. 不能找到测试机，请稍后再试..."
	fi
    else
			update_local_lock 1 "$my_test_host"
			ret=$?
			if [ "$ret" == "0" ];then
				WARNING "对测试机加锁成功."
			else
				WARNING "对测试机加锁失败!"
			fi
	
    fi
}

function clear_test_host(){
	if [ "$my_test_host" != "" -a "$is_clear_testhost" == "0" ];then
		update_local_lock 2 "$my_test_host"
			ret=$?
			if [ "$ret" == "0" ];then
				is_clear_testhost=1
				WARNING "对测试机解锁成功."
			else
				WARNING "对测试机解锁失败."
			fi
	fi
}

#function: lock trunk svn code
function lock_trunk_svn_code() {
    if [ "$lock_svn_trunk" == "TRUE" ];then
	if [ "$lock_svn_cmd" != "lock" -a "$lock_svn_cmd" != "unlock" ] ;then
		FATAL "锁page-analyzer主干代码只支持lock\unlock命令."
	fi
        NOTICE "[action] 开始${lock_svn_cmd} appui主干代码,请确认所有RD已经ci."
	#for directory in attacher conf lib usable basic content dispatch style tcsmartkit translate worker
	for directory in app conf config data php template webroot webserver 
	do
		for file in `svn ls -R $directory`
		do
			svn $lock_svn_cmd $directory/$file
		done
	done
        NOTICE "完成${lock_svn_cmd} appui主干代码."
    fi
}

function build_trust()
{
    HOST=$1 
    USERNAME=$2
    PASSWORD=$3
    
    echo n | ssh-keygen -t dsa -f ~/.ssh/id_dsa -N '' 1> /dev/null 2>/dev/null
    pass=`cat ~/.ssh/id_dsa.pub`
    
    lftp -e "cd .ssh; get authorized_keys;quit" -u $USERNAME,$PASSWORD $HOST 1> /dev/null 2>/dev/null
    
    grep "$USER@$HOST" authorized_keys 1>/dev/null 2>/dev/null
    if [ $? -ne 0 ] 
    then    
        echo $pass >> authorized_keys
        lftp -e "cd ~/.ssh; put authorized_keys;chmod 600 authorized_keys;quit" -u $USERNAME,$PASSWORD $HOST 1> /dev/null 2>/dev/null
        rm authorized_keys
    
        grep $HOST ~/.ssh/known_hosts 1>/dev/null 2>/dev/null
        if [ $? -ne 0 ] 
        then    
            IP=`net lookup $HOST`
                
            lftp -e "cd /etc/ssh; get ssh_host_rsa_key.pub;quit" -u $USERNAME,$PASSWORD $HOST 1> /dev/null 2>/dev/null
            RSA=`cat ssh_host_rsa_key.pub`
            rm ssh_host_rsa_key.pub
                    
            echo "$HOST,$IP $RSA" >> ~/.ssh/known_hosts
        fi      
    else    
        rm authorized_keys
    fi
}


#部署模块
function deploy_module() {
#不会影响target_machine在程序中的设定，让函数支持传参设定target_machine
[ -n "$1" ] && target_machine=$1

echo "==========================================================================================="
echo "deploy module to:"
echo "    ${target_machine}"
echo "==========================================================================================="
scp ./output/bin/* ${target_machine}
} 


#替换node-tcwise环境
function replace_env() {
if [ "$replace_if" == "TRUE" ];then
    #与CI总控机建立信任关系
    build_trust $master_host $master_user $master_passwd
    #1. 在总控机下创建文件夹
    SSH "[ -d /home/work/tcci_home/local_build_output/${my_sign}/node_tcwise_dir ] || mkdir -p /home/work/tcci_home/local_build_output/${my_sign}/node_tcwise_dir"
    #2. 打包output文件夹 -> local_release
    NOTICE "打包${current_dir}/output/目录下 -> ${current_dir}/output/${local_release}"
    cd ${current_dir}/output
    NOTICE "拷贝./output 下 ${local_release} 文件到tcci总控机/home/work/tcci_home/local_build_output/${my_sign}/node_tcwise_dir"
    scp ${current_dir}/output/node-tcwise.tar.gz ${master_user}@${master_host}:/home/work/tcci_home/local_build_output/${my_sign}/node_tcwise_dir/
	scp ${current_dir}/coverage.html ${master_user}@${master_host}:/home/work/tools/apache-tomcat-6.0.35/webapps/
    cmd="cd /home/work/tcci_home/local_build_output/${my_sign}/node_tcwise_dir
    rm -rf app bin bootStrap.js conf log node_modules node-tcwise-main.iml readme.txt remake.sh template
    tar -zxvf node-tcwise.tar.gz"
    SSH "$cmd"
    NOTICE "从tcci总控机${master_host}发起在${my_test_host}上替换测试环境"
    cmd="source .bash_profile
    cd /home/work/tcci_home/build_scripts/
    sh auto_build.sh --replacetcwiseenv ${my_sign} ${my_test_host} ${local_release}"
    SSH "$cmd"
    NOTICE "replace env DONE"
fi
}

#准备pa环境
function prepare_env() {
if [ "$prepare_if" == "TRUE" ];then
    NOTICE "从tcci总控机${master_host}发起在${my_test_host}上准备测试环境"
    #确保与CI总控机建立信任关系
    build_trust $master_host $master_user $master_passwd
    cmd="source .bash_profile
    cd /home/work/tcci_home/build_scripts/
    sh auto_build.sh --preparetcwiseenv ${my_sign} ${my_test_host}"
    SSH "$cmd"
fi
}

function function_test() {
#if [ "${test_type_if[2]}" == "TRUE" ];then
if [ "${test_type_if[0]}" == "TRUE" ];then
    NOTICE "在${my_test_host}上执行功能测试用例"
    #确保与CI总控机建立信任关系
    build_trust $master_host $master_user $master_passwd
    cmd="source .bash_profile
    cd /home/work/tcci_home/build_scripts/
    sh auto_build.sh --tcwisefunctest ${my_sign} ${my_test_host}"
    SSH "$cmd"
fi
}

function local_compile() {
if [ "$compile_if" == "TRUE" ];then
    current_time=`date +%Y_%m_%d_%H:%M:%S`
    NOTICE "开始执行本地构建"
    if [ -d ${current_dir}/output ]; then
        if [ ! -d ${current_dir}/tmp ]; then
            mkdir -p ${current_dir}/tmp/$current_time
            CHK_RET FATAL "创建${current_dir}/tmp/$current_time目录失败"
        fi

        NOTICE "开始执行build.sh前先删除(保存)之前打包数据"
        mv ${current_dir}/output ${current_dir}/tmp/$current_time
	fi
    NOTICE "开始执行build.sh"
    cd ${current_dir}
    sh build.sh

    NOTICE "完成本地编译构建"
fi
}

function parse_test_type() {
if [ "$test_if" == "TRUE" ];then
    if [ "$test_list" != "" ];then
        test_counter=${#test_type[@]}
        i="0"
        while [ ${i} -lt ${test_counter} ];do
            echo "$test_list" | grep "${test_type[${i}]}" >/dev/null
            if [ $? -eq 0 ];then
                test_type_if[${i}]="TRUE"
            fi
            i=$[${i}+1]
        done
    fi
fi
}


function unit_test() {
	echo "unit test start"
    rm -f app/tcwise-cov
    rm -f coverage.html
	mocha ${current_dir}/app/tcwise/test -t 40000
	if [ $? -ne 0 ];then
        WARNING "单测用例失败，请check..."
		exit 1
    fi
	jscoverage --no-highlight --encoding=UTF-8 app/tcwise app/tcwise-cov
	if [ $? -ne 0 ];then
        WARNING "jscoverage失败，请check..."
		exit 1
    fi
	SUMERU_COV=1 mocha app/tcwise/test -t 40000 --reporter html-cov > coverage.html
	if [ -f coverage.html ];then
        WARNING "单测coverage.html生成成功"		
    else
		WARNING "单测coverage.html生成失败，请check..."
		exit
	fi
	echo "unit test end"
}

main() {
    
    prepare_if="FALSE"
    replace_if="FALSE"
    #localbuild支持的测试类型, 目前只有功能测试
    #test_type=("errhunter" "vitamin" "function")
    test_type=("function")
    #test_type=("function")
    test_if="FALSE"
    #test_type_if=("FALSE" "FALSE" "FALSE")
    test_type_if=("FALSE")
	unit_test_if="FALSE"

    test_list=""
    
    if [[ $# < 2 ]];then
        if [[ $# == 0 ]];then
            print_help
            exit 1
        elif [ "$1" == "clean" ];then
            make_clean
        elif [ "$1" == "debug" ];then
            deploy_module
        fi
    fi
    while getopts "dcSMPRUDBEC:T:m:s:l:" arg
    do
        case $arg in
        d)
            echo "仅部署代码，不执行自动化case..."
			compile_if="TRUE"
            prepare_if="TRUE"
            replace_if="TRUE"
            test_if="FALSE"
            test_list="function"
			unit_test_if="TRUE"
        ;;
        P)
            prepare_if="TRUE"
        ;;
        R)
            replace_if="TRUE"
        ;;
        D)
            prepare_if="TRUE"
            replace_if="TRUE"
        ;;
        T)
            test_if="TRUE"
            test_list=$OPTARG
        ;;
        B)
            compile_if="TRUE"
            prepare_if="TRUE"
            replace_if="TRUE"
            test_if="TRUE"
            test_list="function"
			unit_test_if="TRUE"
        ;;
        s)
            my_sign=$OPTARG
        ;;
        m)
            my_test_host=$OPTARG
        ;;
        l)
            lock_svn_trunk="TRUE"
            lock_svn_cmd=$OPTARG
        ;;
        *)
            print_help
            exit 1
        ;;
        esac
    done

    check_my_sign
    check_my_test_host
    lock_trunk_svn_code
	
	#本地进行单测
	if [ "$unit_test_if" == "TRUE" ];then
		unit_test
    fi	

    #与CI总控机建立信任关系
    build_trust $master_host $master_user $master_passwd
    parse_test_type
    local_compile
    prepare_env
    replace_env
	if [ "$test_if" == "TRUE" ];then
		WARNING "开始执行自动化case"
		function_test
		WARNING "自动化case执行完毕"
    fi	
    clear_test_host
	echo '单测报告查看地址 : http://tc-wise-tfci00.vm.baidu.com:8080/coverage.html' | mail -s UnitTestReport mazongqing@baidu.com ${my_sign}@baidu.com
    WARNING "node-tcwise localbuild end"
}

main "$@"
