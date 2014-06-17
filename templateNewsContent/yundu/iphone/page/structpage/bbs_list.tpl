{[%include file="../common/mypos.tpl" item=$res.data.pageData.mypos%]}
<style type="text/css">
	/*<![CDATA[*/
	{[%include file="../style/bbs_content_css.tpl"%]}
	{[%include file="../style/bbs_index_css.tpl"%]}
	/*]]>*/
</style>
<div id="wrap">	
	<div class="container">
		{[%if $res.data.pageData.subforum_list%]}
		<div id="sec1" class="section pull_list_expand">
			<div class="title_info" id="tit1">
				<h2>子板块</h2>
			</div>
			<ul class="pull_list">
				{[%foreach name=subforumlist from=$res.data.pageData.subforum_list item=sub%]}
				<li>
					<div class="list_title">
						{[%$sub.name%]}
						{[%if $sub.info%]}
						<span class="list_title_info">{[%$sub.info%]}</span>
						{[%/if%]}
					</div>
					{[%*
					<div class="owner_info">
						<span class="owner_name">{[%sub.info%]}</span>
					</div>
					*%]}
				</li>
				{[%/foreach%]}
			</ul>
		</div><!-- section end -->
		{[%/if%]}
	
		{[%if $res.data.pageData.stickList%]}
		<div id="sec2" class="section pull_list_expand">
			<div class="title_info" id="tit2">
				<h2>置顶区</h2>
			</div>
			<ul class="pull_list">
				{[%foreach name=stickthreadlist from=$res.data.pageData.stickList item=thread%]}
				<li>
					<div class="list_title">
						{[%$thread.content%]}
					</div>
					<div class="owner_info">
						<span class="owner_name">{[%$thread.author%]}</span>
						{[%if $thread.time%]}<span class="pb_time">{[%$thread.time%]}</span>{[%/if%]}
					</div>
				</li>
				{[%/foreach%]}
			</ul>
		</div><!-- section end -->
		{[%/if%]}
		
		<div id="sec3" class="section pull_list_expand">
			<div class="title_info" id="tit3">
				<h2>帖子区</h2>
			</div>
			<ul class="pull_list">
				{[%foreach name=normalthreadlist from=$res.data.pageData.normalList item=thread%]}
				<li>
					<div class="list_title">
						{[%$thread.content%]}
					</div>
					<div class="owner_info">
						<span class="owner_name">{[%$thread.author%]}</span>
						<span class="pb_time">{[%$thread.time%]}</span>
					</div>
				</li>
				{[%/foreach%]}
			</ul>
		</div><!-- section end -->
	</div><!-- container end -->
	{[%include file="../common/page_turn.tpl" item=$res.data.pageData.page_turning %]}
</div>
