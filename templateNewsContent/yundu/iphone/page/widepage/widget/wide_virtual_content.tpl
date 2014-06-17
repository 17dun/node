{[%foreach name=virtualContent from=$sub_data.content item=sub_item%]}
	{[%include file="./wide_process.tpl" item=$sub_item%]}
{[%/foreach%]}