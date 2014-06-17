/**
处理页面递归
记录数据的xdebugPath
**/

/**
@param data 页面数据
**/
var headTpl = "yundu/iphone/head.tpl";
var checkOutDataTpl = "yundu/iphone/top1.tpl";
var checkOutDataFootTpl = "yundu/iphone/footer1.tpl";
//var blocksTpl = "yundu/iphone/blocks.tpl";
blocksTpl = "yundu/iphone/page/widepage/widget/wide_process.tpl";
//var libxmljs = require("libxmljs-master");
var bdlog = require('comlib').bdlog;
var predata = require('predata')
,cpredata = require('cpredata');

var xPath = require("xPath");

var tcwiseConf = require("../conf/tcwiseConf.js");


var htmlparser = require("htmlparser2");


function getElHTML(el){

  var rsStr = "<"+el.tagName;
  for(var i in el.attributes){
      rsStr += " "+i+"=\""+el.attributes[i]+"\" ";
  }
  rsStr+=">";
  return rsStr;
}


function preData(block,res,options,index){
      var type =  block.type.toLowerCase().replace(/_/g,'');
      var func_name = "prepro_" + type;

      // bdlog.debug('logid:' + options.logid + ' func_name: cpredata[prepro_nav]' + typeof(cpredata.prepro_nav));
      //bdlog.debug('logid:' + ' func_name:' + func_name);
      // bdlog.debug('logid:' + options.logid + ' predata func_name:' + predata[func_name] + ' cpredata func_name:' + cpredata[func_name] );

      var func = typeof(predata[func_name]) == "function" ?  predata[func_name] : (typeof(cpredata[func_name]) == "function" ? cpredata[func_name] : undefined );
      if(func){
          func(block, res, null, options, function(err, block){
              if(block){
                    res.blocks[index] = block;
              }
          });
      }
}

function initPlugin(tplMaster){
    /*tplMaster.use("__exportGlobalData",function(d){
        if(d.type=="IMAGE_LIST" && d.signtype=="FOCUSPIC"){
            if(data[d.signtype] == null){
                //preData(d,data.res.data,options);
                //return false;
                //本次暂时不处理该数据
                return true;
            }
        }
        return true;
    });*/

    tplMaster.use("isInTab",function(){
        bdlog.debug(tcwiseConf.xdebug.isInTab);
        return tcwiseConf.xdebug.isInTab;
    });
    tplMaster.use("isInHide",function(){
        return tcwiseConf.xdebug._ssHidden>0?true:false;
    });
    tplMaster.use("inHide",function(obj){
        tcwiseConf.xdebug._ssHidden++;
        if(typeof obj == "object"){
            obj.isInHide = true;
        }
        bdlog.debug("inHide",tcwiseConf.xdebug._ssHidden);
        return "";
    });
    tplMaster.use("outHide",function(obj){
        tcwiseConf.xdebug._ssHidden--;
        if(typeof obj == "object"){
            obj.isInHide = false;
        }
        bdlog.debug("outHide",tcwiseConf.xdebug._ssHidden);
        return "";
    });

}

function pageRender(data,tplMaster,options,callBackFn,res){
     //首先渲染headTpl
     var headHTML = tplMaster.render(headTpl, data);
     //渲染blocks Tpl
     var length = data.res.data.blocks.length;
     var blocksHTML = new Array(length);
     var bkHTML = "";
    //return false 模板不处理该数据


    if(tcwiseConf.xdebug.pvCount == null || tcwiseConf.xdebug.pvCount > 1000*10000){
        tcwiseConf.xdebug.pvCount = 0;
    }
    tcwiseConf.xdebug.pvCount++;
     if(data&&data.res&&data.res.data){
         data.res.data.pvCount = tcwiseConf.xdebug.pvCount;
     }
     tcwiseConf.xdebug.totalJSDOMTime = 0;
     //标记处理组件是否在tab 嵌套
     tcwiseConf.xdebug.isInTab = 0;
     tcwiseConf.xdebug.isInHidden = 0;
     tcwiseConf.xdebug._ssHidden = 0;
     tcwiseConf.xdebug.totalJSDOMStringAddTime = 0;
     tcwiseConf.xdebug.totalJSDOMNewObjectTime = 0;
     tcwiseConf.xdebug.totalJSDOMTokenTime = 0;
     tcwiseConf.xdebug.totalPreDataTime = 0;

     if(data.struct_page_type == 1){
        data.res.data.blocks.forEach(function(item,index,items){
                       //item['xdebugPath'] = blockXdebugPath+"["+index+"]";
                       //var startTime3 = new Date().getTime();
                       //由于video 的异步处理策略，所以暂时先不在这里处理音频
                       //preData(item,data.res.data,options,index);
                       //item = data.res.data.blocks[index];
                      //var endTime3 = new Date().getTime();
                      //tcwiseConf.xdebug.totalPreDataTime += (endTime3 - startTime3);
                      data.item = item;
                      if(item&&item.type=="TAB"){
                          tcwiseConf.xdebug.isInTab++;
                          if(item && item.data_value){
                              item.data_value.isInTab = tcwiseConf.xdebug.isInTab;
                          }
                      }
                      if(tcwiseConf.xdebug.showTPLTime){
                          var startRenderTime = new Date().getTime();
                          blocksHTML[index] = tplMaster.render(blocksTpl, data);
                          var endRenderTime = new Date().getTime();
                          if(data&&data.type&&endRenderTime-startRenderTime>0){
                              bdlog.debug("renderTplCostTime",data.type,endRenderTime-startRenderTime);
                          }
                      }else{
                          blocksHTML[index] = tplMaster.render(blocksTpl, data);
                      }

                      if(item&&item.type=="TAB"){
                        tcwiseConf.xdebug.isInTab--;
                      }
                      delete data.item;
                      //var startTime = new Date().getTime();
                       if(item != null && item.type != null && (item.bottom_margin != null || item.padding_top != null || item.padding_bottom != null || item.is_main != null || tcwiseConf.xdebug.showXdebugPATH == true)){
                         var rootEle = {
                             tagName:null,
                             attributes:null,
                             endIndex:0
                         };
                         //var startTime2 = new Date().getTime();
                         var parser2 = new htmlparser.Parser({
                             onopentag: function(name, attribs){
                                //console.log(name,attribs.class,parser2.endIndex);
                                rootEle.tagName = name;
                                rootEle.attributes = attribs;
                                rootEle.endIndex = parser2.endIndex;
                                parser2.reset();
                                parser2.end();
                             }
                         });
                         //var endTime2 = new Date().getTime();
                         //tcwiseConf.xdebug.totalJSDOMNewObjectTime += (endTime2 - startTime2);
                          var html = blocksHTML[index];
                          //var startTime3 = new Date().getTime();
                          parser2.write(html.substring(0,300));
                          //var endTime3 = new Date().getTime();
                          //tcwiseConf.xdebug.totalJSDOMTokenTime += (endTime3 - startTime3);
                          if(rootEle.tagName != null){
                                if(item.bottom_margin != null ||item.padding_top != null || item.padding_bottom != null){
                                    if(rootEle.attributes.style == null){
                                        rootEle.attributes.style = "";
                                    }else{
                                        rootEle.attributes.style += ";";
                                    }
                                    if(item.bottom_margin != null){
                                       rootEle.attributes.style += "margin-bottom:"+item.bottom_margin+"px!important;";
                                       if(!rootEle.attributes.class){
                                           rootEle.attributes.class = "";
                                       }
                                       if(rootEle.attributes.class.search("ssSetMarginBottomBlock") == -1){
                                           rootEle.attributes.class += " ssSetMarginBottomBlock";
                                       }
                                    }

                                    if(item.padding_top != null){
                                       rootEle.attributes.style += "padding-top:"+item.padding_top+"px!important;";
                                    }

                                    if(item.padding_bottom != null){
                                        rootEle.attributes.style += "padding-bottom:"+item.padding_bottom+"px!important;";
                                    }
                                }
                                if(typeof(item.block_area_control) != "undefined"){
                                    rootEle.attributes["ssBlockAreaControl"] =item.block_area_control;
                                }

                                if(item.is_main != null){
                                  rootEle.attributes["ssWeight"] = item.is_main;
                                }else{
                                    rootEle.attributes["ssWeight"] = 1;
                                }

                                if(tcwiseConf.xdebug.showXdebugPATH == true){
                                    rootEle.attributes["ssType"] = item.type;
                                    //item.xDebugPath = tcwiseConf.xdebug.__id++;
                                    item.xDebugPath = xPath.getXPathKey(data.type,data.xpath?data.xpath:[]);
                                    //child.setAttribute("xDebugPath",item.xDebugPath);
                                    rootEle.attributes["xDebugPath"] =item.xDebugPath;
                                }

                                //console.log(document.body.children[0].outerHTML);
                                //var startTime1 = new Date().getTime();
                                var rootHTML = getElHTML(rootEle);

                                blocksHTML[index] = rootHTML+html.substring(rootEle.endIndex+1);
                                //var endTime1 = new Date().getTime();
                                //tcwiseConf.xdebug.totalJSDOMStringAddTime += (endTime1-startTime1);
                          }else{
                              //console.log(document.body.outerHTML,item);
                          }

                       }
                       //var endTime = new Date().getTime();
                       //var jsDOMUseTime = (endTime - startTime);
                       //console.log(item.type,"jsDom 使用时间",jsDOMUseTime);
                       //tcwiseConf.xdebug.totalJSDOMTime += jsDOMUseTime;
             });
        //var startTime = new Date().getTime();
        bkHTML =  blocksHTML.join("");
        //var endTime = new Date().getTime();
        //console.log("Array Join Time",(endTime - startTime));
     }else{
        bkHTML =  tplMaster.render("yundu/iphone/blocks.tpl", data);
     }

     var top1HTML = tplMaster.render(checkOutDataTpl, data);
     var footer1HTML = tplMaster.render(checkOutDataFootTpl, data);
     data.res.data.page_ad += "</div>";
     bdlog.debug("blocks End",tcwiseConf.xdebug.isInTab);
     res.locals['req_info']['page_info'] = {
        pageType: data.res.data.page_type,
        url: data.res.data.url,
        order: options.req.query.order,
        ref: options.req.query.ref,
        dict: options.req.query.dict,
	pattern: data.res.data.pattern,
        host: data.res.data.host
     };
     //console.log("jsDom 一共使用时间",tcwiseConf.xdebug.totalJSDOMTime);
     //console.log("jsDom 字符串相加 一共使用时间",tcwiseConf.xdebug.totalJSDOMStringAddTime);

     //console.log("jsDom 新建对象 一共使用时间",tcwiseConf.xdebug.totalJSDOMNewObjectTime);

     //console.log("jsDom Token 一共使用时间",tcwiseConf.xdebug.totalJSDOMTokenTime);

     //console.log("jsDom 预处理 一共使用时间",tcwiseConf.xdebug.totalPreDataTime);
     /*res.locals['req_info']['pageRenderTime'] = {
            totalJSDOMTime:tcwiseConf.xdebug.totalJSDOMTime,
            totalJSDOMStringAddTime:tcwiseConf.xdebug.totalJSDOMStringAddTime,
            totalJSDOMNewObjectTime:tcwiseConf.xdebug.totalJSDOMNewObjectTime,
            totalJSDOMTokenTime:tcwiseConf.xdebug.totalJSDOMTokenTime,
            totalPreDataTime:tcwiseConf.xdebug.totalPreDataTime
     };*/
     //.replace(/\s{1,}/gi,' ') 数据里面空格删除，容易引起很多的高度不计算，带来bug
     //callBackFn((headHTML+top1HTML+bkHTML+footer1HTML).replace(/\s{1,}/g," ").replace(/\s*(\r|\n|\r\n|\t)\s*/gi,"").replace(/>\s*</gi,"><"),data);
     callBackFn((headHTML+top1HTML+bkHTML+footer1HTML).replace(/\s*(\r|\n|\r\n|\t)\s*/gi,""),data);
    //var bodyHTML = tplMaster.render(blocksTpl, data);
     //console.log(data.res.data.blocks.length);
     //拿到数据之后，重新布局 特殊提取数据的模板
     //callBackFn(headHTML+top1HTML+bodyHTML+footer1HTML);
}

module.exports.render = pageRender;
module.exports.preData =  preData;
module.exports.initPlugin = initPlugin;
