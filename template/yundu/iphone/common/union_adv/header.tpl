{[%if $jzFlag%]}
	{[%if $jzAdv && $jzAdv.advCont.ADP_HEAD_1.srcId%]}
	<div class="yi-adv yi-adv-head" style="min-height:50px;" id="cpro_{[%$jzAdv.advCont.ADP_HEAD_1.srcId%]}"></div>
	<script type="text/javascript">
	(window.cpro_mobile_slot = window.cpro_mobile_slot || []).push({
	    id: "{[%$jzAdv.advCont.ADP_HEAD_1.srcId%]}"
	});
	(window["cproStyleApi"] = window["cproStyleApi"] || {})["{[%$jzAdv.advCont.ADP_HEAD_1.srcId%]}"]={
	    "tn" : "template_inlay_all_mobile",
		"adn":1,
		"originUrl":"{[%$res.data.url|escape:javascript%]}",
	    "pl":"4"
	};
	</script>
	{[%/if%]}
{[%elseif $res.data.page_type != "PAGE_TYPE_NEWS_CONTENT"%]}
	{[%if $ad && $ad.type == 'appsearch'%]}
	    <div class="ad-appsearch"></div>
	{[%else%]}
		{[%if $ad && $ad.type == 'union'%]}
		<div class="yi-adv yi-adv-head" style="min-height:50px;" id="cpro_u1333874"></div>
		<script type="text/javascript">
		(window.cpro_mobile_slot = window.cpro_mobile_slot || []).push({
		    id: "u1333874"
		});
		(window["cproStyleApi"] = window["cproStyleApi"] || {})["u1333874"]={
		    pl : "5",
		    originUrl:"{[%$res.data.url|escape:javascript%]}",
		    filter_ct_ids:"4,32"
		};
		</script>
		{[%/if%]}
	{[%/if%]}
{[%/if%]}
