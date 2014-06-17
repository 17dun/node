/** TODO 删除模板 不再使用 新模板 tpl/nav/navList.soy**/
<li class="hListItem">
	{[%if !empty($sub_data.title)%]}
	<a href="{[%$sub_data.href%]}">
	      <span>{[%$sub_data.title%]}</span>
	</a>
	{[%else%]}
	<a href="{[%$sub_data.href%]}" data-src="{[%$sub_data.img|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}">
		<span></span>
	</a>
	{[%/if%]}
</li>
