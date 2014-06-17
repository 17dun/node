/**
 * @author machenhui
 * 判断URL 是否应该被转码
 */
var config = require("./conf/tcwiseConf")
	,url_path_to_query = require('comlib').url_path_to_query
	,error = require('comlib').makeError
	,url_format = require('comlib').url_format
	,get_baidu_site_link = require('./models/logic/siteLink.js').get_baidu_site_link
    ,test_wapsite = require('./models/logic/siteUa.js').test_wapsite
    ,bdlog = require('comlib').bdlog;
function _initReqParam(req,options,callback){
	//增加应急预案code
    if(config.yingji.goSrc===1){
        return callback(error('yingji:gosrc'));
    }
    if(req.query.src == undefined || req.query.src == ""){
        return callback(error('no src'));
    }else if(typeof(req.query.src) == 'object' && req.query.src.length > 0){
        bdlog.warn("two src:" + JSON.stringify(req.query.src));
        req.query.src = req.query.src[0];
    }
    if(req.query.dict){
        req.query.dict = parseInt(req.query.dict).toString();
    }
    if(req.query.srd){
        req.query.srd = parseInt(req.query.srd).toString();
    }

    if(req.query.src.toString().match("/") == null){
         req.query.src = decodeURI(req.query.src);
    }
    req.query.src = url_format(req.query.src);
    var query_src = req.query;
    req.query = url_path_to_query(req.path,req.query);
    //req.query = url_path_to_query(req.params,req.query);
    options.query_src = query_src;

    bdlog.debug('logid:' + options.logid + "into filterURL");
    return 1;
}
//检测是否存在建站
function pro_site_link(req,res,options,callback){

    var params ={
        'l' :  req.query.l,
        'ref' : req.query.ref ? req.query.ref : '',
        'order' : req.query.order ? req.query.order : '',
        'dict' : req.query.dict,
        'tj' : req.query.tj ? req.query.tj : '',
        'cltj' : req.query.cltj ? req.query.cltj : ''
    };
    var start_time = new Date()*1;
    //bdlog.debug('logid:' + options.logid + ' src:' + req.query.src);
    get_baidu_site_link(req.query.src,options,function(err,db_data){
        var riglog = {
            remote_module:"pagedb",
            dict : options.dict,
            cost_time:(new Date*1) - start_time
        }
        if(err !== null) {
             riglog.status = 0;
             riglog.errorInfo=err;
             res.rigAddLogs.push(riglog);
            return callback(err);
            //bdlog.warn('get_baidu_site_link wrong err: '+err);
        }else if(db_data.status == 2) { //有移动域名
            var wapsite  =  db_data.wapsite;
            //var redirect_url = wapsite + "/?l="+req.query.l + "&ref=" + ref  + "&order="+order +"&dict=" + req.query.dict + "&src=" + encodeURIComponent(req.query.src);

            var redirect_url = wapsite + "/?" + qs.stringify(params) + '&src=' + encodeURIComponent(req.query.src);
            //bdlog.debug('logid:' + options.logid + " wapsite:" + wapsite + " db_data_status:" + db_data.status + ' redirect_url:' + redirect_url);
            res.locals['req_info']['status'] = 1020;
            res.redirect(replaceHTMLWords(redirect_url));
            res.end();
            riglog['wapsite'] = wapsite;
            res.rigAddLogs.push(riglog);
            return callback(null, true);

        }else if(db_data.status == 3){ //无移动域名或者移动域名未通过审核
            db_data.site = db_data.site ? db_data.site : '';
            var host =   "http://siteapp.baidu.com/";
            var query = qs.stringify(params) + "&host=" + db_data.site + "&src=" + encodeURIComponent(req.query.src);
            if(options.dict == 23){
                var redirect_url = host + "site/" + db_data.site + "/?"+ query;
                //bdlog.debug('logid:' + options.logid + " wapsite:" + wapsite + " db_data_status:" + db_data.status + ' redirect_url:' + redirect_url);
            }else if(options.dict == 22){
                var redirect_url = host + "webapp/" + db_data.site + "/?"+ query;
                //bdlog.debug('logid:' + options.logid + " wapsite:" + wapsite + " db_data_status:" + db_data.status + ' redirect_url:' + redirect_url);
            }
            res.locals['req_info']['status'] = 1020;
            res.redirect(replaceHTMLWords(redirect_url));
            res.end();
            riglog['site'] = db_data.site;
            res.rigAddLogs.push(riglog);
            return callback(null, true);
        }else if(db_data.status == 1){ //未出错但是也未查询到
           riglog.status = 0;
           riglog['errorInfo'] = "no site";
           res.rigAddLogs.push(riglog);
           return callback(null, false);
        }
    });
    
}


//检测是否存在wap站
function pro_wapsite(req, res, options, callback){  // if it is have wapsite,redirect src
    test_wapsite(req.query.src,options,function(err, flag, riglog){  // if it is have wapsite,redirect src
        res.rigAddLogs.push(riglog);
        if(err !== null) {
            return callback(err);
        }else if(flag == true){
            //bdlog.debug('logid:' + options.logid + " wapsite flag:" + flag);
            var src = url_format(req.query.src);
            //bdlog.debug('logid:' + options.logid + " wapsite flag:" + flag);
            res.locals['req_info']['status'] = 1030;
            res.redirect(replaceHTMLWords(src));
            res.end();
            return callback(null, true);
        }else{
            //bdlog.debug('logid:' + options.logid + " wapsite flag:" + flag);
            return callback(null, false);
        }
    })
}

function checkURL(req,res,options,callback){
	var rs = _initReqParam(req,options,callback);
	if(rs != 1){
		return;
	}
	if(req.query.dict == 22 || req.query.dict == 23){
        //bdlog.trace('logid:' + options.logid + "into dict==22");
        pro_site_link(req,res,options,function(err,data){
            if(err != null){
                bdlog.warn('get_baidu_site_link wrong err: '+err);
            }else if(data == true){
                return callback(null,req,res,options);
            }else{
                //page_data(req,res,options,callback);
                callback(null,req,res,options);
            }
        });
    }else if(req.query.ua == 1){
        //bdlog.trace('logid:' + options.logid + "into ua==1");
        pro_wapsite(req, res, options, function(err, data){
            if(err !== null) {
                bdlog.warn('logid:' + options.logid + 'test_wapsite wrong err: '+err);
            }else if(data == true){
                return callback(null,req,res,options);
            }else{
                //page_data(req,res,options,callback);
                callback(null,req,res,options);
            }
        });
    }else{
        // bdlog.trace('logid:' + options.logid + "into page_data");
        //page_data(req,res,options,callback);
        callback(null,req,res,options);
    }
	
}

module.exports = checkURL;