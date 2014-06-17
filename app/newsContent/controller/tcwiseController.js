/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-8-29
 * Time: 下午6:00
 * To change this template use File | Settings | File Templates.
 */
var page = require('../models/logic/page.js')
    ,util = require('util')
    ,get_baidu_site_link = require('../models/logic/siteLink.js').get_baidu_site_link
    ,test_wapsite = require('../models/logic/siteUa.js').test_wapsite
    ,url_format = require('comlib').url_format
    ,url_parse = require('comlib').url_parse
    ,url_path_to_query = require('comlib').url_path_to_query
    ,pro_site_name = require('../models/logic/siteName.js').pro_site_name
    ,get_adv_info = require('../models/logic/adv.js').get_adv_info
    ,config = require('../conf')
    ,Jsmartier = require('jsmartier')
    ,error = require('comlib').makeError
    ,bdlog = require('comlib').bdlog
    ,replaceHTMLWords = require('comlib').replaceHTMLWords
    ,url_decode = require('comlib/decodeURL')
    ,is_empty_object = require('comlib').is_empty_object
    ,qs = require('querystring')
    ,footer = require('./footer')
    ,pageRender = require("./pageRender");

var localstorage = 1;
if(localstorage){
    var fs = require('fs')
        ,crypto = require('crypto')
        ,static_config = config.static
        ,tcwise_static = require('../../../template/yundu/static/index.js')
        ,static_data = tcwise_static.statics;

    var static_path = 'template/yundu/static/';
    var JS_AND_CSS = {},
        static_stamp = {};

    // cache the file content 
    for(var index in static_data){
        var md5_hash = crypto.createHash('md5');
        var value = static_data[index];
        JS_AND_CSS[index] = fs.readFileSync(static_path + value, 'utf-8');
        static_stamp[index] = md5_hash.update(JS_AND_CSS[index] + '').digest('hex').substr(0,6);
    };
}



var tplPlugin = require("tplPlugin");
//jsmartier.config(config.jsmartier);
var jsmartier = new Jsmartier(config.jsmartier);
tplPlugin.init(jsmartier);
pageRender.initPlugin(jsmartier);
var siteIcon = require("../models/logic/siteIcon");

function main(req, res, callback){

        //console.log(req.get());
    //console.log(req.query);
    var init_data = get_init_data();
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
    var options = init_options(req,res);
    options.query_src = query_src;

    bdlog.debug('logid:' + options.logid + "into tcwiseController");
    if(req["fromPageTypeController"]){
        page_data(req,res,options,callback);
    }else{
        if(req.query.dict == 22 || req.query.dict == 23){
            //bdlog.trace('logid:' + options.logid + "into dict==22");
            pro_site_link(req,res,options,function(err,data){
                if(err != null){
                    bdlog.warn('get_baidu_site_link wrong err: '+err);
                }else if(data == true){
                    return callback(null,null);
                }else{
                    page_data(req,res,options,callback);
                }
            });
        }else if(req.query.ua == 1){
            //bdlog.trace('logid:' + options.logid + "into ua==1");
            pro_wapsite(req, res, options, function(err, data){
                if(err !== null) {
                    bdlog.warn('logid:' + options.logid + 'test_wapsite wrong err: '+err);
                }else if(data == true){
                    return callback(null, null);
                }else{
                    page_data(req,res,options,callback);
                }
            });
        }else{
            // bdlog.trace('logid:' + options.logid + "into page_data");
            page_data(req,res,options,callback);
        }
    }

}

function pro_site_link(req,res,options,callback){

    var params ={
        'l' :  req.query.l,
        'ref' : req.query.ref ? req.query.ref : '',
        'order' : req.query.order ? req.query.order : '',
        'dict' : req.query.dict,
        'tj' : req.query.tj ? req.query.tj : '',
        'cltj' : req.query.cltj ? req.query.cltj : ''
    };
    var start_time = new Date*1
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
       // page_data(req,options,callback);
    });
}

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
function page_data(req,res,options,callback){
    var site_name_info = {};
    var source_page_data = null;
    var num = 3;
    options.pro_adv_info_flag = false;
    options.site_name_flag = false;
    options.get_page_data_flag = false;

    options.time_record = {};
    
    var site_name_startt = +new Date();
    options.time_record['site_name'] = {
        'start': site_name_startt,
        'last': 0
    };
    site_name(req.query.src,options,function(data,riglog){
        res.rigAddLogs.push(riglog);
        options.time_record['site_name']['last'] = +new Date() - site_name_startt;
        if(!is_empty_object(data)){
            options.site_name_info = data;
        }
        if(options.site_name_flag == false){
           options.site_name_flag = true;
           num--;
           bdlog.debug(req.query.src,"__site_name__",num);
           if(num == 0){
               show_page(source_page_data,req, res, options, callback);
           }
        }else{
            bdlog.error("重复调用siteName",data);
        }

    });
    var adv_info = {};
    var adv_info_startt = +new Date();
    options.time_record['adv_info'] = {
        'start': adv_info_startt,
        'last': 0
    };
    pro_adv_info(req.query.src,options,function(data){
        options.time_record['adv_info']['last'] = +new Date()- adv_info_startt;
        if(!is_empty_object(data)){
            options.adv_info = data;
        }
        if(options.pro_adv_info_flag == false){
            options.pro_adv_info_flag = true;
            num--;
            bdlog.debug(req.query.src,"__pro_adv_info__",num);
            if(num == 0){
                show_page(source_page_data,req, res, options, callback);
            }
        }else{
           bdlog.error("重复调用advInfo",data);
        }

    });
    var page_data_startt = +new Date();
    options.time_record['page_data'] = {
        'start': page_data_startt,
        'last': 0
    };
    page.get_page_data(req.query.src,options,function(err,data,riglog){
        options.time_record['page_data']['last'] = +new Date() - page_data_startt;
        bdlog.debug(req.query.src,"__get_page_data__",num);
        if(options.get_page_data_flag == false){
            options.get_page_data_flag = true;
            if(err != null){
                return callback(err);
             }else{

                if(req.query.tc_source && req.query.tc_source == 1){ //带tc_source=1的输出原始数据

                    res.send(data);
                    res.end();
                    return callback(null,data);

                }else if(data && data.url != null && data.redirect_type != null){ //带redirect的直接跳转到源网页

                    //res.redirect(req.query.src);
                    res.locals['req_info']['status'] = 1040;
                    res.locals['req_info']['redirect_type'] = data.redirect_type;
                    res.locals['req_info']['errorInfo'] = data.errorInfo;
                    res.redirect(replaceHTMLWords(data.url));
                    return callback(null,data);
                }else if(req.query.ad == 1){  //输出页面广告信息
                    bdlog.trace('logid:' + options.logid + ' ad:' + req.query.ad + ' mes:' + 'show page_ad');
                    //输出页面广告信息
                    show_page_ad(data,req,res,options,callback);
                }else{
                    bdlog.trace('logid:' + options.logid + ' ad:' + req.query.ad  + ' mes:' + 'show page');
                    //登录时set_cookie
                    //console.log("cookie:",data.set_cookie);
                    if(data.set_cookie){
                        //console.log('ss');
                        //console.log(data.set_cookie);
                        bdlog.trace('logid:' + options.logid + ' cookie:' + data.set_cookie);
                        var cookie = data.set_cookie.split('\t');
                        res.setHeader("Set-Cookie", cookie);
                    }
                    source_page_data = data;
                    num--;
                    bdlog.debug(req.query.src,"__get_page_data__",num);
                    if(num == 0){
                        show_page(source_page_data,req, res,options, callback);
                    }

                }
            }
        }else{
               bdlog.error("重复调用get_page_data",data);
        }
    });


}



function show_page_ad(data, req, res, options, callback){
   data.page_ad =  "<div class='ssNormal ssAD'>";
    //页面广告先输出
    if(data != null && data.blocks.length > 0){
        for(var i = 0,l = data.blocks.length;i<l;i++){
            var block = data.blocks[i];
            pageRender.preData(block,data,options,i);
        }
    }
    data.page_ad += "</div>";
    if(data.page_ad == "<div class='ssNormal ssAD'></div>"){
        data.page_ad = "";
    }
    var tpl_ad_data = get_init_data();
    tpl_ad_data.page_ad = data.page_ad;
    tpl_ad_data.src = req.query.src;
    if(tpl_ad_data.page_ad && !data.copyRight && req.query.xdebug == 1){
        res.send(tpl_ad_data);
        res.end();
        return callback(null,data);
    }else if(tpl_ad_data.page_ad && !data.copyRight && !req.query.xdebug){
        res.send(tpl_ad_data.page_ad);
        return callback(null,data);
    }else if(!is_empty_object(data.copyRight)){
        //console.log(typeof data.copyRight);
        //输出结构化的版权信息
        tpl_ad_data.adAjax = 1;
        tpl_ad_data.res = {
          'data' : {
              'copyRight' :  data.copyRight,
              'outLink' :data.outLink
          },
          'status' : 2
        };

        tpl_ad_data.querySrc = "http://www.baidu.com";

        var args = jsmartier.buildArgs(tpl_ad_data);
        //bdlog.debug('logid:' + options.logid + ' output tpl_ad_data');
        //console.log(args);
        var content = jsmartier.render('yundu/terminal.tpl', args);
        //console.log(content);
        if(req.query.xdebug == 1){
            res.send(tpl_ad_data);
            res.end();
            return callback(null,data);
        }else{
            res.end(tpl_ad_data.page_ad + content);
            // res.end(content);
            return callback(null,data);
        }
    }else{
        res.end();
        bdlog.warn("error",data);
        callback(null,data);
    }

}

var staticVersion;
//输出页面信息
function show_page(data,req, res, options, callback){
    bdlog.debug('logid:' + options.logid + ' req.query:' + JSON.stringify(options.query_src));
    var isFromSearch = options.query_src.order;
    delete options.query_src.order;
    delete options.query_src.src;
    delete options.query_src.ua;
    delete options.query_src.tj;//去除URL 中的统计参数
    delete options.query_src.sample;//去除URL 中的抽样参数
    delete options.query_src.ts;
    delete options.query_src.ref;
    delete options.query_src.lid;
    delete options.query_src.vit;
    delete options.query_src.cltj;
    delete options.query_src.sec;
    delete options.query_src.di;
    delete options.query_src.baiduid;
    delete options.query_src.nocache;
    //将所有的参数进行编码，过滤特殊字符
    for(var key in options.query_src){
         options.query_src[key]=escape(options.query_src[key]);
    }
    
    //bdlog.debug('logid:' + options.logid + ' req.query:' + JSON.stringify(options.query_src));
    if(!data){
        return callback(error('data is null in show_page'));
    }
    //bdlog.debug('logid:' + options.logid + ' ad:' + req.query.ad  + ' data:' + JSON.stringify(data.page_ad));
    var tpl_data = get_init_data();
    //bdlog.debug('logid:' + options.logid + ' ad:' + req.query.ad  + ' data:' + JSON.stringify(tpl_data.page_ad));
    tpl_data.res.status = 1;
    tpl_data.struct_page_type = data.struct_page_type;
    tpl_data.dict = req.query.dict;
    if(isFromSearch || (options.referer && options.referer.search(/http:\/\/.*\.baidu\.com\/s\?word=.*/g)!=-1)){
        tpl_data.isSearchResult = 1;
    }
    tpl_data.src = req.query.src;
    //添加抽样参数sample透传
    tpl_data.sample=req.query.sample?req.query.sample:"";
    tpl_data.querySrc =  qs.stringify(options.query_src);
    tpl_data.silk_time = data.silk_time||0;
    tpl_data.silk_log = data.silk_log||0;
    tpl_data.localstorage = 1;
    tpl_data.time_record = options.time_record;
    tpl_data.bdstamp = req.query.ts||0;
    tpl_data.staticVersion = staticVersion;
    var tcwise_config = static_config;
    //res.end(JSON.stringify(tcwise_config));
    tpl_data.RunEnv = tcwise_config.RunEnv;
    tpl_data.OfflinePath = tcwise_config.OfflinePath;
    tpl_data.OnlinePath = tcwise_config.OnlinePath;
    tpl_data.jsVersion = tcwise_config.jsVersion;
    tpl_data.cssVersion = tcwise_config.cssVersion;
    tpl_data.search_query=options.search_query;
    if(tpl_data.struct_page_type == 2){
        tpl_data.res.custom = data.custom;
    }

    // bdlog.debug('logid:' + options.logid + ' ad:' + req.query.ad  + ' data:' + JSON.stringify(tpl_data.page_ad));
    //是否加载广告
    if(config.show_page_ad && data.has_ad){
        tpl_data.has_ad = 1;
    }
    var site_name_flag = options.site_name_flag;
    var pro_adv_info_flag = options.pro_adv_info_flag;
    var site_name_info = options.site_name_info;
    var adv_info = options.adv_info;
    // bdlog.debug('logid:' + options.logid + ' ad:' + req.query.ad  + ' data:' + JSON.stringify(tpl_data.page_ad));
    if(site_name_flag && pro_adv_info_flag){

        if(site_name_flag && !is_empty_object(site_name_info)){             //站点信息处理完才赋值
            data.site_name = site_name_info.site_name;
            data.site_url = site_name_info.site_url;
            data.site_domain = site_name_info.site_domain;
        }
        var siteIconURL = siteIcon(req.query.src);
        if(siteIconURL){
               data.siteIconURL = siteIconURL;
        }
        tpl_data.res.data = data;
        tpl_data.showClaim = false;
        tpl_data.ad = [];

        // bdlog.debug('logid:' + options.logid + ' ad:' + req.query.ad  + ' data:' + JSON.stringify(tpl_data.page_ad));

        if(pro_adv_info_flag && !is_empty_object(adv_info) && !req.query.noad){
            // console.log(adv_info);
            //bdlog.debug('logid:' + options.logid + 'adv_info: '+ JSON.stringify(adv_info));
            if(adv_info.ad.host){
                tpl_data.ad = adv_info.ad;
                tpl_data.showClaim = adv_info.showClaim != undefined ? adv_info.showClaim : false;
                // tpl_data.hostClaim = encodeURIComponent(adv_info.hostClaim);
                tpl_data.hostClaim = adv_info.hostClaim;
            }
        }
        bdlog.trace('logid:' + options.logid + ' site_name_flag:' + site_name_flag + ' pro_adv_info_flag:' + pro_adv_info_flag);
        // bdlog.debug('logid:' + options.logid + ' ad:' + req.query.ad  + ' data:' + JSON.stringify(tpl_data.page_ad));
       
        if(tpl_data.localstorage === 1){
            
            // localstorage static files
            var statics = localstorage_static(req, res);
            tpl_data.statics = statics;    
            //res.end(JSON.stringify(req.cookies));
            //res.end(JSON.stringify(tpl_data.statics));
        }
        //处理footer数据
        tpl_data.pageFooter = footer(tpl_data.src, tpl_data.hostClaim, tpl_data.showClaim);

        var args = jsmartier.buildArgs(tpl_data);
        //bdlog.debug('logid:' + options.logid + ' output tpl_data');
        //console.log(args);
        //var content = jsmartier.render('yundu/terminal.tpl', args);
        var startTime = new Date().getTime();
        pageRender.render(args,jsmartier,options,function(content,tplData){
               var endTime = new Date().getTime();
               //console.log("模板渲染一共耗时::",endTime-startTime);
               var render_time = endTime-startTime;
               data.render_time = render_time;
               if(req.query.xdebug == 1){
                   res.send(tplData);
                   res.end();
                   callback(null,data);
               }else{
                  res.end(content);
                  callback(null,data);
               }

        },res);
        //console.log(content);
        //res.end(content);
        //return callback(null,data);
    }
}

//静态文件本地存储
function localstorage_static(req, res){

    var cookie_lv = req.cookies.sapp_ls,
        max_age = 864000000,
        expire = 0; 
    var statics = {},
        cookie_new = [];

    //res.end(JSON.stringify(static_data));

    // check need to change or not
    if(!cookie_lv || cookie_lv == 'no'){
        // can't support the localstorage
        for(var index in static_data){
            var value = static_data[index];
            statics[index] = JS_AND_CSS[index];
            var md5 = static_stamp[index];
            cookie_new.push(index + '@' + md5);
        };
        res.cookie('sapp_ls', cookie_new.join(','), { domain: req.host, path: '/', maxAge: max_age});
    }else{
        cookie_lv_arr = cookie_lv.split(',');
        if(cookie_lv_arr.length){
        
            var cookie_arr = [];
            cookie_lv_arr.forEach(function(value, index){
                var cookie_kv = value.split('@');
                cookie_arr[cookie_kv[0]] = cookie_kv[1];
            });
            var set_cookie_flag = false;
            for(var index in static_data){
                var value = static_data[index];
                var md5 = static_stamp[index];
                if(md5 != cookie_arr[index]){
                    set_cookie_flag = true;
                    statics[index] = JS_AND_CSS[index];
                }
                cookie_new.push(index + '@' + md5);
            }
            if(set_cookie_flag){
                res.cookie('sapp_ls', cookie_new.join(','), { domain: req.host, path: '/', maxAge: max_age});
            }
        }else{
            for(var index in static_data){
                var value = static_data[index];
                statics[index] = JS_AND_CSS[index];
                var md5 = static_stamp[index]; 
                cookie_new.push(index + '@' + md5);
            };
            res.cookie('sapp_ls', cookie_new.join(','), { domain: req.host, path: '/', maxAge: max_age});
        }
    }
    staticVersion = cookie_new.join(',');
    return statics;
}

function pro_adv_info(src,options,callback){
    get_adv_info(src,options,function(err,ad_info){
        var adv_data = {};
        if(err !== null){
            // bdlog.warn('err' + err.message);
            bdlog.warn('logid:' + options.logid + ' err: get adv_info wrong err ' + err);
        }else{
            adv_data = ad_info;
        }
        // pro_adv_info_flag = true;
        callback(adv_data);
    });
}

function site_name(src,options,callback){
    bdlog.debug('logid:' + options.logid + ' in site_name');
    pro_site_name(src,options,function(err,site_name_info,riglog){
        var data = {};
        if(err !== null){
            bdlog.warn('logid:' + options.logid + ' get site_name wrong err: '+ err.message);
        }else{
            // res.end(site_name_info.toString());
            //console.log(site_name_info);
            bdlog.debug('logid:' + options.logid + ' site_name_info:' + JSON.stringify(site_name_info));
            data.site_name = site_name_info.site_name;
            data.site_url = site_name_info.site_url;
            data.site_domain = site_name_info.site_domain;
        }
        // site_name_flag = true;
        callback(data,riglog);
    });
}

function get_init_data(){
    var init_data =  {
        siteInfo : {
            isSearchBox : 0,
            nav_theme : 2,
            color : "#3075ef"
        },
        siteType : 6 ,
        isSearchBox : 0,
        color : "#3075ef",
        appid : 1,
        res : {
            status : 0
        },
        terminal_type : 1
    }
    return init_data;
}
function init_options(req,res){
    //添加搜索query，query为w参数第三位
    var cur_qurey = url_path_to_query(req.path,req.query),search_query;
    //req.query = url_path_to_query(req.params,req.query);
    if(cur_qurey.w){
        var cur_reg=/(.*?_)(.*?_)(.*?)$/;
        var cur_matchs=cur_qurey.w.match(cur_reg);
        if(cur_matchs&&cur_matchs[3]){
            //search_query = decodeURIComponent(cur_matchs[3]);
            search_query = url_decode(cur_matchs[3]);
        }
    }
    var options = {
        req : req,
        res : res,
        search_query:search_query,
        logid : res.locals.req_info.logid,
        "original_url" : req.originalUrl,
        "x-forwarded-for" : req.get('X-Forwarded-For') ? req.get('X-Forwarded-For') : null,
        "referer" : req.get('Referer') ? req.get('Referer') : null,
        "cookies" : req.get("Cookie") ? req.get("Cookie").toString() : null,
        "user-agent" : req.get("User-Agent"),
        "ori_time" : res.locals.req_info.time,
        "dict" : req.query.dict
    };
    return options;
}

exports.main=main;
exports.get_init_data = get_init_data;
exports.init_options = init_options;
