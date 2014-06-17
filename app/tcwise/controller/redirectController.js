/**
 * Created with IntelliJ IDEA.
 * User: yaoxiangyang
 * Date: 13-10-23
 * Time: 下午4:07
 * To change this template use File | Settings | File Templates.
 */
var page = require('../models/logic/page.js')
    ,util = require('util')
    ,get_baidu_site_link = require('../models/logic/siteLink.js').get_baidu_site_link
    ,test_wapsite = require('../models/logic/siteUa.js').test_wapsite
    ,url_format = require('comlib').url_format
    ,url_path_to_query = require('comlib').url_path_to_query
    ,pro_site_name = require('../models/logic/siteName.js').pro_site_name
    ,get_adv_info = require('../models/logic/adv.js').get_adv_info
    ,config = require('../conf')
    ,jsmartier = require('jsmartier')
    ,error = require('comlib').makeError
    ,bdlog = require('comlib').bdlog
    ,is_empty_object = require('comlib').is_empty_object
    ,get_init_data = require('./tcwiseController.js').get_init_data
    ,init_options = require('./tcwiseController.js').init_options;

exports.redirect = function(req,res,callback){
    var options = init_options(req, res);
    var tpl_redirect_data = get_init_data();
    if(req.query.img){
         var imgsrc= req.query.img ? req.query.img : null,title=req.query.title?req.query.title:null;
         tpl_redirect_data.redirect={"type":"img","img":imgsrc,"title":title};
         var args = jsmartier.buildArgs(tpl_redirect_data);
         //console.log(args);
         var content = jsmartier.render('yundu/terminal.tpl', args);
         //console.log(content);
         res.end(content);
         bdlog.debug('logid:' + options.logid + ' output tpl_redirect_data');
         return callback(null,null);
    }else if(req.query.dataInfo){
        var imgsrc= req.query.img ? req.query.img : null,title=req.query.title?req.query.title:null;
        tpl_redirect_data.redirect={"type":"dataInfo","title":title};
        var args = jsmartier.buildArgs(tpl_redirect_data);
        var content = jsmartier.render('yundu/terminal.tpl', args);
        res.end(content);
        bdlog.debug('logid:' + options.logid + ' output tpl_redirect_data');
        return callback(null,null);
    }else{
        return callback(error('no param img'));
    }
}