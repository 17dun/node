
<!--页面内容-->
{[%if $struct_page_type === 1%]}			{[%*--泛结构化--*%]}
	{[%include file="./page/widepage/wide_page.tpl"%]}
{[%elseif $struct_page_type === 2%]}		{[%*--标注--*%]}
	{[%include file="./page/widepage/wide_sign.tpl"%]}
{[%elseif $struct_page_type === 3%]}		{[%*--九宫格导航--*%]}
	{[%include file="./common/grid_page.tpl"%]}
{[%*---------------以下为结构化页面---------------------*%]}
{[%elseif $struct_page_type === 4%]}		{[%*--索引页--*%]}
	{[%include file="./page/structpage/link_page.tpl"%]}
{[%elseif $struct_page_type === 5%]}		{[%*--新闻页--*%]}
	{[%include file="./page/structpage/news_content.tpl"%]}
{[%elseif $struct_page_type === 6%]}		{[%*--正文页--*%]}
	{[%include file="./page/structpage/text_content.tpl"%]}
{[%elseif $struct_page_type === 7%]}		{[%*--bbs首页--*%]}
	{[%include file="./page/structpage/bbs_index.tpl"%]}
{[%elseif $struct_page_type === 8%]}		{[%*--bbs列表页--*%]}
	{[%include file="./page/structpage/bbs_list.tpl"%]}
{[%elseif $struct_page_type === 9%]}		{[%*--bbs内容页--*%]}
	{[%include file="./page/structpage/bbs_content.tpl"%]}
{[%elseif $struct_page_type === 10%]}		{[%*--novel首页--*%]}
	{[%include file="./page/structpage/novel_index.tpl"%]}
{[%elseif $struct_page_type === 11%]}		{[%*--novel列表页--*%]}
	{[%include file="./page/structpage/novel_list.tpl"%]}
{[%elseif $struct_page_type === 12%]}		{[%*--novel内容页--*%]}
	{[%include file="./page/structpage/novel_content.tpl"%]}
{[%elseif $struct_page_type === 13%]}		{[%*--image页--*%]}
	{[%include file="./page/structpage/image_page.tpl"%]}
{[%elseif $struct_page_type === 14%]}		{[%*--导航标注页面--*%]}
	{[%include file="sitetheme-common/navmanage.tpl"%]}
{[%else%]}
	无页面内容
{[%/if%]}
