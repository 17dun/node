{[%if $globalNav==""%]}
{[%assign var=globalNav value=$res.data.nav.navList %]}
{[%assign var=globalNavSed value=$res.data.nav.navListSed %]}
{[%/if%]}
{[%assign var="sub_data" value="" %]}
{[%assign var="sub_data.link" value=$res.data.site_domain|urlencode %]}
{[%assign var="sub_data.title" value=$res.data.site_name%]}
<header class="ssPageHeader">
<nav class="pageNav">

{[%if $res.data.site_url || ($res.data.url|regex_replace:"/\/$|^http:\/\/\www\.|^http:\/\//g":"" != $res.data.site_url|regex_replace:"/\/$|^http:\/\/\www\.|^http:\/\//g":"")%]}
{[%if !empty($res.data.siteIconURL)%]}
<a class="icon bSiteIcon" {[%if !empty($res.data.siteIconURL)%]}data-src="{[%$res.data.siteIconURL|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}"{[%/if%]} data-action="down"
{[%if $res.data.site_url%]}href="?{[%$querySrc|cat:"&ua=1&"%]}src={[%$res.data.site_url|urlencode%]}"{[%/if%]}>
</a>
{[%/if%]}
{[%/if%]}

<span class="slogan">
        {[%if $res.data.site_name%]}
            {[%$res.data.site_name%]}
        {[%elseif $siteInfo.site_title%]}
            {[%$siteInfo.site_title%]}
        {[%elseif $res.data.page_title%]}
            {[%$res.data.page_title|escape:html%]}
        {[%elseif $res.data.pageData.pageTitle%]}
            {[%$res.data.pageData.pageTitle|escape:html%]}
        {[%/if%]}
</span>
{[%strip%]}

<i class="icon search tap"  data-showEl="#searchFormBox" data-tj="searchFormBox" data-action="saNavTabSelector"></i>

{[%if $res.data.nav.navList|count > 0 || $res.data.nav.navListSed|count > 0 ||$res.data.nav.mainNavList|count > 0%]}
  <a class="tap h-nav-more icon"  data-showEl="#navMenuList" data-tj="navMenuList" data-action="saNavTabSelector"></a>
{[%/if%]}
{[%/strip%]}
</nav>
    {[%if $res.data.nav.navList|count > 0 || $res.data.nav.navListSed|count > 0 ||$res.data.nav.mainNavList|count > 0%]}
        <div id="navMenuList" class="navCard noDis">
            {[%*include file="./dev/navList.tpl" sub_data = $res.data.nav *%]}
            {[%*include file="tpl/nav/navList.soy" sub_data = $res.data.nav *%]}
            <div data-tpl-name="tpl/nav/navList" data-tpl-data-name="sub_data">
                <!--{[%$res.data.nav|json_encode%]} -->
            </div>
        </div>
    {[%/if%]}
<div id="searchFormBox" class="navCard  noDis">
	{[%if !empty($res.data.top_search) && $res.data.top_search.data_type eq "STRUCT"  %]}
	    {[%*include file="tpl/navSearch.soy" item= $res.data.top_search|topSearchParse*%]}
        <div data-tpl-name="tpl/navSearch" data-tpl-data-name="item">
            <!--{[%$res.data.top_search|topSearchParse|json_encode%]} -->
        </div>
	{[%else%]}
		<div class="hCard saNavSearchBox">
			{[%include file="./dev/search.tpl"%]}
		</div>
	{[%/if%]}	
</div>
{[%include file="./shownav.tpl"%]}
</header>
