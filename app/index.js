var processBoot = require("./processBoot");
var conf = require("./tcwise/conf");
var cluster = require('cluster');
var numCPUs = require('os').cpus().length;
var processGroups = [
    {
        apps:[require("./tcwise/app"),require("./tcwiseList/app"),require("./newsContent/app")],
        processCount:numCPUs
    },//group 划分，一组app共享一组进程
    {
        apps:[require("./dict/app")],
        processCount:numCPUs
    }
];
//现在的启动方式为交叉混合状态，没有切分成两个进程
function start(){
    if(cluster.isMaster){
        console.log("run in master");
        processGroups.forEach(function(item,index,items){
            console.log("run in master",index);
            processBoot.boot(item.apps,conf.cluster.enable,item.processCount,index,conf);
        });
    }else{
        var item = processGroups[process.env.processGroupId];
        console.log("子进程启动端口");
        processBoot.startServer(item.apps,conf);
    }

}

module.exports.start = start;