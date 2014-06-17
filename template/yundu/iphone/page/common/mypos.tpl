{[%if $item%]}
<ul class="yi-mypos s-clear yi-mypos-2">
	{[%foreach name=navpos from=$item item=sub_item%]}
	{[%if $sub_item.href neq ""%]}
		{[%if $smarty.foreach.navpos.last%]}
		<li class="yi-mypos-last"><a href="?src={[%$sub_item.href%]}">{[%$sub_item.text%]}</a></li>
		{[%else%]}
		<li class="yi-mypos-color"><a href="?src={[%$sub_item.href%]}">{[%$sub_item.text%]}</a></li>
		{[%/if%]}
	{[%else%]}
		<li class="yi-mypos-nohref">{[%$sub_item.text%]}</li>
	{[%/if%]}
{[%/foreach%]}
</ul>
{[%/if%]}