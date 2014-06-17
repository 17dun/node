{[%strip%]}
	{[%*include file="tpl/footer.soy" sub_data=$sub_data*%]}
	{[%if $res.data.page_type == 'PAGE_TYPE_NEWS_CONTENT'%]}
    <div id="visitOld" data-tj="visitOld">访问旧版</div>
    {[%/if%]}
    <div data-tpl-name="tpl/footer" data-tpl-data-name="sub_data">
        <!--{[%$sub_data|json_encode%]}-->
    </div>
{[%/strip%]}
