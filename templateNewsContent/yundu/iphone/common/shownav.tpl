{[%assign var="navData" value=$res.data.nav %]}
{[%if $navData.showNavList&&$navData.showNavList.data_list%]}
    {[%*不管有没有二级导航，都当有二级导航显示，目前把下面的代码先屏蔽*%]}
        <div class="show-nav tab-show-nav">
            <div class="nav-list-wrap">
                <div class="nav-list">
                    <ul>
                        {[%foreach from=$navData.showNavList.data_list item=navItem%]}
                            {[%if $navData.showNavList.navListHasSub==1%]}
                                {[%if $navItem.text%]}
                                    <li><span class="text">{[%$navItem.text%]}</span></li>
                                {[%else%]}
                                    <li style="width:4em;" data-src="{[%$navItem.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}"><span class="text"></span></li>
                                {[%/if%]}
                            {[%else%]}
                                {[%if $navItem.text%]}
                                    <li class="noarrow"><a href="{[%$navItem.href%]}" class="text">{[%$navItem.text%]}</a></li>
                                {[%else%]}
                                    <li class="noarrow" style="width:4em;" data-src="{[%$navItem.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}"><a href="{[%$navItem.href%]}" class="text"></a></li>
                                {[%/if%]}
                            {[%/if%]}
                        {[%/foreach%]}
                    </ul>
                </div>
                <div class="prev" data-action="down"></div>
                <div class="next" data-action="down"></div>
            </div>
        {[%if $navData.showNavList.navListHasSub==1%]}
            <div class="show-nav-con">
                {[%*data-url图片，放模板中，避免增加静态文件体积*%]}
                <style type="text/css">
                    .nav-list-wrap .nav-list li.selected:after{content:"";position: absolute;height:7px;width:9px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAOCAYAAAAi2ky3AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAMJJREFUeNpi3LNnDwMlwNnZGUwzEaE2ForxAhYC8lpAPA3KPgvE13ApxOciTiBeraCgwAPCIDZUjGSDpklKSmqJi4szgDCIjeQ6og2KFRERSZCTk4MLgNggMVzhxYQrXECuQAdQsZlQNXgNgocLEGAYBBIDynFiCy8mXOGCC+AKLyZ84YILYAsvJkLhgs9loPDau3evFswgvOGCCyCHF9AwThYmJqZvsLRCKgDp+fnzp9bLly+/MX7+/Pk/AxUAQIABAD4uLQCYynypAAAAAElFTkSuQmCC) no-repeat; -webkit-background-size: 9px 7px;top:39px;left:50%;margin-left:-4px;}
                    .show-nav .pa-link .close{height:32px;width:32px;float: left;margin-left: 7px;margin-top: 2px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAMAAAANmfvwAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAZQTFRFTlhmAAAAhhv+BgAAAAJ0Uk5T/wDltzBKAAAAg0lEQVR42pSUAQ6AIAwDr///tFFEAbsUSQihO9iADRQbZ6e00hComGbhGj1zWzpCRdAdGeaRUcG8IvLMICHLjAJyzDTFitMCt3Dd0hxyCewb4jd0eUYekSVmRI74jWRHOdx86Hx1+QHyM+ZkyCmVEzOndy6SjVLbKNiNst/5PFI7BBgA/gADAcHYyyAAAAAASUVORK5CYII=) no-repeat center center;-webkit-background-size: 17px 17px;}
                    .show-nav .pa-link .close.down{background-color: #FF5053; background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAYAAAA6RwvCAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAANxJREFUeNrM11EPgyAMBOD1sv//l7uXvQgO2uPOzMQENZTPilQjM1//sGE4zu/u3qZxMFy8azsQUxuLgdOMuJwD0VGJmB5NmDGrGDFmxIXZIu4ejRpTQvyaIypMGbGarKeYFmL31rCYZGLuXt9g1gQi1hbSwdCIKqSCOUJ0IOWAbB+4AnfhMN1lO3sM5JEPo+MqypYDGBAUBq7A3T4QBAxFoYQAISmUECGOMVBXURYDMYLGwICgMDAh2hgYES0MzIgy5uRTUVq1Qa4JSszyT8+BWI7zfiALpcx8BBgAJ4Q7QX6/j58AAAAASUVORK5CYII=)}
                    .show-nav .pa-link .link,.show-nav .pa-link .close,.nav-list-wrap .prev, .nav-list-wrap .next{-webkit-tap-highlight-color:rgba(0,0,0,0);}
                    .show-nav .pa-link .link:after{content: "";position: absolute;width: 7px;height: 11px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAWCAMAAAAo0TYrAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAZQTFRFqqqqAAAABaH1EQAAAAJ0Uk5T/wDltzBKAAAATElEQVR42nSQAQoAIAgD1/8/HWrmNkoI9RKdYqkhHiQHCNT/gAwIlB/QrsGtO2AaFaBJCVhKgH9u9dbP5pke02v72L6Pe+j92LYAAwCwFgD/uQegKAAAAABJRU5ErkJggg==) no-repeat;-webkit-background-size:7px 11px;top:10px;right:8px;}
                    .show-nav .pa-link .link.down:after{ background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAWCAYAAAAfD8YZAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAHRJREFUeNqklFEKwDAIQ2vY/a+c/exjDI3RCYVWeDGtxSB5toHPmc8awyz2FhyJi5HtkQCSnC2AIm8JQLhqBdC8iRSA0ZFSAOZ/SAVwfoQLM3OCLejAVHfHFlRwC1awBVbDwALVMGhBNQzCaf41rfaOW4ABACF4Fyq+a1+5AAAAAElFTkSuQmCC);}
                    .show-nav .pa-link .link.down{background-color: #FF5053; color:#fff;}
                </style>
                {[%foreach from=$navData.showNavList.data_list item=navItem%]}
                    <div class="con-wrap">
                        {[%if !empty($navItem.data&&$navItem.data.type=="FAST_LINK")%]}
                            {[%include file="tpl/fastLink.soy" sub_data=$navItem.data.data_value%]}
                        {[%/if%]}
                        {[%if !empty($navItem.href)%]}
                            <div class="pa-link">
                                <div class="close" data-action="down"></div>
                                <a data-action="down" class="link" href="{[%$navItem.href%]}">进入{[%$navItem.text%]}</a>
                            </div>
                        {[%/if%]}
                    </div>
                {[%/foreach%]}
            </div>
        {[%/if%]}
        </div>
        <script type="text/javascript">
            (function(){
                var ready = function(callback){
                    if (document.readyState == 'complete' || document.readyState == 'loaded') callback();
                    document.addEventListener('DOMContentLoaded', callback, false);
                };
                ready(function(){
                  require(["$"],function($){
                    var wrap=$(".tab-show-nav"),nav=wrap.find(".nav-list ul"),cons=wrap.find(".show-nav-con .con-wrap");
                    if(cons.size()){
                        nav.find("li").bind("mousedown",function(){
                            var ind=$(this).removeClass("noarrow").index();
                            cons.removeClass("show");
                            var cur_con=$(cons.get(ind));
                            cur_con.addClass("show");
                            if(!cur_con.find(".saFastLink").size()){
                                $(this).addClass("noarrow");
                                wrap.find(".show-nav-con").css({"-webkit-transition":"height .2s linear","height":"0px","z-index":"11"});
                            }else{
                                var h = cur_con.height();
                                var sub_h = wrap.find(".show-nav-con").height();
                                wrap.find(".show-nav-con").css({"-webkit-transition":"height .2s linear","height":"0px","z-index":"11"});
                                if(sub_h > 0){
                                    setTimeout(function(){
                                        wrap.find(".show-nav-con").css({"-webkit-transition":"height .2s linear","height":h+"px","z-index":"10"});
                                    },250);
                                }else{
                                    wrap.find(".show-nav-con").css({"-webkit-transition":"height .2s linear","height":h+"px","z-index":"10"});
                                }
                            }
                            $(this).closest(".show-nav").find(".nav-list-wrap").addClass("show-con");
                        });
                        cons.find(".close,.link").bind("click",function(){
                            wrap.find(".show-nav-con").css({"-webkit-transition":"height .2s linear","height":"0px","z-index":"11"});
                            setTimeout(function(){
                                var ind=$(this).closest(".con-wrap").removeClass("show").index();
                                $(nav.find("li").removeClass("selected").get(ind)).addClass("noarrow");
                                $(this).closest(".show-nav").find(".nav-list-wrap").removeClass("show-con");
                            },200);
                        });
                        wrap.find(".prev,.next").bind("click",function(){
                            var cur_wrap=$(this).closest(".tab-show-nav");
                            hidesubnav(cur_wrap);
                        });
                        var startX;
                        nav.bind("touchstart",function(e){
                             startX=e.touches[0].clientX;
                        });
                        nav.bind("touchmove",function(e){
                            var endX=e.touches[0].clientX;
                            if(Math.abs(endX-startX)>10){
                                var cur_wrap=$(this).closest(".tab-show-nav");
                                hidesubnav(cur_wrap);
                            }
                        });
                        function hidesubnav(dom){
                            wrap.find(".show-nav-con").css({"-webkit-transition":"height .2s linear","height":"0px"});
                            setTimeout(function(){
                                dom.find(".con-wrap").removeClass("show");
                                dom.find(".nav-list li").removeClass("selected");
                            },200);
                        }
                    }
                    });
                });
            })();
        </script>
{[%/if%]}
