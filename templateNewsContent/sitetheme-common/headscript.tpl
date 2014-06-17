{[%strip%]}
<script>
window.TIME_START = new Date()*1;
var Du = {
    front : {
        userId  : '{[%$userId|escape:javascript%]}',
        ucid: '{[%$uc_id|default:0|escape:javascript%]}'||0,
        userType  : '{[%$userType|escape:javascript%]}',
        guestIP  : '{[%$guestIP|escape:javascript%]}',
        siteInfo  : {[%$siteInfo|escape:none|@json_encode%]},
        pc        : '{[%$pc|escape:javascript%]}',
        siteTitle : '{[%$siteTitle|escape:javascript%]}',
        siteTel   : '{[%$siteTel|escape:javascript%]}',
        siteRight : '{[%$siteRight|escape:javascript%]}',
        nocache   : '{[%$nocache|escape:javascript%]}',
        navType   : '{[%$navType|escape:javascript%]}',
        color     : '{[%$color|escape:javascript%]}',
        appid     : '{[%$appid|escape:javascript%]}',
        pcHost    : '{[%$pcHost|escape:javascript%]}',
        pcUrl    : '{[%$pcUrl|escape:javascript%]}',
	    src    : '{[%$src|escape:javascript%]}',
        api       : '{[%$appuiApi|escape:javascript%]}',
        hasPCBtn  : '{[%$pdUrl|escape:javascript%]}',
        pcPageUrl : '{[%$src|escape:javascript%]}',
        {[%if #ENV#==1%]}
        cmsDir    : '{[%#LINE_HOST#%]}',
        {[%elseif #ENV#==0%]}
        cmsDir    : '{[%#BAE_HOST#%]}',
        {[%/if%]}
        pageType : '{[%$res.data.page_type|escape:javascript%]}'||'{[%$res.data.pageType|escape:javascript%]}',
        structType : '{[%$res.data.struct_type|escape:javascript%]}',
        siteId : '{[%$siteId|escape:javascript%]}',
        siteType : '{[%$siteType|escape:javascript%]}',
        viewType : '{[%$struct_page_type|escape:javascript%]}',
        querySrc : '{[%$querySrc|escape:javascript%]}',
        dict :{[%$dict%]}
    }
};
</script>
{[%/strip%]}