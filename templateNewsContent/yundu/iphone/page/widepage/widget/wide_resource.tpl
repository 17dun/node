{[%strip%]}
<div class="resource">
    {[%*资源块展示在首位*%]}
    {[%foreach name=resource_list from=$sub_data.items item=sub_item%]}
        {[%if $sub_item.type=="REAL_RESOURCE"%]}
        {[%*资源块本身*%]}
            {[%if !empty($sub_item.data_value.resource_turning_images.type) %]}
                {[%include file="./wide_resource_tb.tpl" item=$sub_item.data_value%]}
            {[%else%]}
                {[%if $sub_item.data_value.resource_image.type=="RESOURCE_BIG_LEFT_IMAGE"%]}
                    {[%include file="./wide_resource_lr.tpl" item=$sub_item.data_value%]}
                {[%else%]}
                    {[%include file="./wide_resource_tb.tpl" item=$sub_item.data_value%]}
                {[%/if%]}
            {[%/if%]}
        {[%/if%]}
    {[%/foreach%]}
    {[%foreach name=resource_list from=$sub_data.items item=sub_item%]}
        {[%if $sub_item.type!="REAL_RESOURCE"%]}
        {[%*其它块*%]}
            {[%include file="./wide_process.tpl" item=$sub_item%]}
        {[%/if%]}
    {[%/foreach%]}
</div>
{[%/strip%]}
