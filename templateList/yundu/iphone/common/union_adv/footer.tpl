{[%if $res.data.page_type != "PAGE_TYPE_LIST"%]}
{[%if $ad && $ad.type == 'appsearch'%]}
    <div class="ad-appsearch"></div>
{[%else%]}
	{[%if $ad && $ad.type == 'union'%]}
	<div class="yi-adv yi-adv-bottom"id="cpro_u1333877"></div>
	<script type="text/javascript">
    (window.cpro_mobile_slot = window.cpro_mobile_slot || []).push({
        	    id: "u1333877"
        	});
    (window["cproStyleApi"] = window["cproStyleApi"] || {})["u1333877"]={
             			scale : "20.6",
             			adn : 2,
             			pl : "5",
             			originUrl:"{[%$res.data.url|escape:javascript%]}",
             	        filter_ct_ids:"4,32"
             };
	</script>
	{[%/if%]}
{[%/if%]}
{[%/if%]}
