{[%strip%]}
<div class="ssListContainer">
	<ul class="yi-list-ul hList{[%if $index_items.split == 1%]} yi-split-ul{[%/if%]}">
    {[%foreach name=index_list from=$sub_data.items item=sub_item%]}
	    {[%assign var="isNoDis" value="" %]}
        {[%if $sub_data.items[0].type == "LINK" || $sub_data.items[0].type == "INLINE"%]}
            {[%assign var="index" value=$sub_item@index %]}
        {[%else%]}
            {[%assign var="index" value=$sub_item@index+1 %]}
        {[%/if%]}
	    {[%if $sub_data.showCount >0 && $sub_item@index>= $sub_data.showCount && $sub_data.items|count > $sub_data.showCount+4%]}
            {[%assign var="isNoDis" value="noDis" %]}
	    {[%/if%]}
		{[%if $sub_item.type=="ATOM"%]}
		<li class="yi-list-li  yi-list-atom hBoxH hListItem {[%$isNoDis%]}" data-type="img-text-list">
        	{[%include file="./wide_process.tpl" item=$sub_item%]}
    	</li>
		{[%elseif $sub_item.type=="LINK"%]}
		<li class="yi-list-li yi-list-link hListItem {[%$isNoDis%]} {[%if $index_items.split == 1 && $index % 2 ==0%]}yi-split-lieven{[%else%]}yi-split-liodd{[%/if%]}" data-type="text-list">
            <a class="yi-list-name yi-hover" href="?{[%$querySrc|cat:"&"%]}src={[%$sub_item.data_value.href|urlencode%]}">
                {[%include file="./wide_process.tpl" item=$sub_item%]}
            </a>
        </li>
        {[%elseif $sub_item.type=="INLINE"%]}
        <li class="yi-list-li yi-list-inline hListItem {[%$isNoDis%]} {[%if $index_items.split == 1 && $index % 2 ==0%]}yi-split-lieven{[%else%]}yi-split-liodd{[%/if%]}" data-type="text-list">
            <div class="yi-list-name {[%if !empty($sub_item.align_right)%]}ssInLineAlignRight{[%/if%]}">
                {[%include file="./wide_process.tpl" item=$sub_item%]}
            </div>
        </li>
		{[%elseif $sub_item.type=="TEXT"%]}
		<li class="yi-list-li yi-list-inline hListItem {[%if $index_items.split == 1 && !$sub_item@first && !$sub_item@last%]}{[%if $index % 2 ==0%]}yi-split-lieven{[%else%]}yi-split-liodd{[%/if%]}{[%/if%]} {[%if $index_items.split == 1%]} yi-split-text{[%/if%]}" data-type="text-list">
            {[%include file="./wide_process.tpl" item=$sub_item%]}
        </li>
		{[%/if%]}
	{[%/foreach%]}
	</ul>
	{[%if $sub_data.items|count > $sub_data.showCount+4 && $sub_data.showCount >0 && $index_items.split != 1%]}
       <div class="hShowMoreItem tap" data-action="showMoreListItem" {[%if $sub_data.showConfig %]}data-showConfig="{[%$sub_data.showConfig%]}"{[%/if%]}><span>点击加载更多</span></div>
    {[%/if%]}
</div>
{[%/strip%]}
