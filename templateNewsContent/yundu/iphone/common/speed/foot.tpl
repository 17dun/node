<script type="text/javascript" id="dpFooterScript">
(function(){
if(!(window.PDC && PDC.mark))return;
var wt = parseInt('{[%$bdstamp%]}',10);;
var ht = parseInt(PDC._render_start.toString().substr(-7),10);
var rt = ht-wt;
var isorder = wt && (rt<4000);
if(isorder){
   PDC.mark("wt",rt);
}
var productID = 24;
var pdc_init = {
    is_login: 0,
    sample:0.01,
    product_id:24,
    page_id:8
};
pdc_init.special_pages = [];
if(isorder){
    pdc_init.special_pages.push({
        id:9,
        sample:1
    });
}
{[%if $isSearchResult || $sample=='search'%]}
    pdc_init.special_pages.push({
        id:12,
        sample:0.01
    });
{[%/if%]}
{[%if $silk_log.hit_pagedb==="1"%]}
    pdc_init.special_pages.push({
        id:6,
        sample:0.01
    });
    {[%if $statics && $statics.css_head%]}
        pdc_init.special_pages.push({
            id:16,
            sample:0.01
        });
    {[%else%]}
        pdc_init.special_pages.push({
            id:17,
            sample:0.01
        });
    {[%/if%]}

    if(isorder){
        pdc_init.special_pages.push({
            id:10,
            sample:1
        });
    }
{[%else%]}
    pdc_init.special_pages.push({
        id:3,
        sample:0.01
    });
    if(isorder){
        pdc_init.special_pages.push({
            id:11,
            sample:1
        });
    }
 {[%/if%]}

    if(Du&&Du.front){
        var pageType = Du.front.pageType;
        var dict = Du.front.dict;
        var id = 0;
        switch(pageType){
            case "PAGE_TYPE_NEWS_CONTENT":
                id = 20;
                break;
            case "PAGE_TYPE_HOMEPAGE":
                 id = 21;
                break;
            case "PAGE_TYPE_NORMAL":
                id = 22;
                break;
            case "PAGE_TYPE_LIST":
                id = 23;
                break;
            case "PAGE_TYPE_KV":
                id = 24;
                break;
            case "PAGE_TYPE_INDEX":
                id = 25;
                break;
            case "PAGE_TYPE_RESOURCE":
                id = 26;
                break;
            case "PAGE_TYPE_BBS_CONTENT":
                id = 27;
                break;
            default:
                break;
        }
        if(id){
            pdc_init.special_pages.push({
                id:productID+'_'+id,
                sample:{[%if $sample == "tj"%]}1{[%else%]}0.01{[%/if%]}
            });
        }
        if(dict == 72 || dict == 64){
            pdc_init.special_pages.push({
                id:productID+'_'+28,
                sample:0.01
            });
        }
    }

PDC.init(pdc_init);
{[%if $silk_time%]}
var silk_time = parseInt('{[%$silk_time%]}');
PDC.mark('p_skt',silk_time);
{[%/if%]}
{[%if $silk_log.hit_pagedb==="0"%]}
var crawl = parseInt('{[%$silk_log.streamcrawler%]}'.split(",")[0]);
PDC.mark('p_crawlt',crawl);
var layout = parseInt('{[%$silk_log.smartlayout%]}'.split(",")[0]);
PDC.mark('p_layout',layout);
{[%else%]}
var rdb = parseInt('{[%$silk_log.readpagedb%]}'.split(",")[0]);
PDC.mark('p_rdbt',rdb);
{[%/if%]}
{[%if $time_record%]}
    PDC.mark('p_advt', '{[%$time_record.adv_info.last%]}');
    PDC.mark('p_sitenamet', '{[%$time_record.site_name.last%]}');
{[%/if%]}
})();
</script>
<script type="text/javascript">(function(){PDC.extend({_navTiming:window.performance&&performance.timing,ready:function(callback){if(document.readyState=="complete"||document.readyState=="loaded"){callback()}document.addEventListener("DOMContentLoaded",callback,false)},Cookie:{set:function(name,value,max_age){max_age=max_age||10;var exp=new Date();exp.setTime(new Date().getTime()+max_age*1000);document.cookie=name+"="+escape(value)+";path=/;expires="+exp.toGMTString()},get:function(name){var arr=document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));if(arr!=null){return unescape(arr[2])}return null},remove:function(name){this.set(name,"",-1)}},_is_sample:function(ratio){if(!PDC._random){PDC._random=Math.random()}return PDC._random<=ratio},_load_analyzer:function(){var special_pages=this._opt.special_pages||[];var radios=[this._opt.sample];for(var i=0;i<special_pages.length;i++){radios.push(special_pages[i]["sample"])}var radio=Math.max.apply(null,radios);if(PDC._is_sample(radio)==false){return}PDC._analyzer.loaded=true;PDC._load_js(PDC._analyzer.url,function(){var callbacks=PDC._analyzer.callbacks;for(var i=0,l=callbacks.length;i<l;i++){callbacks[i]()}})},_load_js:function(url,callback){var script=document.createElement("script");script.setAttribute("type","text/javascript");script.setAttribute("src",url);script.onload=script.onreadystatechange=function(){if(!this.readyState||this.readyState=="loaded"||this.readyState=="complete"){script.onload=script.onreadystatechange=null;if(typeof callback==="function"){callback(url,true)}}};script.onerror=function(e){if(typeof callback==="function"){callback(url,false)}};document.getElementsByTagName("head")[0].appendChild(script)},send:function(){if(PDC._analyzer.loaded==true){WPO_PDA.send()}else{PDC._load_analyzer();PDC._analyzer.callbacks.push(function(){WPO_PDA.send()})}}},PDC);!function(){var Cookie=PDC.Cookie,jt=Cookie.get("PMS_JT"),isset=false;if(jt){Cookie.remove("PMS_JT");jt=eval(jt);if(!jt.r||document.referrer.replace(/#.*/,"")==jt.r){(PDC._render_start-jt.s)>100&&PDC.mark("wt",(PDC._render_start-jt.s))}}function findParent(tagname,el){var flag=0;if((el.nodeName||el.tagName).toLowerCase()===tagname.toLowerCase()){return el}while(el=el.parentNode){flag++;if((el.nodeName||el.tagName).toLowerCase()===tagname.toLowerCase()){return el}if(flag>=4){return null}}return null}function clickHandle(e){var e=e||window.event;var target=e.target||e.srcElement;var from=findParent("a",target);if(from){var url=from.getAttribute("href");if(!/^#|javascript:/.test(url)){Cookie.set("PMS_JT",'({"s":'+(+new Date)+',"r":"'+document.URL.replace(/#.*/,"")+'"})');isset=true}}}document.addEventListener("click",clickHandle,false)}();PDC.ready(function(){PDC.mark("drt")});window.addEventListener("load",function(){PDC.mark("let");PDC._setFS&&PDC._setFS();PDC._opt.ready!==false&&PDC._load_analyzer()})})();</script>
