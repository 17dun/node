{[%strip%]}
<div class="picturn">
    <img class="picturnImg" data-src="{[%$sub_data.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" data-width="{[%$sub_data.width%]}" data-height="{[%$sub_data.height%]}" />
    <div class="sliderCtrl">
    	{[%if !empty($sub_data.pre_href)%]}
			<a class="sliderPrev tap" href="{[%$sub_data.pre_href%]}" data-action="down"></a>
    	{[%else%]}
    		<a class="sliderPrev picturnBtnPreGray tap"></a>
    	{[%/if%]}
	    {[%if !empty($sub_data.next_href)%]}
			<a class="sliderNext tap" href="{[%$sub_data.next_href%]}" data-action="down"></a>
    	{[%else%]}
    		<a class="sliderNext picturnBtnNextGray tap"></a>
    	{[%/if%]}
    </div>
</div>
{[%/strip%]}
