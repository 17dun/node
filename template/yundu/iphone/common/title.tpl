{[%strip%]}
<div class="yi-header ellipsis">
    {[%if $res.data.site_domain|| $pcHost%]}
    <a class="yi-header-home" href="{[%if $res.data.site_domain%]}?{[%$querySrc|cat:"&ua=1&"%]}src={[%$res.data.site_domain|urlencode%]}{[%else%]}?host={[%$pcHost|escape:url%]}{[%/if%]}">
		<span></span>
    </a>
    {[%/if%]}
	{[%if $res.data.nav.navList|count !==0 || $res.data.nav.navListSed|count !==0 || $globalNav%]}
	<a class="yi-header-nav tap" data-js="showMore('#navMenuList');">
		<span></span>
	</a>
	{[%/if%]}
	<div class="yi-header-sitename">
    {[%if $res.data.site_url%]}
	<a class="ellipsis yi-header-site" href="?{[%$querySrc|cat:"&ua=1&"%]}src={[%$res.data.site_url|urlencode%]}">
    {[%/if%]}
	{[%if $res.data.site_name%]}
	   {[%$res.data.site_name%]}
	{[%elseif $siteInfo.site_title%]}
       {[%$siteInfo.site_title%]}
    {[%elseif $res.data.page_title%]}
        {[%$res.data.page_title|escape:html%]}
    {[%elseif $res.data.pageData.pageTitle%]}
        {[%$res.data.pageData.pageTitle|escape:html%]}
	{[%/if%]}
    {[%if $res.data.site_url%]}
	</a>
    {[%/if%]}
	</div>
</div>
<div id="navMenuList" class="noDis">
{[%include file="./dev/navList.tpl" sub_data = $res.data.nav.navList %]}
</div>
{[%if $ad && $ad.type == 'union'%]}
<script type="text/javascript">
/*移动网页，创建于2013-7-30*/
var cpro_id = "u1333874";
(window["cproStyleApi"] = window["cproStyleApi"] || {})[cpro_id]={
    at:"image",
    skin:"mobile_skin_white_black",
	pl : "5",
	originUrl:"{[%$res.data.url|escape:javascript%]}"
};
</script>
<script src="http://cpro.baidustatic.com/cpro/ui/cm.js" type="text/javascript"></script>
{[%/if%]}

{[%if $ad && $ad.type == 'qs'%]}
<div id="yi-ad-top" class="yi-ad"></div>
{[%/if%]}

{[%/strip%]}
