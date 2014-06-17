//继承默认的，增加自己的配置
var baseConf = require("../../tcwise/conf");
var clone = require("comlib").clone;
var extend = require("comlib").extend;

var conf = {
    modules: {
        "PAGE_TYPE_NEWS_CONTENT": {
            port: 8502,
            host: "localhost"
        },
        "PAGE_TYPE_LIST": {
            port: 8503,
            host: "localhost"
        },
        "DEFAULT": {
            port: 8501,
            host: "localhost"
        }
    },
    "siteApp": {
        "id": 2713509,
        "adID": 1477447
    },
    server: {
        port: 8509,
        httpAgentMaxSocks: 100000
    }
}
var conf1 = clone(baseConf);
extend(conf1,conf);
module.exports = conf1;
