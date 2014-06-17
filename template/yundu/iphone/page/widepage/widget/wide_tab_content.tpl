{[%strip%]}


{[%foreach name=tab_content_block from=$sub_data.items item=sub_item%]}

    {[%include file="./wide_process.tpl" item=$sub_item%]}

{[%/foreach%]}


{[%/strip%]}
