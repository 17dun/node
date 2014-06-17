{[%foreach name=grpbox from=$sub_data item=sub_item%]}
	{[%include file="./wide_process.tpl" item=$sub_item parentType="GROUPBOX"%]}
{[%/foreach%]}
