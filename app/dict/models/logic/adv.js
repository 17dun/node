/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-8-29
 * Time: 下午9:06
 * To change this template use File | Settings | File Templates.
 */
var ad_conf = require('../../conf/adSite.js')
    ,ad_conf_blacklist=require('../../conf/adSiteBlacklist.js')
    ,ad_conf_appearch=require('../../conf/adSiteAppsearch.js')
    ,bdlog = require('comlib').bdlog
    ,mysql = new (require('../dao/yunDuDb.js').mysql)
    ,error = require('comlib').makeError
    ,url_parse = require('comlib').url_parse
    ,http_request = require('comlib').http_request
    ,config = require('../../conf')
    ,clone = require('comlib').clone
    ,is_empty_object = require('comlib').is_empty_object;

var get_union_adv = function(host, options){

    if(arguments.length < 2){
        options = [];
    }
    var ad_res = {}, ad = {};
    var host_info = host.split('.');
    host_info = host_info.reverse();
    var len = host_info.length, tmp_host = '';

    //广告完全匹配
    if(ad_conf[host]){
        ad = ad_conf[host];
        ad.host = host;
    }else{ //部分匹配
        for(var i=0; i < len; i++){
            if(i==0) {
                tmp_host = host_info[i];
                continue;
            }
            tmp_host = host_info[i] + '.' + tmp_host;
            if(tmp_host == 'com.cn' || tmp_host == 'net.cn'){
                continue;
            }

            if(ad_conf[tmp_host] !== undefined ){
                ad = ad_conf[tmp_host];
                ad.host = tmp_host;
                break;
            }

        }
    }

    if(!is_empty_object(ad) || ad['type'] == 'union'){
        ad_res.hostClaim = ad.host;
        ad_res.showClaim = true;
        ad_res.ad = ad;
        if(ad['showad'] == 'no'){
            ad_res.ad = [];
        }
    }
    if(ad_conf_blacklist[host]){
        ad_res.ad=[];
    }
    return ad_res;
}

var get_adv_info = function(src,options,callback){
    if(arguments.length < 3){
        callback = options;
    }
    var ori_host = url_parse(src).host;
    var host = ori_host;
    //将www去掉，广告中只存主域
    if(host.toString().search(/^www\./) == 0){
        host = host.toString().replace(/www\./,'');
    }
    //如果是appsearch的广告，就不出联盟广告
    var adque=false;
    for(var i=0;i<ad_conf_appearch.query.length;i++){
       if(ad_conf_appearch.query[i]==options.search_query){
           adque=true;
       }
    }
    var str_domain= isDomain(host);
    if(adque){
         var ad_res={
             hostClaim:host,
             showClaim:false,
             ad:{
                 type:"appsearch",
                 host:host
             }
         }
        callback(null,ad_res);
        return;
    }else{
        //是union类型直接返回 union和qs不同时存在
        var ad_res = get_union_adv(host, options);
        if(!is_empty_object(ad_res)){
            callback(null, ad_res);
            return;
        }
    }
    
    //替代注释掉的秋实广告逻辑
    callback(null, {ad:{
                 type:"appsearch",
                 host:host
             }});
    function isDomain(name){
       for(var host in ad_conf_appearch.domain){
           var reg=new RegExp(host+"$");
           if(name.match(reg)==host){
              return host
           }
       }
        return "";
    }
    //秋实广告未开启，先不考虑
   /* get_qs_ad(host,options,function(err,data){
        if(err !== null){
            callback(err);
            return;
        }else{
            var ad_res = {};
            ad_res.ad = clone(data);
            ad_res.ad.domain = ori_host;
            callback(null,ad_res);
        }

    }); */
}
 /*
var get_qs_ad = function(host,options,callback){
    if(arguments.length ==2 ){
        callback = options;
        options = [];
    }
    var res = {};
    mysql.get_ad(host,options,function(err,data){
         if(err != null)
            bdlog.warn('logid:' + options.logid + ' get ad from mysql error:' + err);
        //console.log(data);
         if(data == null || ( !is_empty_object(data) && data.datetime < Date.now()/1000 - 24*60*60)){
             get_qs_ad_from_qs_server(host,function(err,qs_server_data){
                if(err !== null){
                    callback(err);
                    return;
                }
                var ad_id = !is_empty_object(data) && data['id'] ? data['id'] : 0;
                if(qs_server_data != null){
                    mysql.set_ad(host, qs_server_data.appsid, qs_server_data.appsec, ad_id, options,function(err,set_ad_res){
                        if(err !== null) {
                            bdlog.warn('logid:' + options.logid + ' set ad to mysql error:' + err);
                        }
                        res.appsid = qs_server_data.appsid;
                        res.appsec = qs_server_data.appsec;
                        res.url = host;
                        callback(null,res);
                    })
                }
             })
         }else{
             res = clone(data);
             res.url = host;
             callback(null,res);
         }
    })
}     */
/*
var get_qs_ad_from_qs_server = function(host,options,callback){

    if(arguments.length ==2 ){
        callback = options;
    }

    var qs_conf = Object.create(config.qs);
    bdlog.debug('logid:'+ options.logid + ' qs_conf:' + JSON.stringify(qs_conf));
    bdlog.debug('logid:'+ options.logid + ' path:' + qs_conf.path);
    qs_conf.path = qs_conf.path + encodeURI(host);
    bdlog.debug('logid:'+ options.logid + ' path:' + qs_conf.path);
    //console.log(qs_conf);
    http_request(qs_conf,function(err,data){
        if(err != null){
           // console.log(err);
            bdlog.warn('logid:'+ options.logid + ' error:' + err);
            callback(err);
            return;
        }
       // console.log('from qs server:' + data );
        bdlog.debug('logid:'+ options.logid + ' data from qs server:' + data);
        //console.log('from qs server:' + data.toString());
        try{
            data = JSON.parse(data.toString());
            if(data == null || ( data.errmsg && data.errmsg.length != 0)){
                return callback(error('GET AD DATA FAIL, MSG:'+data.errmsg));
            }
            bdlog.debug('logid:'+ options.logid + ' data:' + data);
            callback(null,data);
        } catch(err){
            bdlog.warn('logid:'+ options.logid + ' error:' + err);
            callback(err);
            return;
        }

       //console.log(data.errmsg.length);
    });

}    */

exports.get_adv_info = get_adv_info;
exports.get_union_adv = get_union_adv;
//exports.get_qs_ad = get_qs_ad;
//exports.get_qs_ad_from_qs_server = get_qs_ad_from_qs_server;
