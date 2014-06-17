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

{[%if $RunEnv == 0||$RunEnv == 2 %]}
<script type="text/javascript" src="{[%$OfflinePath%]}/src/js/siteApp/xn.config.js"></script>
{[%else%]}
	<script type="text/javascript" id="js_top">
			{[%include file="yundu/static/xn.config.js"%]}
     </script>

{[%/if%]}

{[%include file="./common/speed/white_screen.tpl"%]}
</head>
<body data-dict="{[%$dict%]}" data-srd=1 class="{[%$res.data.page_type|escape:none%]} {[%$res.data.struct_type|escape:none%]} Blocks_cont_{[%$res.data.blocks|@count|escape:none%]} Sitetype_{[%$siteType|escape:none%]} Struct_page_type_{[%$struct_page_type|escape:none%]}" data-page_type="{[%$res.data.page_type|escape:none%]}">
{[%/strip%]}
