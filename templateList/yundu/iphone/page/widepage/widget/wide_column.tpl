{[%strip%]}
{[%if $sub_data.content%]}
<div class="hCard">
	{[%if $sub_data.title.data_value.items|@count neq 0%]}
		{[%include file="./wide_process.tpl" item=$sub_data.title%]}
	{[%/if%]}
	{[%if $sub_data.content%]}
		{[%include file="./wide_process.tpl" item=$sub_data.content%]}
	{[%/if%]}
    {[%if $sub_data.title.type=='COLUMN_TITLE' && $sub_data.title.data_value.items|@count neq 0%]}
    {[%/if%]}
</div>
{[%/if%]}
{[%/strip%]}
