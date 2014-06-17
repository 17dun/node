{[%if $res.data.page_type != "PAGE_TYPE_LIST"%]}
    {[%if $ad && $ad.type == 'appsearch'%]}
        <script class="appsearch" type="text/javascript" src="http://m.baidu.com/api?action=siteapp&domClass=ad-appsearch&from=1003582f&token=siteapp&curq={[%$search_query|urlencode%]}&hos
    t={[%$ad.host|urlencode%]}"></script>
    {[%else%]}
    	{[%if $ad && $ad.type == 'union'%]}
            <script type="text/javascript">
                window.addEventListener("load",function(){
                    setTimeout(function(){
                        var script = document.createElement("script");
                        script.type="text/javascript";
                        script.src = "http://cpro.baidustatic.com/cpro/ui/cm.js";
                        document.body.appendChild(script);
                    },1);
                });
            </script>
    	{[%/if%]}
    {[%/if%]}
{[%/if%]}
