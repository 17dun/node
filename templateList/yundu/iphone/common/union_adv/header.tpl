{[%if $res.data.page_type != "PAGE_TYPE_LIST"%]}
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