{[%if $jzFlag%]}
    {[%if $jzAdv%]}
    {[%if $jzAdv.advCont.ADP_FOOT_1.srcId%]}
    <div class="yi-adv yi-adv-foot1" id="cpro_{[%$jzAdv.advCont.ADP_FOOT_1.srcId%]}">
    <script type="text/javascript">
    (window.cpro_mobile_slot = window.cpro_mobile_slot || []).push({
        id: "{[%$jzAdv.advCont.ADP_FOOT_1.srcId%]}"
    });
    (window["cproStyleApi"] = window["cproStyleApi"] || {})["{[%$jzAdv.advCont.ADP_FOOT_1.srcId%]}"]={
        "tn": "template_inlay_all_mobile",
        "adn": 1,
        "originUrl" : "{[%$res.data.url|escape:javascript%]}",
        "pl":"4"
    }
    </script>
    </div>
    {[%/if%]}
    {[%if $jzAdv.advCont.ADP_FOOT_2.srcId%]}
    <div class="yi-adv yi-adv-foot2" id="cpro_{[%$jzAdv.advCont.ADP_FOOT_2.srcId%]}">
    <script type="text/javascript">
    (window.cpro_mobile_slot = window.cpro_mobile_slot || []).push({
        id: "{[%$jzAdv.advCont.ADP_FOOT_2.srcId%]}"
    });
    (window["cproStyleApi"] = window["cproStyleApi"] || {})["{[%$jzAdv.advCont.ADP_FOOT_2.srcId%]}"]={
        tn:"template_inlay_all_mobile",
        adn:1,
        originUrl:"{[%$res.data.url|escape:javascript%]}"
    };
    </script>
    </div>
    {[%/if%]}
    {[%/if%]}
{[%elseif $res.data.page_type != "PAGE_TYPE_NEWS_CONTENT"%]}
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