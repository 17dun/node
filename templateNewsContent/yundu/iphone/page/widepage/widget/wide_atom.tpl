{[%strip%]}

<div class="hListContent hFlex">
<div class="hListTitle hOmit2">
<p class="{[%if $item.type eq "INLINE"%]} ssListItemInLine {[%/if%]}">
{[%foreach name=atom_list from=$item.data_value.links item=sub_item%]}
{[%if $sub_item.href%]}
<a href="?{[%$querySrc|cat:"&"%]}src={[%$sub_item.href|urlencode%]}">{[%$sub_item.text%]}</a>
{[%/if%]}
{[%/foreach%]}
</p>
</div>
{[%if $item.data_value.summary%]}
<div class="hListAttr hOmit3">{[%$item.data_value.summary %]}</div>
{[%/if%]}
</div>

{[%if $item.data_value.src%]}
    {[%if getImageRealHight($item.data_value,78)%]}{[%/if%]}
	{[%if $item.data_value.img_href%]}
    	<a href="?{[%$querySrc|cat:"&"%]}src={[%$item.data_value.img_href|urlencode%]}">
		<span style="{[%if !empty($item.data_value.showHeight)%]}height:{[% $item.data_value.showHeight%]}px;{[%if $item.data_value.showHeight>98%]}background-size:contain!important;{[%/if%]}{[%/if%]}" data-src="{[%$item.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"w156"%]}" class="hListImg {[%$item.data_value.className%]}" data-height="{[%$item.data_value.height%]}" data-width="{[%$item.data_value.width%]}" ></span>
	</a>
	{[%else%]}
		<div style="{[%if  !empty($item.data_value.showHeight)%]}height:{[% $item.data_value.showHeight%]}px;{[%if $item.data_value.showHeight>98%]}background-size:contain!important;{[%/if%]}{[%/if%]}" class="hListImg {[%$item.data_value.className%]}" data-src="{[%$item.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"w156"%]}" data-height="{[%$item.data_value.height%]}" data-width="{[%$item.data_value.width%]}"></div>
	{[%/if%]}

{[%/if%]}

{[%/strip%]}
