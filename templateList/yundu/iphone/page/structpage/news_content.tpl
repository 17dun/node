{[%include file="../common/mypos.tpl" item=$res.data.pageData.mypos%]}
<div class="yi-news">
	<div class="yi-content">
		<div class="yi-content-header">
			<h2 class="yi-content-title">{[%$res.data.pageData.title%]}</h2>
			<div class="yi-content-date">{[%$res.data.pageData.brief%]}</div>
		</div>
		
		<div class="yi-content-text">
			{[%$res.data.pageData.content|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}
		</div>
		
		{[%include file="../common/page_turn.tpl" item=$res.data.pageData.page_turning %]}
	</div>
</div>