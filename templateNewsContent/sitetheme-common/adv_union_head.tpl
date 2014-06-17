{[%if $advInfo && $advInfo.advSrc == "baidu-union" && $advInfo.advCont  && $advInfo.advCont.ADP_HEAD_1 && $advInfo.advCont.ADP_HEAD_1.isActive && $advInfo.advCont.ADP_HEAD_1.srcId%]}
<div class="yi-adv yi-adv-head">
<script type="text/javascript">
var cpro_id = "{[%$advInfo.advCont.ADP_HEAD_1.srcId|escape:javascript%]}";
(window["cproStyleApi"] = window["cproStyleApi"] || {})["{[%$advInfo.advCont.ADP_HEAD_1.srcId|escape:javascript%]}"]={
    "tn" : "template_inlay_all_mobile",
	"adn":1,
	"originUrl":"{[%$pcUrl|escape:javascript%]}",
    "pl":"4"
};
</script>
<script type="text/javascript" src="{[%#ADV_SCRIPT#%]}"></script>
</div>
{[%/if%]}