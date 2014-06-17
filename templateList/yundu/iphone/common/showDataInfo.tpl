<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <title>{[%$redirect.title|escape%]}</title>
    <meta name="viewport" content="minimum-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    {[%include file="../css.tpl"%]}
    {[%include file="sitetheme-common/headscript.tpl"%]}
</head>
<body style="overflow:auto;">
    <div class="noDis" id="bodyContent">
        由于某些原因，不能查看 {[%$redirect.title|escape%]} 的详细内容，已联系相关工程师修复。
        <p>如果和上个网页使用的不是同一个浏览器，请使用同一浏览器查看</p>
        <p>
            <noscript>请在设置中打开脚本运行选项</noscript>
        </p>
    </div>
<script type="text/javascript">
    var showEl = document.getElementById("bodyContent");
    /***从session store 里面 获取数据*****/
   var dataInfo = sessionStorage.getItem("ssShowDataInfo");
   if(dataInfo == null){
        /**显示提示文案**/
        showEl.className = "";
   }else{
       var dataHTML = dataInfo;
       showEl.innerHTML = dataHTML;
       showEl.className = "";
       sessionStorage.removeItem("ssShowDataInfo");
   }
</script>

{[%include file="../script.tpl"%]}

</body>
</html>