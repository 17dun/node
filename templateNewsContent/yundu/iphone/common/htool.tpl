{[%if $siteTel||$siteInfo.site_shangwutong||$siteInfo.isShangQiao||$siteInfo.site_53kf%]}
<!--页头工具栏-->
<div class="yi-htool yi-bgcolor yi-www" data-bgOpacity="0.15">
    <div class="yi-htool-left">
        {[%if $siteTel%]}
        <a class="yi-tels" data-coord="head" data-ac='tel' href="tel:{[%$siteTel|escape:none%]}">
            <span class="yi-htool-lefticon yi-htool-telicon"></span>
            <span class="yi-htool-title">拨打咨询电话:</span>
            <strong class="yi-htool-num"><b></b>{[%$siteTel|escape:none%]}</strong>
        </a>
        {[%elseif $siteInfo.site_shangwutong%]}
        <a href="{[%$siteInfo.site_shangwutong|escape:none%]}" class="yi-tj" data-ac="st"
           data-coord="head">
            <span class="yi-htool-lefticon yi-htool-smsicon"></span>
            <span class="yi-htool-title">客服人员在线</span>
            <strong class="yi-htool-num yi-htool-zixun"><b></b>点击免费咨询</strong>
        </a>
        {[%elseif $siteInfo.isShangQiao%]}
        <a class="yi-tj" data-ac="sq" data-coord="head" href="http://qiao.baidu.com/?module=default&controller=gateway&action=index&type=s&ucid={[%$userId|escape:none%]}&ip={[%$guestIP|escape:none%]}">
            <span class="yi-htool-lefticon yi-htool-smsicon"></span>
            <span class="yi-htool-title">客服人员在线</span>
            <strong class="yi-htool-num yi-htool-zixun"><b></b>点击免费咨询</strong>
        </a>
        {[%elseif $siteInfo.site_53kf%]}
        <a class="yi-tj" data-ac="kf" data-coord="head" href="http://master.53kf.com/webCompany.php?arg={[%$siteInfo.site_53kf|escape:'html'%]}">
            <span class="yi-htool-lefticon yi-htool-smsicon"></span>
            <span class="yi-htool-title">客服人员在线</span>
            <strong class="yi-htool-num yi-htool-zixun"><b></b>点击免费咨询</strong>
        </a>
        {[%/if%]}
    </div>
    {[%if $siteTel%]}
    {[%if $siteInfo.site_shangwutong%]}
    <div class="yi-htool-right">
        <a href="{[%$siteInfo.site_shangwutong|escape:none%]}" class="yi-htool-sms  yi-tj yi-www" data-ac="st"
           data-coord="head">
            <b class="yi-htool-smsicon"></b>
        </a>
    </div>
    {[%elseif $siteInfo.isShangQiao%]}
    <div class="yi-htool-right">
        <a class="yi-htool-sms yi-tj  yi-www" data-ac="sq" data-coord="head" href="http://qiao.baidu
        .com/?module=default&controller=gateway&action=index&type=s&ucid={[%$userId|escape:none%]}&ip={[%$guestIP|escape:none%]}">
            <b class="yi-htool-smsicon"></b>
        </a>
    </div>
    {[%elseif $siteInfo.site_53kf%]}
    <div class="yi-htool-right">
        <a class="yi-htool-sms yi-tj  yi-www" data-ac="sq" data-coord="head" href="http://master.53kf.com/webCompany.php?arg={[%$siteInfo.site_53kf|escape:'html'%]}">
            <b class="yi-htool-smsicon"></b>
        </a>
    </div>
    {[%/if%]}
    {[%/if%]}
</div>
{[%/if%]}