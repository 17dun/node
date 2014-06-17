/**
 * @author machenhui
 */

var StructData = require("./structData")
	,url_path_to_query = require('comlib').url_path_to_query
	,replaceHTMLWords = require('comlib').replaceHTMLWords
    ,url_decode = require('comlib').url_decode
	,bdlog = require('comlib').bdlog;
var PushData = require("./pushData"),filterURL=require("./filterURL");
function init_options(req,res){
    //URL path 转化成query
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

function transStructData(req,res,options,callBackFn){
	StructData.get(req,res,options,function(error,data){
		if(error){
			res.writeHead(302,{"Location":req.query.src});
			res.end();
			bdlog.debug(error.stack);
			callBackFn(null,{});
		}else{
			PushData(req,res,data,function(error,data){
				if(error){
					res.writeHead(302,{"Location":req.query.src});
					res.end();
					bdlog.debug(error);
					callBackFn(null,{});
				}else{					
					res.end(data);
					callBackFn(null,{});
				}
			});			
		}
		
	});
	
}
module.exports={
		main:function(req,res,callBackFn){
			var options = init_options(req,res);
			filterURL(req,res,options,function(err,req,res,opts){
				if(err){
					console.error(err);
					callBackFn(err);
				}else{
					transStructData(req,res,opts,callBackFn);
				}
				
			});			
		}
};