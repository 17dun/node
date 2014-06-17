{[%if $advInfo && $advInfo.advSrc == "baidu-union" && $advInfo.advCont  && $advInfo.advCont.ADP_FOOT_1 && $advInfo.advCont.ADP_FOOT_1.isActive && $advInfo.advCont.ADP_FOOT_1.srcId%]}
<div class="yi-adv yi-adv-foot1">
<script type="text/javascript">
var cpro_id = "{[%$advInfo.advCont.ADP_FOOT_1.srcId|escape:javascript%]}";
(window["cproStyleApi"] = window["cproStyleApi"] || {})["{[%$advInfo.advCont.ADP_FOOT_1.srcId|escape:javascript%]}"]={
	"tn": "template_inlay_all_mobile",
	"adn": 1,
	"originUrl" : "{[%$pcUrl|escape:javascript%]}",
    "pl":"4"
}
</script>
<script type="text/javascript" src="{[%#ADV_SCRIPT#%]}"></script>
</div>
{[%/if%]}

{[%if $advInfo && $advInfo.advSrc == "baidu-union" && $advInfo.advCont  && $advInfo.advCont.ADP_FOOT_2 && $advInfo.advCont.ADP_FOOT_2.isActive && $advInfo.advCont.ADP_FOOT_2.srcId%]}
<div class="yi-adv yi-adv-foot2">
<script type="text/javascript">
var cpro_id = "{[%$advInfo.advCont.ADP_FOOT_2.srcId|escape:javascript%]}";
(window["cproStyleApi"] = window["cproStyleApi"] || {})["{[%$advInfo.advCont.ADP_FOOT_2.srcId|escape:javascript%]}"]={
	tn:"template_inlay_all_mobile",
	adn:1,
	originUrl:"{[%$pcUrl|escape:javascript%]}"
};
</script>
<script type="text/javascript" src="{[%#ADV_SCRIPT#%]}"></script>
</div>
{[%/if%]}