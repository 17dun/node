/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-8-29
 * Time: 下午9:03
 * To change this template use File | Settings | File Templates.
 */
var config = require("../../conf/tcwiseConf")
    ,bdlog = require('comlib').bdlog
    ,error = require('comlib').makeError
    ,get_site_ua = require('../dao/siteUa').get_site_ua
    ,url_parse = require('comlib').url_parse;

bdlog.init(config.bdlog);
var test_wapsite = function(url,options,callback){
    if(arguments.length ==2 ){
        callback = options;
        options = [];
    }
    get_site_ua(url,function(err,data,riglog){
        if(err !== null) callback(err,data,riglog);
       //console.log(data);
        //bdlog.debug('logid:' + options.logid + " siteua data:" + data);
        if(typeof(data) != "undefined" && data != null && data.toString().search(/source=3/) !== -1){
            callback(null,true,riglog);
        }else{
            callback(null,false,riglog);
        }
    })
}
exports.test_wapsite = test_wapsite;