var tcwise = require('../controller')
    ,bdlog = require('comlib').bdlog
    ,url_format = require('comlib').url_format
    ,url_decode = require('comlib').url_decode
    ,checkXSS = require('comlib').checkXSS
    ,redirect = require('../controller/redirectController.js').redirect;

function recordLog(req, res){
    var req_info = res.locals['req_info'];
    req_info['time'] = Date.now() - res.locals['req_info']['time'];
    req_info['http_code'] = res.statusCode;
    req_info['route']  =req.route.method;
    req_info['cookies']  =req.cookies;
    bdlog.notice(req_info);
    if(req_info.flag=="[REQUEST_LOG]"){
       try{
        rigLog(req_info,req,res);
       }catch(e){
       
       }
    }
}

function rigLog(sourceLog,req, res){
   var log = {
      "logid"  : sourceLog.logid,
      "product": "sumeru",
      "subsys":"siteapp",
      "module": "tcwise",
      "status_code":sourceLog.http_code,
      "cost_time": sourceLog.time,
      "from_ip" : req.get("X-Forwarded-For")||sourceLog.req_ip,
      "status" : sourceLog.status||1,
      "succ" : sourceLog.succ,
      "errno" : sourceLog.errno,
      "dict": req.query.dict,
      "url":encodeURIComponent(sourceLog.req_uri)
   }

   if(sourceLog.time != null && Math.abs(sourceLog.time)>30000){
        return;
   }
   //处理错误信息
   if(sourceLog.status==1040){
      if(sourceLog.errorInfo){
        log.status = 1041;
      }
      var silk_info = {
        "redirect_type": sourceLog.redirect_type,
        "errorInfo": sourceLog.errorInfo||"wap",
        "module" : "silkserver_error"
      }
      res.rigAddLogs.push(silk_info);
   }
   if(sourceLog.silk_log&&sourceLog.status!=1040){
      var silk_log = sourceLog.silk_log;
      silk_log.module = "silkserver_log";
      log.silk_time = sourceLog.silk_time;
      log.render_time = sourceLog.render_time;
      log.hit_cache = silk_log.hit_cache;
      log.hit_pagedb = silk_log.hit_pagedb;
      log.streamcrawler_time = silk_log.streamcrawler && silk_log.streamcrawler.split(',')[0] || 0;
      log.readpagedb_time = silk_log.readpagedb && silk_log.readpagedb.split(',')[0] || 0;
      log.readcache_time = silk_log.readcache && silk_log.readcache.split(',')[0] || 0;
      log.smartlayout_time = silk_log.smartlayout && silk_log.smartlayout.split(',')[0] || 0;
      res.rigAddLogs.push(silk_log);
   }
   bdlog.rigNotice(log,res.rigAddLogs);
   //bdlog.rigNotice(sourceLog);
}

function init(app){
//    console.log(app);
   app.all( '*', function(req, res, next){
       //bdlog.rigAddlogs = [];
       //res.end('hello world'+req.query.toString());
       //console.log(req.params);
       if(checkXSS(req.url)){
           res.redirect("http://www.baidu.com/search/error.html");
           return;
       }
       res.rigAddLogs = [];
       if(req.params.join().match(/redirect/)){
           redirect(req,res,function(err,data){
               if(err !== null){
                   res.locals['req_info']['errno'] = err.message;
                   res.locals['req_info']['succ'] = 0;
                   if(req.query.src){
                       res.locals['req_info']['status'] = 1050;
                       res.redirect(url_format(req.query.src));
                   } else{
                       res.locals['req_info']['status'] = 1001;
                       res.redirect("http://www.baidu.com/search/error.html");
                   }
                   res.end();
               }else{
                   res.locals['req_info']['succ'] = 1;
               }
               res.locals['req_info']['flag'] = '[REDIRECT_LOG]';
               recordLog(req, res);
           });
       }else if(req.params.join().match(/jianzhan/)){
          try{
           req["fromJianZhan"] = true;
           tcwise.main(req, res, function(err, data){
                if(err !== null){
                   res.locals['req_info']['errno'] = err.message;
                   res.locals['req_info']['succ'] = 0;
                   if(req.query.src){
                       res.locals['req_info']['status'] = 1010;
                       //res.redirect(url_format(req.query.src));
                   } else{
                       res.locals['req_info']['status'] = 1000;
                       //res.redirect("http://www.baidu.com/search/error.html");
                   }
                   res.end();
               }else{
                   res.locals['req_info']['silk_log'] = data ? data.silk_log : null;
                   res.locals['req_info']['silk_time'] = data ? data.silk_time : null;
                   res.locals['req_info']['render_time'] = data ? data.render_time : null;
                   res.locals['req_info']['succ'] = 1;
               }
               if(res.locals['req_info']['redirect_type'] != null){
                  var d ={html:""};
                  if(req.query.src){
                       d.html = url_format(req.query.src);
                       d.status = 302;
                   } else{
                       d.status = 501;
                   }
                   res.send(JSON.stringify(d));
               }
               res.locals['req_info']['flag'] = '[REQUEST_LOG]';
               recordLog(req, res);
            });
         }catch(e){
            console.log("error");
            res.redirect("http://www.baidu.com/search/error.html");
         }
       }else {
         try{
           bdlog.debug("请求的URL地址",url_decode(req.url));
           if(req.method == "POST"){
               //内部调度传输的请求
               req["fromPageTypeController"] = true;
           }
           tcwise.main(req, res, function(err, data){
               if(err !== null){
                   res.locals['req_info']['errno'] = err.message;
                   res.locals['req_info']['succ'] = 0;
                   if(req.query.src){
                       res.locals['req_info']['status'] = 1010;
                       res.redirect(url_format(req.query.src));
                   } else{
                       res.locals['req_info']['status'] = 1000;
                       res.redirect("http://www.baidu.com/search/error.html");
                   }
                   res.end();
               }else{
                   res.locals['req_info']['silk_log'] = data ? data.silk_log : null;
                   res.locals['req_info']['silk_time'] = data ? data.silk_time : null;
                   res.locals['req_info']['render_time'] = data ? data.render_time : null;
                   res.locals['req_info']['succ'] = 1;
               }
               res.locals['req_info']['flag'] = '[REQUEST_LOG]';
               recordLog(req, res);
            });
         }catch(e){
            res.locals['req_info']['errno'] = e.message+"  try_cache error redirect";
            res.locals['req_info']['succ'] = 0;
            if(req.query.src){
                res.locals['req_info']['status'] = 1010;
                res.redirect(url_format(req.query.src));
            } else{
                res.locals['req_info']['status'] = 1000;
                res.redirect("http://www.baidu.com/search/error.html");
            }
            res.end();
            res.locals['req_info']['flag'] = '[REQUEST_LOG]';
            recordLog(req, res);
         }
       }
   });
}

exports.init = init;