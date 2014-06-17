<!DOCTYPE html>
<html>
<!--STATUS OK-->
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>{[%$redirect.title|escape%]}</title>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <style type="text/css">
        *{margin:0;padding:0;}
        .top{position:absolute;height:44px;line-height:44px;width:100%;border-top:1px solid #453C3C;border-bottom:1px solid #000;background-color:rgba(48,48,48,0.8);z-index:10;}
        .top .left{position:absolute;overflow:hidden;text-indent:-10em;width:40px;height:44px;background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAmCAYAAAAvDACoAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAPlJREFUeNq0l00KgzAQRtV1biAIgtBr9NYewDMUXJRCwdJeoqSTkrRBEjN/Gfg2GXgvTKuMrbW2qVWdEmeErJAZYn6n7ubCjJDN/muBmO9ElMGhZtfvhKNYIH2iN0jGkruxq7vvN9XAHDgaTIWTwBQ4GYyFs8AYOBtcgovAR3AxOAdXAafgauA9XBUcw9XBMXzVBmNeuW8fXnnLCfLM3P4GGSRjqSLYH6gKUodqglyjJOgl8CDYJIKSXSTAzI4twP7yLAHlf0sWUJ86koDzQpqwAu46hxJINtwjwUW65V4hZ8gj0XtpLf9TreU/Fqx+6TfhvK35wfURYACvOniVBLpIaQAAAABJRU5ErkJggg==) no-repeat 10px 10px;background-size:11px 19px;-webkit-background-size:11px 19px;}
        .content{position:absolute;width:100%;min-height:100%;background-color:#000;display:box;display:-webkit-box;box-align:center;-webkit-box-align:center;z-index:1;}
        .top h3{text-align:center;color:#fff;width: 12em;margin: 0 auto;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;}
        .content .imgwrap{box-flex:1;-webkit-box-flex:1;text-align:center;background: url('http://wap.baidu.com/static/search/siteapp/image/loading.gif') no-repeat 50% 50%;background-size:10px 10px;}
        .content img{max-width:100%;}
        .page{position:absolute;bottom:30px;left:50%;margin:0 auto;width:140px;height:38px;z-index:10;border-radius:2px;}
        .page div{position:absolute;top:0;height:38px;width:70px;background-color: rgba(48,48,48,0.8);box-sizing:border-box;-webkit-box-sizing:border-box;left:0;line-height:38px;font-size:14px;text-align:center;color:#fff;border:1px solid rgba(0,0,0,0.8);}
        .page .prev{left:-70px;}
        .page .next{border-left:1px solid #383838;right:0;}
        .page .gray{color:#444}
    </style>
</head>
<body>
    <div class="wrap">
        <div class="top">
            <div class="left" id="back">返回</div>
            <h3 class="title">{[%$redirect.title|escape:"html"%]}</h3>
        </div>
        <div class="content">
            <div class="imgwrap">
                <img/>
            </div>
        </div>
        <div class="page" id="page">
            <div class="prev" id="prev">上一页</div>
            <div class="next" id="next">下一页</div>
        </div>
    </div>
    <script type="text/javascript">
        document.getElementById("back").addEventListener("click",function(){
            history.back();
        });
        (function(){
            var cur_refer= "{[%$redirect.img|escape%]}";
            var prev=document.getElementById("prev"),next= document.getElementById("next"),page=document.getElementById("page");
            if(!chkSessionStorage()|| document.referrer!=cur_refer|| !sessionStorage.getItem("siteapp_see_arrimg")){
                location.href=cur_refer;
            }else{
                document.querySelector(".imgwrap img").src=sessionStorage.getItem("siteapp_see_arrimg_current");
            }
            var cur_img_src=sessionStorage.getItem("siteapp_see_arrimg_current");
            var cur_arr_img=JSON.parse(sessionStorage.getItem("siteapp_see_arrimg"));
            var cur_index=chekIndex(cur_img_src,cur_arr_img);
            checkBtn();
            if(cur_arr_img&&cur_arr_img.length<=1){
                page.parentNode.removeChild(page);
            }
            if(cur_index==-1){
                location.href=cur_refer;
            }
            prev.addEventListener("click",function(){
                cur_index--;
                changeImg();
            },false);
            next.addEventListener("click",function(){
                cur_index++;
                changeImg();
            },false);
            function changeImg(){
                if(cur_index<0) cur_index=0;
                if(cur_index>cur_arr_img.length-1) cur_index=cur_arr_img.length-1;
                var cur_dom= document.querySelector(".imgwrap img");
                var wrap= document.querySelector(".imgwrap");
                wrap.removeChild(cur_dom);
                var add_img=document.createElement("img");
                add_img.src=cur_arr_img[cur_index];
                wrap.appendChild(add_img);
                checkBtn();
            }
            function checkBtn(){
                prev.classList.remove("gray");
                next.classList.remove("gray");
                if(cur_index==0){
                    prev.classList.add("gray");
                }
                if(cur_index==cur_arr_img.length-1){
                    next.classList.add("gray");
                }
            }
            function chekIndex(str,arr){
                var cur_index=-1;
                for(var i=0;i<arr.length;i++){
                    if(str==arr[i]){
                        cur_index=i;
                        break;
                    }
                }
                return cur_index;
            }
            function chkSessionStorage() {
                try {
                    sessionStorage && sessionStorage.setItem("siteapplocaltest", "hello word");
                    if (sessionStorage && sessionStorage.getItem("siteapplocaltest") == "hello word") {
                        return 1;
                    } else {
                        return 0;
                    }
                } catch (e) {
                    return 0;
                }
            }
        })();
    </script>
	{[%include file="./baidutongji.tpl"%]}
</body>
</html>