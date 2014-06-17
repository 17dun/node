{[%foreach name=list from=$sub_data.data_value.items item=item%]}
    {[%include file="./wide_process.tpl" item=$item%]}
{[%/foreach%]}
