

var cryptoMD5 = require("comlib").create_md5;
var redirectURL = "http://m.siteapp.baidu.com/redirect/?from=tcwise";
var transPageRoleURL = "http://m.baidu.com/pub/help.php?pn=22&ssid=0&from=844b&bd_page_type=1&uid=&pu=usm%405%2Csz%401330_220%2Cta%40big_3_7.5_4_9.0";
var userFeedBackURL = "http://feedback.baidu.com/";
var pcWebSiteAdminCallBackURL = "http://m.siteapp.baidu.com/renling/renling.php?from=baidusearch&domain=";
var key = "SiteappKey";
function parseData (src, hostClaim, showClaim, jzflag) {
    var data = {
        jzflag:jzflag,
    	redirectURL:redirectURL,
    	transPageRoleURL:transPageRoleURL,
    	userFeedBackURL:userFeedBackURL,
    	pcWebSiteAdminCallBackURL:pcWebSiteAdminCallBackURL,
    	src:src,
    	hostClaim:hostClaim,
    	showClaim:showClaim,
        mask:cryptoMD5(key+encodeURIComponent(src).toLowerCase()),
        mask2:cryptoMD5(key+encodeURIComponent(pcWebSiteAdminCallBackURL+hostClaim).toLowerCase())
    };
    return data;
};

module.exports =  parseData;
