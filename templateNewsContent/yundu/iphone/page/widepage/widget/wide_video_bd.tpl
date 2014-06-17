{[%strip%]}
<div class='resource'>
     <div class='resource-title'>
        {[%$item.data_value.VIDEO_TITLE%]}
    </div>  
    <div class="resource-content">
    {[%if !empty($item.data_value.VIDEO_IMAGE)%]}
    <div class="resource-left">	
        {[%if !empty($item.data_value.VIDEO_IMAGE.href)%]}
        <a class="resource-img-video" href="{[%$item.data_value.VIDEO_IMAGE.href%]}"><img wrap="resource-left" class="resource-img" data-src='{[%$item.data_value.VIDEO_IMAGE.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}' data-width={[%$item.data_value.VIDEO_IMAGE.width%]} data-height={[%$item.data_value.VIDEO_IMAGE.height%]} /></a>
        {[%else%]}
        <img wrap="resource-left" class="resource-img" data-src='{[%$item.data_value.VIDEO_IMAGE.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}' data-width={[%$item.data_value.VIDEO_IMAGE.width%]} data-height={[%$item.data_value.VIDEO_IMAGE.height%]} />
        {[%/if%]}
    </div>
	{[%/if%]}

    {[%foreach name=resource_list from=$item.data_value.VIDEO_INFO_LIST item=info_item%]}
        <div class="resource-info">
            <span class="resource-key">{[%$info_item.key%]}：</span>
            {[%foreach name=value_list from=$info_item.value item=value%]}
            {[%if !empty($value.link)%]}
            <a href='{[%$value.link%]}'>{[%$value.content%]}</a>
            {[%else%]}
            <span>{[%$value.content%]}</span>
            {[%/if%]}
            {[%if !$value@last%]}&nbsp;&nbsp;{[%/if%]}
            {[%/foreach%]}
        </div>
    {[%/foreach%]}
    </div>
</div>
{[%/strip%]}
