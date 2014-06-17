{[%config_load file="tcwise-static.conf"%]}
{[%if $terminal_type == 1%]}
{[%if $querySrc==""%]}{[%*后期统一传querySrc*%]}
    {[%if $dict%]}
    {[%assign var=querySrc value="srd=1&dict={[%$dict|escape:html%]}"%]}
    {[%elseif $smarty.get.customsearch==1%]}
    {[%assign var=querySrc value="customsearch=1&nocache=1&appid=$appid"%]}
    {[%elseif $pcHost%]}
    {[%assign var=querySrc value="host=$pcHost"%]}
    {[%/if%]}
{[%/if%]}
{[%assign var=color value=0%]}
{[%if $adAjax == 1 %]}
{[%include file="./iphone/common/dev/adAjax.tpl"%]}
{[%elseif $redirect&&$redirect.type == "img" %]}
    {[%include file="./iphone/common/singleimg.tpl"%]}
{[%elseif $redirect&&$redirect.type == "dataInfo"%]}
    {[%include file="./iphone/common/showDataInfo.tpl"%]}
{[%else%]}
{[%include file="./iphone/page.tpl"%]}
{[%/if%]}
{[%/if%]}
