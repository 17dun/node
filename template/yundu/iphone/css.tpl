{[%strip%]}
{[%if $jzFlag%]}
<link rel="apple-touch-icon-precomposed" href="{[%$jzInfo.ico_url%]}" />
{[%/if%]}
{[%if $RunEnv == 1%]}
{[%if $localstorage == 1%]}
{[%include file="../../sitetheme-common/static/store.tpl"%]}
    {[%if $statics && $statics.css_head%]}
    <style id="css_head">{[%$statics.css_head%]}</style>
    {[%else%]}
    <style id="css_head"></style>
    <script>
        Store.enable ? Store.toHtml("css_head", "sapp_theme_2_") : location.reload();
    </script>
   {[%/if%]}
{[%/if%]}

{[%elseif $RunEnv == 2%]}
<link type='text/css' rel="stylesheet" href='{[%$OfflinePath%]}/build/static/0.6.14/ss-min.css'/>
{[%else%]}
<link type='text/css' rel="stylesheet" href='{[%$OfflinePath%]}/projects/siteappSearch/css/main.css'/>
{[%/if%]}

{[%/strip%]}
