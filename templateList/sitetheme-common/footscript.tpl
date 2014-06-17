{[%strip%]}
{[%if $siteInfo.jscode.foot && $siteInfo.jscode.foot!="<"%]}
    {[%$siteInfo.jscode.foot%]}
{[%elseif $siteInfo.jscode && $siteInfo.jscode.head=="<"%]}
    {[%$siteInfo.jscode%]}
{[%/if%]}


{[%if $siteInfo.islxb%]}{[%*离线宝脚本*%]}
{[%include file="sitetheme-common/lixianbaoscript.tpl"%]}
{[%/if%]}

{[%if $uc_id%]}{[%*广告管家脚本*%]}
{[%include file="sitetheme-common/adv_manger.tpl"%]}
{[%/if%]}
{[%if $siteType==2 %]}{[%*ecom添加百度统计*%]}
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fef94502ccadba4f87620ebc11e98bfde' type='text/javascript'%3E%3C/script%3E"));
</script>
{[%/if%]}
{[%if $custom%]}
<script src="http://img.baidu.com/img/iknow/siteapp.js" type="text/javascript"></script>
{[%/if%]}
{[%if $preview == 1%]}
<script src="{[%#LINE_HOST#%]}/sign2.js" type="text/javascript"></script>
{[%/if%]}
{[%/strip%]}
