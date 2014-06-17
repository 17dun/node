/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-8
 * Time: 下午1:30
 * To change this template use File | Settings | File Templates.
 * test if the site is established  in baidu siteapp
 */
var url = require('url')
   ,mysql = require('../dao/yunDuDb.js').mysql
   ,error = require('comlib').makeError
    ,bdlog = require('comlib').bdlog;

var get_host_list = function(src){
    url_info = url.parse(src);
    // console.log(url_info);
    if(!url_info.host)
        return false;
    var host_list = [];
    url_info.host = url_info.host.split('.');
    url_info.host = url_info.host.reverse();

    var host = '';
    var length = url_info.host.length;
    for(var i=0; i<length; i++) {
        if(i == 0){
            host = url_info.host[i];
            continue;
        }
        host = url_info.host[i] + '.'+host;
        if(host == 'com.cn' || host == 'net.cn'){
            continue;
        }
        if((i ==1 || i==2) && url_info.host[i+1] != 'www' && url_info.host[i] != 'www'){
            host_list.push("http://www." + host);
        }
        host_list.push("http://"+host);
    }
    // console.log(host_list);
    if(url_info.path && url_info.path != '/'){

        url_info.path = url_info.path.toString().replace(/(^\/[^\/]+)((.*)?)/,'$1');
        host_list.push("http://"+host+url_info.path).toString().replace('/\/$/','');
    }
    return host_list;
}

var get_baidu_site_link = function(src,options,callback){
    // console.log(src);
    //bdlog.debug('logid:' + options.logid + ' src:' + src);
    if(arguments.length < 3){
        callback = options;
        options = [];
    }

    var host_list = get_host_list(src);
     //console.log(host_list);
    //bdlog.debug('logid:' + options.logid + ' host_list:' + host_list);
    if(  !host_list || (Array.isArray(host_list) && !host_list.length) ){
        //bdlog.debug('logid:' + options.logid + ' host_list is empty:' + host_list);
        var db_data = set_db_data(1,null);
        callback(null,db_data);
        return;
    }
    //bdlog.debug('logid:' + options.logid + ' query mysql:' + host_list);
    var mysql_connection = new mysql;
    mysql_connection.get_baidu_site_link(host_list,options,function(err,data){
        // console.log(data);
        if(err != null) {
            callback(err);
            return;
        }
        //bdlog.debug('logid:' + options.logid + ' data:' + JSON.stringify(data));
        //数据库中无数据
        if(!data || (Array.isArray(data) && data.length == 0)) {
            var db_data = set_db_data(1,null);
            callback(null,db_data);
            return;
        }
        //var data = [{ site: 'http://7y7.com', wapsite: 'm.7y7.com' }];
        var sort = {};
        for(var i=0; i<data.length; i++){
           // console.log(data);
            //console.log(i);
           // console.log(data.length);
            var value = data[i];
            var site = data[i].site;
            var wapsite = data[i].wapsite;
            var app_state = data[i].app_state;
            var is_dns_validate = data[i].is_dns_validate;
           // console.log(site);
           // console.log(sort);
            bdlog.trace('logid:' + options.logid + " site:" + site);
            sort[site] = {
                'wapsite' :  wapsite,
                'app_state' : app_state,
                'is_dns_validate' : is_dns_validate
            };
        }

      //  console.log(sort);
        host_list = host_list.reverse();
        var sited = false;
        for(var i= 0,len = host_list.length; i<len; i++){
            var tmp = host_list[i];
            if((sort[tmp] && sort[tmp].wapsite.toString().length == 0)||!sort[tmp]){
                if(sited == false && sort[tmp] ){
                    var site_no_wapsite = tmp;
                    sited = true;
                }
                //已建站但是无移动域名存在
                //bdlog.debug('logid:' + options.logid + " i:" + i + " len:" + len );
                if(i == len-1 && sited == true){
                    //bdlog.debug('logid:' + options.logid + " site:" + site_no_wapsite);
                    var db_data = set_db_data(3,site_no_wapsite);
                    return callback(null,db_data);
                }else if(i == len-1 && sited == false){
                    var db_data = set_db_data(1,null);
                    return callback(null,db_data);
                }
                continue;
            }else if(sort[tmp] && sort[tmp].wapsite.indexOf("http://") == -1){
               sort[tmp].wapsite =  "http://" + sort[tmp].wapsite;
                //有移动域名存在
                if(is_dns_validate == 1){
                    var db_data = set_db_data(2,sort[tmp].wapsite);
                    return callback(null,db_data);
                }else {
                    var db_data = set_db_data(3,tmp);
                    return callback(null,db_data);
                }
            }
        }
    });

}

var set_db_data = function(status,site,app_state,options){

    if(arguments.length < 4){
        app_state = 0;
        options = [];
    }
    var db_data = {};
    switch(status){
        case 1:
            db_data.status = 1;break;
        case 2:
            db_data = {
                'status' : 2,
                'wapsite' : site
            };
            break;
        case 3:
            if(site.indexOf("http://") == 0){
                site = site.substr(7);
            }
            db_data = {
                'status' : 3,
                'site' : site
            };break;
        default:
            db_data.status = 1;break;
    }

    return db_data;
}
exports.set_db_data = set_db_data;
exports.get_baidu_site_link = get_baidu_site_link;
exports.get_host_list = get_host_list;
