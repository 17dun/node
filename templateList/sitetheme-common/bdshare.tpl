{[%if $res.data.page_type=="PAGE_TYPE_NEWS_CONTENT" || $res.data.page_type=="PAGE_TYPE_TEXT" || $res.data.pageData.pageType=="PAGE_TYPE_NEWS_CONTENT" ||  $res.data.pageData.pageType=="PAGE_TYPE_TEXT"%]}
<div class="yi-bdshare s-clear">
已分享<i>({[%math equation=rand(200,1000)%]}次)</i> <b class="yi-bdshare-button">分享给好友:</b>
</div>
{[%/if%]}