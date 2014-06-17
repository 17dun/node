/** TODO 删除模板 不再使用 新模板 tpl/nav/navList.soy**/
<li class="hListItem">
	
	<a class="tap" data-action="navListShowMore" {[%if empty($sub_data.title) && !empty($sub_data.img) %]}data-src="{[%$sub_data.img|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}"{[%/if%]}><span>{[%$sub_data.title%]}</span></a>
	<div class="navListContent hide">
		{[%include file="../wide_process.tpl" item=$sub_data.data%]}
	</div>
</li>
