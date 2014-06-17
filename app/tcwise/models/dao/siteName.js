/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-11
 * Time: 下午1:41
 * To change this template use File | Settings | File Templates.
 */
var config = require('../../conf')
    ,bdlog = require('comlib').bdlog
    ,error = require('comlib').makeError
    ,nshead = require('comlib').nshead;

var get_site_name = function(url,options,callback){

    if(arguments.length ==2 ){
        callback = options;
        options = [];
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
        'dict_type': 2048,
        'key': {
            "dict_id":[],
            "dict_key":[]
        },
        "num": url_array.length,
        "url": url_array
    };

    var sitename_config = config.sitename;
   // console.log(sitename_config);
    var sitename_backends = sitename_config.backend;
   // console.log(sitename_backends);
    var index = Math.floor(Math.random()*sitename_backends.length);
    var sitename_backend =  sitename_backends[index];
    //console.log(sitename_backend);
    var nshead_options = {
        'host' : sitename_backend.host,
        'port' : sitename_backend.port,
        'code' : sitename_config.code,
        'timeout' : sitename_config.timeout,
        'logid' : options.logid
    };
    bdlog.debug('logid:' + options.logid + ' in get_site_name nshead options:' + JSON.stringify(nshead_options));
    //console.log(body);
    var start_time = new Date*1;
    nshead(header,body,nshead_options,function(err,data){
        var riglog = {
            remote_ip:nshead_options.host,
            remote_module:"sitename",
            cost_time:(new Date*1) - start_time 
        }
        
        //console.log(err);
        bdlog.debug("__get_site_name_nshead__",url,err,data);
        if(err !== null) {
            riglog.status = 0;
            riglog.errorInfo = err;
            return callback(err, data, riglog);
        }
        riglog.status = 1;
        callback(null,data ? data.dict_res_vec[0][0] : null, riglog);
   // callback(error('data is null '));
    });
}
exports.get_site_name = get_site_name;
