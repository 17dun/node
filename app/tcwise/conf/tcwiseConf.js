var server = require('./server')
    ,yingji = require('./yingji.js')
    ,ad_server = require('./adSite');
module.exports = {
    'app_name' :'tcwise',
    'env':'development',//[ production, development]
    'server':{
        'port'  : 8506
    },
    'static':{
        'RunEnv': 1,  // 1 for online, 0 for offline
        'OfflinePath': 'http://mcouiui.newoffline.bae.baidu.com/'
    },
    'global' : {
        'httpAgentMaxSocks' : 500
    },
    'cluster' : {
        //'enable' : true
        'enable' : false
    },
    'silkserver' : {
        'backend' : server.silkserver,
        'path' : '/webapp?structpage=1',
        'method' : 'GET',
        'headers' : {
            'Host' : 'internal_wise_domain.baidu.com'
        },
        'appid' :406936,
        'retry' : 0,//retry must less than backend.length-1
        'timeout' : 30000
    },
    'sitename': {
        'backend': server.sitename,
        'timeout': 5000,
        'code' : 'gbk'
    },
    'siteua': {
        'backend': server.siteua,
        'timeout': 5000
    },
    'bdlog' : {
        'path' : './log/tcwise.log',
        'maxLength' : 2000,
        'level' : 3, // [ 1-debug, 2-trace, 3-notice, 4-warn, 5-fatal ]
        'printTty' : false,
        'printFile' : true
    },
    'appdb' : {
        'backend' : server.appdb,
        'user' : 'mcloud_rd',
        'password' : 'd8e73ki32liqu9',
        'database' : 'mcloud',
        'timeout' : 30000
    },
    'qs' : {
        'method' : 'GET',
        'hostname' : 'muadmin.baidu.com',
        'path' : '/api/getSiteAppInfo.html?domain=',
        'port' : 80,
        'timeout' : 1000
    },
    'jsmartier' : {
        prefix : '{[%',
        suffix : '%]}',
        configPath : './template/conf/',
        monitorInterval : 180000,
        legacy : true
    },
    'video' : {
        hostname:'cybertran.baidu.com',
        path : '/video/trans.mp4?',
        method: 'GET',
        timeout : 30000
    },
    'show_page_ad' : 1,
    'yingji' : yingji,
    'xdebug':{
            showXdebugPATH:false,
            __id:0,
            pvCount:0
        }
}


