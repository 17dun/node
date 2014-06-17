/**
 * 获取pageData数据
 */
var http_request = require("comlib").http_request,bdlog = require('comlib').bdlog,replaceHTMLWords = require('comlib').replaceHTMLWords;
var page = require('./models/logic/page.js');


function getPageData(req,res,options,callback){
	var page_data_startt = +new Date();
	options.time_record = {};
    options.time_record['page_data'] = {
        'start': page_data_startt,
        'last': 0
    };
    options.get_page_data_flag = false;
	page.get_page_data(req.query.src, options, function(err, data, riglog) {
		options.time_record['page_data']['last'] = +new Date() - page_data_startt;
		bdlog.debug(req.query.src, "__get_page_data__");
		if (options.get_page_data_flag == false) {
			options.get_page_data_flag = true;
			if (err != null) {
				return callback(err);
			} else {

				if (req.query.tc_source && req.query.tc_source == 1) { //��tc_source=1�����ԭʼ����

					res.send(data);
					res.end();
					return callback(null, data);

				} else if (data && data.url != null && data.redirect_type != null) { //��redirect��ֱ����ת��Դ��ҳ

					//res.redirect(req.query.src);
					res.locals['req_info']['status'] = 1040;
					res.locals['req_info']['redirect_type'] = data.redirect_type;
					res.locals['req_info']['errorInfo'] = data.errorInfo;
					res.redirect(replaceHTMLWords(data.url));
					return callback(null, data);
				} else if (req.query.ad == 1) { 
					bdlog.trace('logid:' + options.logid + ' ad:' + req.query.ad
							+ ' mes:' + 'show page_ad');
					//展示原网站广告
					//show_page_ad(data, req, res, options, callback);
					callback(null,data, req, options);
				} else {
					bdlog.trace('logid:' + options.logid + ' ad:' + req.query.ad
							+ ' mes:' + 'show page');
					//��¼ʱset_cookie
					//console.log("cookie:",data.set_cookie);
					if (data.set_cookie) {
						//console.log('ss');
						//console.log(data.set_cookie);
						bdlog.trace('logid:' + options.logid + ' cookie:'
								+ data.set_cookie);
						var cookie = data.set_cookie.split('\t');
						res.setHeader("Set-Cookie", cookie);
					}
					source_page_data = data;
					
					bdlog.debug(req.query.src, "__get_page_data__");
					
					//show_page(source_page_data, req, res, options, callback);
					
					callback(null,source_page_data, req, options);
				}
			}
		} else {
			bdlog.error("重复调用get_page_data", data);
		}
	});
}


module.exports = {
		get:getPageData
}

