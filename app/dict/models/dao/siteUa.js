/**
 * @author machenhui
 */
var config = require("../../conf/tcwiseConf")
    ,bdlog = require('comlib').bdlog
    ,error = require('comlib').makeError
    ,nshead = require('comlib').nshead;

var get_site_ua = function(url,options,callback){

    if(arguments.length ==2 ){
        callback = options;
        options = null;
    }
    var header = {
        'id': 123,
        'version': 2,
        'log_id': options ? ( options.log_id ? options.log_id : 1222 ) : 1222 ,
        'provider': options ? (options.provider ? options.provider: 'test') : 'test',
        'magic_num': 4218459028,
        'reserved': 123,
        'body_len': 0
    };
    //传递给服务器的url必须是数组
    var url_array = [];
    if(Array.isArray(url)){
        url_array = url;
    }else{
        url_array.push(url);
    }

    var body = {
        'dict_type': 32,
        'key': {
            "dict_id":[],
            "dict_key":[]
        },
        "num": url_array.length,
        "url": url_array
    };

    var siteua_config = config.siteua;
    // console.log(siteua_config);
    var siteua_backends = siteua_config.backend;
    // console.log(siteua_backends);
    var index = Math.floor(Math.random()*siteua_backends.length);
    var siteua_backend =  siteua_backends[index];
    //console.log(siteua_backend);
    var nshead_options = {
        'host' : siteua_backend.host,
        'port' : siteua_backend.port,
        'code' : siteua_config.code,
        'timeout' : siteua_config.timeout
    };
    //console.log(body);
    var start_time = new Date*1;
    nshead(header,body,nshead_options,function(err,data){
        var riglog = {
                remote_ip:nshead_options.host,
                remote_module:"siteua",
                cost_time:(new Date*1) - start_time 
            }
        //console.log(err);
        if(err !== null || data == null) {
            riglog.status = 0;
            riglog.errorInfo = err;
            callback(err,null,riglog);
     }else if(data.dict_res_vec&&data.dict_res_vec[0]){
		riglog.status = 1;
		callback(null,data.dict_res_vec[0][0],riglog);
	}else{
        	riglog.status = 0;
        	riglog.errorInfo = data.dict_res_vec;
		callback(error(data.dict_res_vec),riglog);
	}
        // callback(error('data is null '));
    });
}
exports.get_site_ua = get_site_ua;

