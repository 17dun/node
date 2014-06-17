var predata = require('predata')
,cpredata = require('cpredata')
,bdlog = require('comlib').bdlog;
var serviceDataSemi = {

getData : function(data,type,appid,options,callback){
              //console.log(type);
              if(arguments.length == 4){
                  callback = options;
                  options = [];
              }
              var init = "navList,navListSed,navXpath,mainNavList,mainNavXpath".split(",");
              var res = data, nav = res.nav = {};
              res.page_ad =  "<div class='ssNormal ssAD'>";

              while(init.length) nav[init.shift()] = [];
              //bdlog.debug('logid:' + options.logid + ' type:'+ type + ' nav:' + JSON.stringify(nav));

              res.custom = {}; res.custom.cpt_tab=[];
              //bdlog.debug('logid:' + options.logid + ' res.custom:' + JSON.stringify(res.custom));
              var len =  data.blocks.length;
              if(type == 1 || type == 2) { //泛结构化
                  data.blocks.forEach(function(block,k){
                          var type =  block.type.toLowerCase().replace(/_/g,'');
                          var func_name = "prepro_" + type;

                          // bdlog.debug('logid:' + options.logid + ' func_name: cpredata[prepro_nav]' + typeof(cpredata.prepro_nav));
                          //bdlog.debug('logid:' + options.logid + ' func_name:' + func_name);
                          // bdlog.debug('logid:' + options.logid + ' predata func_name:' + predata[func_name] + ' cpredata func_name:' + cpredata[func_name] );

                          var func = typeof(predata[func_name]) == "function" ?  predata[func_name] : (typeof(cpredata[func_name]) == "function" ? cpredata[func_name] : undefined );
                          if(func){
                          func(block, res, appid, options, function(err, block){
                              if(block){
                              res.blocks[k] = block;
                              //console.log(func_name);
                              }
                              len--;
                              if(len == 0){
                              res.page_ad += "</div>";
                              if(res.page_ad.search(/^<div class=\'ssNormal ssAD\'><\/div>$/)==0){
                                res.page_ad = '';
                              }
                              callback(null,res);
                              }
                              });
                          }else{ //不需要处理的也认为是处理过
                              len--;
                              if(len == 0){
                                  res.page_ad += "</div>";
                                  if(res.page_ad.search(/^<div class=\'ssNormal ssAD\'><\/div>$/)==0){
                                      res.page_ad = 'ssss';
                                  }
                                    
                                  callback(null,res);
                              }
                          }
                  });
              }else if(type >=3 && type <= 13){ //结构化
                  var page_type =  data.page_type.toLowerCase().replace(/_/g,'');
                  var func_name = "prepro_" + page_type.slice(8);
                  //bdlog.debug('logid:' + options.logid + ' func_name:' + func_name);
                  var func = typeof(predata[func_name]) == "function" ?  predata[func_name] : (typeof(cpredata[func_name]) == "function" ? cpredata[func_name] : undefined );
                  if(func){
                      func(data, res, appid, options, function(err, res_data){
                           if(err!==null){
                               bdlog.warn('logid:' + options.logid + ' err:' + err);
                           }else{
                               res.pageType = data.page_type.toLowerCase();
                               res.pageData = res_data;
                               callback(null,res);
                           }
                      });
                  }else{
                      callback(null,res);
                  }

              }else{
                  callback(null,res);
              }
          }
}
exports.sData = serviceDataSemi;


