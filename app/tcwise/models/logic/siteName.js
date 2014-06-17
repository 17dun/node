/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-8-29
 * Time: 下午9:03
 * To change this template use File | Settings | File Templates.
 */
var config = require('../../conf')
    ,bdlog = require('comlib').bdlog
    ,error = require('comlib').makeError
    ,get_site_name = require('../dao/siteName').get_site_name
    ,url_parse = require('comlib').url_parse
    ,url_format = require('comlib').url_format;

var pro_site_name = function(url,options,callback){
    if(arguments.length ==2 ){
        callback = options;
        options = [];
    }
     //console.log(url);
    var url_parse_arr = url_parse(url);
    var host =  "http://"+url_parse_arr['host'];
    get_site_name(host,options,function(err,data,riglog){
        bdlog.debug("__get_site_name__",url,err,data);
        if(err !== null) {return callback(err,data,riglog); }
        var sitename = data;
        var tmp =  host.match(/[\w][\w-]*\.(?:com\.cn|com|cn|co|net|org|gov|cc|biz|info|us)(\/|$)/ig);
        var site_domain = tmp ? tmp.toString().replace(/\/$/,'') : host;
        var res = {'site_name' : sitename,'site_url' : host,'site_domain' : url_format(site_domain)};
        callback(null,res,riglog);
    })
}
exports.pro_site_name = pro_site_name;