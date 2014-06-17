{[%if !empty($item.data_value)%]}
    {[%if !empty($item.data_value.name_info)||!empty($item.data_value.time_info)%]}
        <div class="name-info">
            {[%if !empty($item.data_value.name_info)%]}
                {[%include file="tpl/list/inline.soy" sub_data=$item.data_value.name_info query_src=$querySrc%]}
            {[%/if%]}
        </div>
    {[%/if%]}
    {[%if !empty($item.data_value.time_info)%]}
        <div class="time-info">
            {[%include file="tpl/list/inline.soy" sub_data=$item.data_value.time_info query_src=$querySrc%]}
        </div>
    {[%/if%]}
    {[%if !empty($item.data_value.content_info)%]}
        <div class="content-info">
            {[%foreach name=contentinfo_list from=$item.data_value.content_info item=contentinfo_list%]}
                <div class="content-list">
                    {[%if ($contentinfo_list.TYPE =="IN_LINE")%]}
                        <div class="content-info">
                            {[%include file="tpl/list/inline.soy" sub_data=$contentinfo_list.items query_src=$querySrc%]}
                        </div>
                    {[%/if%]}
                </div>
            {[%/foreach%]}
        </div>
    {[%/if%]}
    {[%if !empty($item.data_value.other_info)%]}
        <div class="other-info">
              {[%include file="tpl/list/inline.soy" sub_data=$item.data_value.other_info query_src=$querySrc%]}
        </div>
    {[%/if%]}
{[%/if%]}