{[%strip%]}
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
    <link type='text/css' rel="stylesheet" href='{[%$OfflinePath%]}/build/static/ss-{[%$cssVersion%]}.css'/>
{[%elseif $RunEnv == 21%]}
    <link type='text/css' rel="stylesheet" href='{[%$OnlinePath%]}/css/ss-{[%$cssVersion%]}.css'/>
{[%else%]}
    <link type='text/css' rel="stylesheet/less" href='{[%$OfflinePath%]}/projects/siteappSearch/css/main.css'/>
    <script type="text/javascript" src="{[%$OfflinePath%]}/less-1.5.0.min.js"></script>
{[%/if%]}

{[%/strip%]}
