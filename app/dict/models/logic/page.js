/**
 * Created with JetBrains WebStorm.
 * User: machenhui
 * Date: 14-6-5
 * Time: 下午7:15
 * To change this template use File | Settings | File Templates.
 */
var page_data = require('../dao/pageData.js').silk_request
//,s = require('./serviceDataSemi.js')
,error = require('comlib').makeError
,clone = require('comlib').clone
,bdlog = require('comlib').bdlog
,conf  = require("../../conf/tcwiseConf")
,fs = require('fs') ;

var page_type = {
    "WIDE_STRUCT" : 1,
    "WIDE_STRUCT_SIGN" : 2,
    "GRID_PAGE" : 3,
    "PAGE_TYPE_LINK" : 4,
    "PAGE_TYPE_NEWS_CONTENT" : 5,
    "PAGE_TYPE_TEXT" : 6,
    "PAGE_TYPE_BBS_HOMEPAGE" : 7,
    "PAGE_TYPE_BBS_LIST" : 8,
    "PAGE_TYPE_BBS_CONTENT" : 9,
    "PAGE_TYPE_NOVEL_COVER" : 10,
    "PAGE_TYPE_NOVEL_LIST" : 11,
    "PAGE_TYPE_NOVEL_CONTENT" : 12,
    "PAGE_TYPE_IMAGE_CONTENT" : 13
};
var page = function(src, options){
    this._src = src;
    this._type = '';
    this._data = [];

}

page.get_page_type = function(data,options,callback){

    if(arguments.length == 2){
        callback = options;
        options = [];
    }

    var type_num = 3;
    var data_page_type = data['page_type'];
    //bdlog.debug('logid:'+options.logid + ' page_flag:' + data.page_flag);
    if(data.page_flag && data.page_flag.toString().match(/1$/)){
        type_num = 2;
    }else if(data['struct_type'] == 'WIDE_STRUCT'){
        type_num = 1;
    }else if(data_page_type){
        type_num =  page_type[data_page_type] ? page_type[data_page_type] : type_num;
    }
    if((type_num >=3 && type_num <=6) || (type_num >=10 && type_num <=11)){
        callback(error('not supported struct_data'));
    }else{
        callback(null,type_num);
    }

}
/**
 * @param {string} src
 * @param options
 * @param callback
 */
page.get_page_data = function(src,options,callback){
    if(arguments.length == 2){ //no options
        callback = options;
        options = [];
    }
    // console.log(options.req);
    var request = [];
    if(options.req){
        request = clone(options.req.query);
    }
    if(options.req && options.req.query.ad == 1){
        request.siteappid = conf.siteApp.adID;
    }else{
        request.siteappid = conf.siteApp.id;
    }
    request.preview = 0;
    request.version = 0;
    request.siteType = 6;
    request.logpack = 1;
    //request.onlyspdebug = 1;
    if(options.req && options.req.query.nocache !== undefined){
        request.recache = 1;
    }
    request.src = src;
    page_data(request,options,function(err ,data){
            if(err !=null){
            callback(err);
            }else{
            var source_data = data;
            //var source_data = JSON.parse(data);
            // console.log("source_data:"+typeof(source_data));
            if(options.length!==0){
            // console.log('into opstion');
            if(options.req.query.tc_source && options.req.query.tc_source == 1){
            callback(null, source_data);
            /* if(options.req.query.fs && options.req.query.fs == 1){
               fs.open('./app/tcwise/test/data/tmp.txt','w+',function(err, fd){
               fs.writeSync(fd, JSON.stringify(source_data));
               });
               } */

            return;
            }
            }

            if(source_data && source_data.url != null && source_data.redirect_type != null){
                callback(null,source_data);
                return;
            }else if(source_data.blocks ==null ||source_data.blocks.length == 0 ){
                err = error("blocks is empty");
                callback(err);
                return;
            }
            page.get_page_type(source_data,options,function(err,type_num){
                    if(err !=null){
                        callback(err);
                    }else{
                        page._type = type_num;
                        //process struct data
                        /*s.sData.getData(source_data,page._type,request.siteappid,options, function(err, process_data){
                                process_data.struct_page_type = page._type;
                                callback(null,process_data);
                        });*/
                        //process_data.struct_page_type = page._type;
                        callback(null,source_data);
                    }
             });

            }
    });
}

module.exports = page;
