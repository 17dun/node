{[%include file="../common/mypos.tpl" item=$res.data.pageData.mypos%]}
<style type="text/css">
	/*<![CDATA[*/
	{[%include file="../style/bbs_content_css.tpl"%]}
	{[%include file="../style/bbs_index_css.tpl"%]}
	/*]]>*/
</style>
<div id="wrap">
	<h1 class="bbs-title">{[%$res.data.pageData.siteName%]}</h1>
	
	<div class="container">
		{[%foreach name=itemlist from=$res.data.pageData.categoryList item=item%]}
		<div id="sec{[%$smarty.foreach.itemlist.iteration|escape:html%]}" class="section pull_list_expand">
			<div class="title_info" id="tit{[%$smarty.foreach.itemlist.iteration|escape:html%]}">
				<h2 >{[%$item.title|strip_tags%]}</h2>
			</div>
			<ul class="pull_list">
				{[%foreach name=sub_item from=$item.list item=sub_item%]}
				<li>
					<div class="list_title">
						<div style="font-weight:bold;">
							<a href="./?src={[%$sub_item.href%]}">{[%$sub_item.text%]}</a>
						</div>
						{[%if $item.info[$smarty.foreach.sub_item.index]%]}
						<span class="list_title_info">{[%$item.info[$smarty.foreach.sub_item.index]%]}</span>
						{[%/if%]}
					</div>
				</li>
				{[%/foreach%]}
			</ul>
		</div><!-- section end -->
		{[%/foreach%]}
	</div><!-- container end -->

</div>
