/**
 * JSON 数据传给对应的模块，调用对应的服务
 * @author machenhui 
 */

var http_request = require("proxyPass/http").request;
var conf = require("./conf/tcwiseConf");
function getHostPort(pageType){
	if(conf.modules[pageType]){
		return conf.modules[pageType];
	}else{
		return conf.modules["DEFAULT"];
	}
}
/**
 * @param {Object} options 获取指定端口数据
 * @param {Function} callBackFn
 */
function getPageData(req,res,data,callBackFn){
	var moudleHost = getHostPort(data['page_type']);
	var dataString = JSON.stringify(data);
	var pageType = data['page_type'];
	var reqMethod = "post";
	if(moudleHost["method"]){
		reqMethod = moudleHost["method"];
	}
	//设置具体的Header 记录调用模块
	if(res){
		res.setHeader("X-MODULE-NAME",pageType);
	}
	http_request({
		host:moudleHost.host,
		port:moudleHost.port,
		method:reqMethod,
		path:req.url,
		response:res,
		request:req,
		write_data:reqMethod!="post"?null:dataString,
		headers: {  
            "Content-Type": 'application/json',
            "Cookie":req.headers['cookie'],
            "Referer":req.headers['referer'],
            "User-Agent":req.headers['user-agent']
        }
	},function(error,data){
			console.log(error,moudleHost,pageType,data);
			callBackFn(error,data?data.toString():data);
	});
}

module.exports=getPageData;