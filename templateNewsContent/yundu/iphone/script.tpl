{[%strip%]}
{[%if $RunEnv == 1%]}

<script>
    PDC.mark('c_jsstart');
</script>
{[%if $localstorage==1%]}

{[%if $statics.js_main%]}
<script id="js_main">{[%$statics.js_main%]}</script>
<script>
Store.enable && Store.toLocal("js_main","sapp_theme_2_");
</script>
{[%else%]}
<script>
window.addEventListener("DOMContentLoaded",function(){
    setTimeout(function(){
        Store.evalJs("js_main","sapp_theme_2_",true);
    },1);
});
</script>
{[%/if%]}

{[%if $statics && $statics.css_head%]}
<script>
   Store.enable && Store.toLocal("css_head", "sapp_theme_2_");
</script>
{[%/if%]}
 {[%if $statics.js_top%]}
    <script type="text/javascript">
         Store.enable && Store.toLocal("js_top","sapp_theme_2_");
    </script>
{[%/if%]}
{[%/if%]}
<script>
    PDC.mark('c_jsend');
</script>
{[%elseif $RunEnv == 2%]}
    <script type="text/javascript" src='{[%$OfflinePath%]}/build/static/ss-{[%$jsVersion%]}.js'></script>
{[%elseif $RunEnv == 21%]}
	<script type="text/javascript">
		window.addEventListener("load",function(event){
			setTimeout(function(){
				var script = document.createElement("script");
				script.type = "text/javascript";
				script.src = "{[%$OnlinePath%]}/ss-{[%$jsVersion%]}.js";
				document.body.appendChild(script);
			},1);
		});
	</script>
{[%else%]}
    <script type="text/javascript" src="{[%$OfflinePath%]}/src/js/core/Loader.js"></script>
    <script type="text/javascript" src="{[%$OfflinePath%]}/src/js/siteApp/main.js"></script>
    <script type="text/javascript" src="http://cp01-rdqa-dev098.cp01.baidu.com:8576/templateFront.debug.js"></script>
{[%/if%]}
{[%/strip%]}

