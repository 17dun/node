{[%strip%]}
<div class="resource">
	<div class="resource-title">
	{[%foreach name=video_title from=$sub_data.entry_title.data_value.0 item=title%]}
		{[%if $title.type == "RESOURCE_ENTRY_IMAGE"%]}
			{[%if !empty($title.data_value.href)%]}
			<a href="{[%$title.data_value.href%]}"><img data-width="{[%$title.data_value.width%]}" data-height="{[%$title.data_value.height%]}" data-src="{[%$title.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" /></a>
			{[%else%]}
			<img data-width="{[%$title.data_value.width%]}" data-height="{[%$title.data_value.height%]}" data-src="{[%$title.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" />
			{[%/if%]}
			&nbsp;&nbsp;
		{[%else%]}
			{[%if !empty($title.data_value.link)%]}
				<a href="{[%$title.data_value.link%]}">{[%$title.data_value.text%]}</a>
			{[%else%]}
				{[%$title.data_value.text%]}
			{[%/if%]}
			&nbsp;&nbsp;
		{[%/if%]}
	{[%/foreach%]}
	</div>
	<div class="resource-content">
    {[%foreach name=video_list from=$sub_data.entry_content.data_value item=list%]} 
    	<div>
    	{[%foreach name=list_btn from=$list item=btn%]} 
    		{[%if $btn.type == "RESOURCE_ENTRY_BORDER"%]} 
        	<a class='resource-juji' href='{[%$btn.data_value.link%]}'>{[%$btn.data_value.text%]}</a>
        	{[%elseif $btn.type == "RESOURCE_ENTRY_IMAGE"%]} 
        		{[%if !empty($btn.data_value.href)%]} 
        		<a href="{[%$btn.data_value.href%]}"><img data-width="{[%$btn.data_value.width%]}" data-height="{[%$btn.data_value.height%]}" data-src="{[%$btn.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" /></a>
        		{[%else%]}
				<img data-width="{[%$btn.data_value.width%]}" data-height="{[%$btn.data_value.height%]}" data-src="{[%$btn.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" />
        		{[%/if%]}
        		&nbsp;&nbsp;
        	{[%else%]}
        		{[%if !empty($btn.data_value.link)%]} 
        		<a class='resource-text' href='{[%$btn.data_value.link%]}'>{[%$btn.data_value.text%]}</a>
        		{[%else%]}
				{[%$btn.data_value.text%]}
        		{[%/if%]}
        	{[%/if%]}
        {[%/foreach%]} 
    	</div>
    {[%/foreach%]}  
	</div>
</div>
{[%/strip%]}