{[%include file="../common/mypos.tpl" item=$res.data.pageData.mypos%]}
<style type="text/css">
	/*<![CDATA[*/
	{[%include file="../style/bbs_content_css.tpl"%]}
	{[%include file="../style/bbs_index_css.tpl"%]}
	/*]]>*/
</style>
<div id="wrap">
	<h1 class="bbs-title">{[%$res.data.pageData.title%]}</h1>
	
	<div id="bbs-content">
		{[%foreach name=postlist from=$res.data.pageData.list item=post%]}
		{[%assign var=floor value=$smarty.foreach.postlist.index%]}
		{[%if $floor==0&&false%]}{[%*因无法准确区分出楼主，UI上暂时作统一处理*%]}
		<div id="floor-0" class="floor-first">
			<div class="floor-title">{[%$title%]}</div>
			<div class="floor-header h-box">
				<div class="floor-author">{[%$post.author%]}</div>
				<div class="floor-time">{[%$post.time%]}</div>
			</div>
			<div class="floor-content">
				<div class="floor-content-inner">{[%$post.content|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}</div>
			</div>
		</div>
		{[%else%]}
		<div id="floor-{[%$floor|escape:html%]}" class="floor">
			<div class="floor-footer h-box">
				<div class="floor-author">{[%$post.author%]}</div>
				<div class="floor-time">{[%$post.time%]}</div>
			</div>
			<div class="floor-body">
				<div class="floor-body-inner">
					<div class="floor-content">{[%$post.content|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}</div>
				</div>
				
			</div>
		</div>
		{[%/if%]}
		{[%/foreach%]}
	</div>

	{[%include file="../common/page_turn.tpl" item=$res.data.pageData.page_turning %]}
</div>

