//启动一组进程，执行同样任务

//启动各个模块的进程，负责交互
var  bdlog = require('comlib').bdlog
    , http = require('http')
    ,cluster = require('cluster')
    ,numCPUs = require('os').cpus().length;
function svr_start(apps,config){
    if(typeof config.global.httpAgentMaxSocks == 'number'){
        http.globalAgent.maxSockets = config.global.httpAgentMaxSocks;
    }
	apps.forEach(function(app,index,apps){
	    app.listen(app.get('port'));
	    console.log('server starting at http://127.0.0.1:'+app.get('port'));
	});

}
function startServer(apps,isCluster,processCount,processGroupId,config){
    if(processCount){
        numCPUs = parseInt(processCount);
    }
    console.log(isCluster?1:2,"多进程");
    if(!isCluster){
        svr_start(apps,config);
    }else{
        //console.log(numCPUs);
        if(cluster.isMaster){
            bdlog.notice('Master start up');
            for(var i=0; i<numCPUs-1; i++){
                cluster.fork({
                    processGroupId:processGroupId
                });
            }
            var exited = 0;
            cluster.on('exit', function(worker, code, signal){
                exited += 1;
                var exit_message = 'worker pid:'+worker.process.pid+' exit at '+ new Date()+' code:'+code+' signal:'+signal;
                bdlog.warn(exit_message);
                cluster.fork({
                    processGroupId:processGroupId
                });
            });
            cluster.on('online', function(worker) {
                var online_message = 'worker pid:' + worker.process.pid + ' online at ' + new Date();
                bdlog.notice(online_message);
            });
            cluster.on('listening', function(worker, address) {
                var listen_message = 'worker pid:' + worker.process.pid + ' listen at port:'+ address.port +' '+ new Date();
                bdlog.notice(listen_message);
            });
        }else{
            //每次fork 之后从入口处开始执行，./bin/node bootStrap.js 所以这个代码不会被执行
            if(process.env.processGroupId == processGroupId){
                svr_start(apps,config);
            }
        }
    }
}
module.exports.startServer = svr_start;
module.exports.boot = startServer;
