//继承默认的，增加自己的配置
var baseConf = require("../../tcwise/conf");
var clone = require("comlib").clone;
var extend = require("comlib").extend;

var conf = {
    'static':{
        'RunEnv': 21,  // 0 for offline 2 压缩文件线下版本 21 压缩文件线上版本
        'OfflinePath': 'http://mcouiui.newoffline.bae.baidu.com/',
        'OnlinePath':"http://m.baidu.com/static/search/siteapp/ss/",
        'jsVersion':"1.6.15",
        'cssVersion':"1.6.15"
    },
    "siteApp": {
        "id": 2713509,
        "adID": 1477447
    },
    server: {
        port: 8503,
        httpAgentMaxSocks: 100000
    },
    'jsmartier' : {
        prefix : '{[%',
        suffix : '%]}',
        configPath : './template/conf/',
        monitorInterval : 180000,
        legacy : true,
        soyBuildPrefix:"List",
        path:"./templateList/" //默认模板的根路径
    }
}
var conf1 = clone(baseConf);
extend(conf1,conf);
module.exports = conf1;




