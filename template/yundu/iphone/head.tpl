{[%strip%]}
<!DOCTYPE html>
<html>
<!--STATUS OK-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
<meta name="baidu-tc" content="siteapp" />
<title>
{[%if $res.data.page_title%]}
    {[%$res.data.page_title|escape:html%]}
{[%else%]}
    {[%$res.data.pageData.pageTitle|escape:html%]}
{[%/if%]}
</title>
{[%include file="./css.tpl"%]}
{[%include file="./common/speed/top.tpl"%]}
<script type="text/javascript">
    var _hmt = _hmt || [];
</script>
{[%include file="sitetheme-common/headscript.tpl"%]}

{[%if $RunEnv == 0||$RunEnv == 2%]}
<script type="text/javascript" src="{[%$OfflinePath%]}/src/js/siteApp/xn.config.js"></script>
{[%else%]}

    {[%if $statics.js_top%]}
        <script type="text/javascript" id="js_top">
            {[%$statics.js_top%]}
        </script>
     {[%else%]}
        <script type="text/javascript">
                Store.evalJs("js_top","sapp_theme_2_",true);
         </script>
     {[%/if%]}

{[%/if%]}
{[%if $res.data.page_type == "PAGE_TYPE_NEWS_CONTENT"%]}
<style id="new-text" data-recom="no">
/*
*正文页理想态样式
*/
body>.siteInfo, .show-nav,
.ssBackToPC, #fixedTitleEl, 
.ssLoadAD {
    display: none;
}
body{background-color: #fafafa;}
body>.yi-normal-title, body>.ssAuthor, body>.yi-content-text, 
body>.yi-prenext, body>.yi-pageturn{
    background-color: #fafafa;
    padding: 6px!important;
}
body>.yi-pageturn{
    padding: 4px 6px 6px!important;
}
body>.yi-normal-title{
    color: #262626;
    font-size: 24px;
    line-height: 36px;
}
.yi-content-text>p, .yi-content-text>div{
    color: #262626;
    font-size: 18px;
    line-height: 27px;
}
div.yi-content-text a[href] {
    color: #0058d2;
    font-size: 18px;
}
body>.ssPageHeader{
    border-bottom: 1px solid #dadada;
    padding-left: 6px;
}
body>.ssAuthor{
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    color: #777;
    display: -webkit-box;
    font-size: 12px;
    overflow: hidden;
    text-overflow: ellipsis;
    padding: 0px 6px!important;
    margin-top: -5px!important;
    margin-bottom: 12px!important;
}
.yi-content-text img{
    border: 0px;
    margin: 5px auto;
    max-width:100%;
    word-break: break-all;
}
.yi-normal-title + .yi-content-text {
    margin-top: 4px!important;
}
.yi-content-text>p, .yi-content-text>div{
    text-align: justify;
    padding-top: 5px;
}
</style>
{[%/if%]}
{[%include file="./common/speed/white_screen.tpl"%]}
</head>
<body data-dict="{[%$dict%]}" data-srd=1 class="{[%$res.data.page_type|escape:none%]} {[%$res.data.struct_type|escape:none%]} Blocks_cont_{[%$res.data.blocks|@count|escape:none%]} Sitetype_{[%$siteType|escape:none%]} Struct_page_type_{[%$struct_page_type|escape:none%]}" data-page_type="{[%$res.data.page_type|escape:none%]}" {[%if $jzFlag%]}data-jzFlage="{[%$jzQuerysrc%]}"{[%/if%]}>
{[%/strip%]}
