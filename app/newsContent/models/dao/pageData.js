var retry_http_request = require('comlib').retry_http_request
    ,config = require('../../conf')
    ,clone = require('comlib').clone
    ,mcpack = require('mcpack')
    ,error = require('comlib').makeError
    ,is_empty_object = require('comlib').is_empty_object
    ,qs = require('querystring')
    ,bdlog = require('comlib').bdlog;

var silk_request = function(request,options,callback){
    if(arguments.length == 2){
        callback = options;
        options = [];
    }
   // console.log(request);
    var http_options = {};
    http_options = clone(config.silkserver);
    http_options.server_name = "silkserver";
    http_options.headers['user-agent'] = options["user-agent"];
    http_options.headers['X-TC-Ori-Uri'] = options.original_url;
    http_options.headers['X-Forwarded-For'] = options["x-forwarded-for"];
    http_options.headers['Tc-Default-Logid'] = options.logid;
    http_options.logid = options.logid;
    http_options.headers['Referer'] = options.referer;
    //http_options.headers['Cookie'] = JSON.stringify(options.cookies);
    http_options.headers['Cookie'] = options.cookies;

    var query = "";
    //console.log(is_empty_object(request['tc']));
    for(var item in request){
         if(item.length !== 0){
             if(typeof (request[item]) == 'string' && item != "src"){
                 query = query + item + "=" +request[item] + "&";
             }else if(typeof (request[item]) == 'object' /*&& is_empty_object(request[item])*/){
                // console.log(request[item]);
                 query = query + item + "&";
             }else if(item != "src"){
                 query = query + item + "=" +request[item] + "&";
             }
         }
    }
    var src = request.src.match('/') ? encodeURIComponent(request.src) : request.src;
    query += "src=" + src;
    //console.log(query);

    //console.log(query);
    http_options.path = config.silkserver.path + '&' + query;
    if(!is_empty_object(options) && !is_empty_object(options.req.body)){
        http_options.method = "POST";
        http_options.write_data = qs.stringify(options.req.body);
        http_options.headers['Content-length'] =  http_options.write_data.length;
    }
   // console.log(config.silkserver);

    retry_http_request(http_options,function(err,mcpack_data,riglog){
        if(options.res.rigAddLogs&&riglog){
            options.res.rigAddLogs.push(riglog);
        }
        if(err != null){
            callback(err);
        }else{
             //mcpack
             var data = mcpack.mcpackbuf_2_object(mcpack_data);
           // struct_data = JSON.parse(data.struct_data);
            //console.log('data:',data);
            if(data && data.struct_data){
                try{
                    var page_data = JSON.parse(data.struct_data);
                }catch(e){
                    //callback(error(data.struct_data));
                    callback(e);
                    return;
                }

                if(data.log_pack){
                    var silk_log = mcpack.mcpackbuf_2_object(data.log_pack);
                    page_data.silk_log = silk_log;
                    page_data.silk_time = Date.now() - options.ori_time;
                    //console.log('silk_log:' + JSON.stringify(silk_log));
                   // bdlog.notice('logid:' + options.logid + " silk_log:" + JSON.stringify(silk_log));
                }
                //console.log(data.set_cookie);
               // console.log(data.struct_data);
                //data.set_cookie="H_PS_PSSID=3408_1454_2981; path=/; domain=.baidu.com\tBDSVRTM=99; path=/";
                if(data.set_cookie){
                    //bdlog.debug('logid:' + options.logid + ' cookie:' + data.set_cookie);
                    //console.log(data.set_cookie);
                    page_data.set_cookie = data.set_cookie;
                }

                if (page_data && page_data['struct_type']=='ERROR_STRUCT'){
                    return callback(error('ERROR_STRUCT'));
                }
                //console.log('22');
               // console.log(data.struct_data.set_cookie);
                callback(null,page_data);
            }else{
                callback(error('data is null'));
            }

        }
    });
}
exports.silk_request = silk_request;