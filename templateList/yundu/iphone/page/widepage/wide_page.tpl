{[%foreach name=list from=$res.data.blocks item=item%]}
	{[%include file="./widget/wide_process.tpl" item=$item%]}
{[%/foreach%]}
