{[%include file="../common/mypos.tpl" item=$res.data.pageData.mypos%]}
<style type="text/css">
	/*<![CDATA[*/
	{[%include file="../style/float_menu_css.tpl"%]}
	{[%include file="../style/xinwen_css.tpl"%]}
	/*]]>*/
</style>
<div id="wrap">
	<div id="news-wrap">
		<div id="news-body">
			<div id="news-title">{[%$res.data.pageData.title%]}</div>
			<div id="news-info">{[%$res.data.pageData.summary%]}</div>
			<div id="news-content" style="float:none">
			{[%foreach name=img_list from=$res.data.pageData.imgList item=item%]}
				<img src="{[%$item|regex_replace:"/.{1}tpl_size.{1}/":"b640_640"%]}" />
			{[%/foreach%]}
			</div>
			{[%include file="../common/page_turn.tpl" item=$res.data.pageData.page_turning %]}
		</div>
	</div>
</div>
