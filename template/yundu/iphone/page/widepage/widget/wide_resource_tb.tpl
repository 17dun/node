{[%strip%]}
    
    {[%if !empty($item.resource_turning_images)%]}
	   {[%include file="../../../common/dev/banner.tpl" FOCUSPIC=$item|imgLunbo|imageList4%]}  
    {[%else%]}
        {[%if !empty($item.resource_image)%]}
        <div class="resource-img-c">
            {[%if !empty($item.resource_image.data_value.href)%]}
            <a href="{[%$item.resource_image.data_value.href%]}">
                <img class="resource-img-tb" data-src="{[%$item.resource_image.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" wrap="a" data-width="{[%$item.resource_image.data_value.width%]}" data-height="{[%$item.resource_image.data_value.height%]}" />
            </a>
            {[%else%]}
                <img class="resource-img-tb" data-src="{[%$item.resource_image.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" wrap="a" data-width="{[%$item.resource_image.data_value.width%]}" data-height="{[%$item.resource_image.data_value.height%]}"/>
            {[%/if%]}
        </div>
        {[%/if%]}
    {[%/if%]}
    <div class="resource-imgtext">
    {[%if !empty($item.resource_normal_below_img)%]}
        {[%foreach name=textline from=$item.resource_normal_below_img item=line%]}
        <div class="resource-below-img">
            {[%foreach name=list from=$line item=below%]}
                {[%if $below.type == "RESOURCE_EMP_TEXT_0" || $below.type == "RESOURCE_ENTRY_TEXT_0" || $below.type == "RESOURCE_NORMAL_TEXT_0"%]}
                    {[%if !empty($below.data_value.link)%]}
                    <a {[%if $below.type == "RESOURCE_ENTRY_TEXT_0"%]}class="resource-entry"{[%/if%]} href="{[%$below.data_value.link%]}">{[%$below.data_value.text%]}</a>
                    {[%else%]}
                    {[%$below.data_value.text%]}
                    {[%/if%]}
                {[%elseif $below.type == "RESOURCE_EMP_TEXT_1" || $below.type == "RESOURCE_ENTRY_TEXT_1" || $below.type == "RESOURCE_NORMAL_TEXT_1"%]}
                    &nbsp;
                    {[%if !empty($below.data_value.link)%]}
                    <a {[%if $below.type == "RESOURCE_ENTRY_TEXT_1"%]}class="resource-entry"{[%/if%]} href="{[%$below.data_value.link%]}">{[%$below.data_value.text%]}</a>
                    {[%else%]}
                    {[%$below.data_value.text%]}
                    {[%/if%]}
                {[%elseif $below.type == "RESOURCE_EMP_TEXT_2" || $below.type == "RESOURCE_ENTRY_TEXT_2" || $below.type == "RESOURCE_NORMAL_TEXT_2" || $below.type == "RESOURCE_LONG_TEXT"%]}
                    &nbsp;&nbsp;
                    {[%if !empty($below.data_value.link)%]}
                    <a {[%if $below.type == "RESOURCE_ENTRY_TEXT_2"%]}class="resource-entry"{[%/if%]} href="{[%$below.data_value.link%]}">{[%$below.data_value.text%]}</a>
                    {[%else%]}
                    {[%$below.data_value.text%]}
                    {[%/if%]}
                {[%elseif $below.type == "RESOURCE_NORMAL_IMG"%]}
                    &nbsp;&nbsp;
                    {[%if !empty($below.data_value.href)%]}
                    <a href="{[%$below.data_value.href%]}"><img data-height="{[%$below.data_value.height%]}" data-width="{[%$below.data_value.width%]}" data-src="{[%$below.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" wrap="a" /></a>
                    {[%else%]}
                    <img data-width="{[%$below.data_value.width%]}" data-height="{[%$below.data_value.height%]}" data-src="{[%$below.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" />
                    {[%/if%]}
                {[%elseif $below.type == "RESOURCE_KEY_VALUE_1"%]}
                    <span class="resource-key">{[%if !empty($below.data_value.key_link)%]}
                    <a href="{[%$below.data_value.key_link%]}">{[%$below.data_value.key%]}</a>：
                    {[%else%]}
                    {[%$below.data_value.key%]}：
                    {[%/if%]}
                    {[%if !empty($below.data_value.value_link)%]}
                    <a href="{[%$below.data_value.value_link%]}">{[%$below.data_value.value%]}</a>
                    {[%else%]}
                    {[%$below.data_value.value%]}
                    {[%/if%]}</span>
                {[%elseif $below.type == "RESOURCE_KEY_VALUE_2"%]}
                    <span class="resource-key">{[%if !empty($below.data_value.key_link)%]}
                    <a href="{[%$below.data_value.key_link%]}">{[%$below.data_value.key%]}</a>：
                    {[%else%]}
                    {[%$below.data_value.key%]}：
                    {[%/if%]}</span>
                    {[%if !empty($below.data_value.value_link)%]}
                    <a href="{[%$below.data_value.value_link%]}">{[%$below.data_value.value%]}</a>
                    {[%else%]}
                    {[%$below.data_value.value%]}
                    {[%/if%]}
                {[%elseif $below.type == "RESOURCE_KEY_VALUE_3"%]}
                    {[%if !empty($below.data_value.key_link)%]}
                    <a href="{[%$below.data_value.key_link%]}">{[%$below.data_value.key%]}</a>：
                    {[%else%]}
                    {[%$below.data_value.key%]}：
                    {[%/if%]}
                    <span class="resource-key">
                    {[%if !empty($below.data_value.value_link)%]}
                    <a href="{[%$below.data_value.value_link%]}">{[%$below.data_value.value%]}</a>
                    {[%else%]}
                    {[%$below.data_value.value%]}
                    {[%/if%]}</span>
                {[%elseif $below.type == "RESOURCE_KEY_VALUE_4"%]}
                    {[%if !empty($below.data_value.key_link)%]}
                    <a href="{[%$below.data_value.key_link%]}">{[%$below.data_value.key%]}</a>：
                    {[%else%]}
                    {[%$below.data_value.key%]}：
                    {[%/if%]}
                    {[%if !empty($below.data_value.value_link)%]}
                    <a href="{[%$below.data_value.value_link%]}">{[%$below.data_value.value%]}</a>
                    {[%else%]}
                    {[%$below.data_value.value%]}
                    {[%/if%]}
                {[%/if%]}    
            {[%/foreach%]}
        </div>
        {[%/foreach%]}
    {[%/if%]}
    </div>
    <div class="resource-content-tb">
    {[%if !empty($item.resource_title)%]}
    <div class="resource-title-tb">
    {[%foreach name=resource_title from=$item.resource_title item=title%]}
        <span class="resource-subtitle">{[%if !empty($title.data_value.link)%]}
        <a href="{[%$title.data_value.link%]}">{[%$title.data_value.text%]}</a>
        {[%else%]}
        {[%$title.data_value.text%]}
        {[%/if%]}</span>
    {[%/foreach%]}
    </div>
    {[%/if%]}

    {[%foreach name=normal_list from=$item.resource_normal item=normal%]}
        <div class="resource-info">
        {[%foreach name=struct_list from=$normal item=struct%]}
        {[%if $struct.type == "RESOURCE_KEY_VALUE_1"%]}
            <span class="resource-key">{[%if !empty($struct.data_value.key_link)%]}
            <a href="{[%$struct.data_value.key_link%]}">{[%$struct.data_value.key%]}</a>：
            {[%else%]}
            {[%$struct.data_value.key%]}：
            {[%/if%]}
            {[%if !empty($struct.data_value.value_link)%]}
            <a href="{[%$struct.data_value.value_link%]}">{[%$struct.data_value.value%]}</a>
            {[%else%]}
            {[%$struct.data_value.value%]}
            {[%/if%]}</span>
        {[%elseif $struct.type == "RESOURCE_KEY_VALUE_2"%]}
            <span class="resource-key">{[%if !empty($struct.data_value.key_link)%]}
            <a href="{[%$struct.data_value.key_link%]}">{[%$struct.data_value.key%]}</a>：
            {[%else%]}
            {[%$struct.data_value.key%]}：
            {[%/if%]}</span>
            {[%if !empty($struct.data_value.value_link)%]}
            <a href="{[%$struct.data_value.value_link%]}">{[%$struct.data_value.value%]}</a>
            {[%else%]}
            {[%$struct.data_value.value%]}
            {[%/if%]}
        {[%elseif $struct.type == "RESOURCE_KEY_VALUE_3"%]}
            {[%if !empty($struct.data_value.key_link)%]}
            <a href="{[%$struct.data_value.key_link%]}">{[%$struct.data_value.key%]}</a>：
            {[%else%]}
            {[%$struct.data_value.key%]}：
            {[%/if%]}
            <span class="resource-key">
            {[%if !empty($struct.data_value.value_link)%]}
            <a href="{[%$struct.data_value.value_link%]}">{[%$struct.data_value.value%]}</a>
            {[%else%]}
            {[%$struct.data_value.value%]}
            {[%/if%]}</span>
        {[%elseif $struct.type == "RESOURCE_KEY_VALUE_4"%]}
            {[%if !empty($struct.data_value.key_link)%]}
            <a href="{[%$struct.data_value.key_link%]}">{[%$struct.data_value.key%]}</a>：
            {[%else%]}
            {[%$struct.data_value.key%]}：
            {[%/if%]}
            {[%if !empty($struct.data_value.value_link)%]}
            <a href="{[%$struct.data_value.value_link%]}">{[%$struct.data_value.value%]}</a>
            {[%else%]}
            {[%$struct.data_value.value%]}
            {[%/if%]}
        {[%elseif $struct.type == "RESOURCE_EMP_TEXT_0"%]}
            {[%if !empty($struct.data_value.link)%]}
            <a href="{[%$struct.data_value.link%]}">{[%$struct.data_value.text%]}</a>
            {[%else%]}
            {[%$struct.data_value.text%]}
            {[%/if%]}
        {[%elseif $struct.type == "RESOURCE_EMP_TEXT_1"%]}
            {[%if !empty($struct.data_value.link)%]}
            <a href="{[%$struct.data_value.link%]}">{[%$struct.data_value.text%]}</a>
            {[%else%]}
            {[%$struct.data_value.text%]}
            {[%/if%]}
        {[%elseif $struct.type == "RESOURCE_EMP_TEXT_2"%]}
            {[%if !empty($struct.data_value.link)%]}
            <a href="{[%$struct.data_value.link%]}">{[%$struct.data_value.text%]}</a>
            {[%else%]}
            {[%$struct.data_value.text%]}
            {[%/if%]}
        {[%elseif $struct.type == "RESOURCE_NORMAL_TEXT_0"%]}
            {[%if !empty($struct.data_value.link)%]}
            <a href="{[%$struct.data_value.link%]}">{[%$struct.data_value.text%]}</a>
            {[%else%]}
            {[%$struct.data_value.text%]}
            {[%/if%]}
        {[%elseif $struct.type == "RESOURCE_NORMAL_TEXT_1"%]}
            {[%if !empty($struct.data_value.link)%]}
            <a href="{[%$struct.data_value.link%]}">{[%$struct.data_value.text%]}</a>
            {[%else%]}
            {[%$struct.data_value.text%]}
            {[%/if%]}
        {[%elseif $struct.type == "RESOURCE_NORMAL_TEXT_2"%]}
            {[%if !empty($struct.data_value.link)%]}
            <a href="{[%$struct.data_value.link%]}">{[%$struct.data_value.text%]}</a>
            {[%else%]}
            {[%$struct.data_value.text%]}
            {[%/if%]}
        {[%elseif $struct.type == "RESOURCE_ENTRY_TEXT_0" || $struct.type == "RESOURCE_ENTRY_TEXT_1" || $struct.type == "RESOURCE_ENTRY_TEXT_2"%]}
            {[%if !empty($struct.data_value.link)%]}
            <a class="resource-entry" href="{[%$struct.data_value.link%]}">{[%$struct.data_value.text%]}</a>
            {[%else%]}
            {[%$struct.data_value.text%]}
            {[%/if%]} 
        {[%elseif $struct.type == "RESOURCE_LONG_TEXT"%]}
            {[%if !empty($struct.data_value.link)%]}
            <a href="{[%$struct.data_value.link%]}">{[%$struct.data_value.text%]}</a>
            {[%else%]}
            {[%$struct.data_value.text%]}
            {[%/if%]}
        {[%elseif $struct.type == "RESOURCE_NORMAL_IMG"%]}
            {[%if !empty($struct.data_value.href)%]}
            <a href="{[%$struct.data_value.href%]}"><img data-height="{[%$struct.data_value.height%]}" data-width="{[%$struct.data_value.width%]}" data-src="{[%$struct.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" wrap="a" /></a>
            {[%else%]}
            <img data-width="{[%$struct.data_value.width%]}" data-height="{[%$struct.data_value.height%]}" data-src="{[%$struct.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}" />
            {[%/if%]}
        {[%/if%]}
        {[%if !$struct@last%]}&nbsp;&nbsp;{[%/if%]}
        {[%/foreach%]} 
        </div>
    {[%/foreach%]}
    </div>
{[%/strip%]}
