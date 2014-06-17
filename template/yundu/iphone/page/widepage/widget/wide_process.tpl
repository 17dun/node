{[%if $item.type eq "ATOM"%]}
	{[%if isInHide()%]}
		<div data-tpl-name="tpl/list/atom" data-tpl-data-name="sub_data" data-tpl-data-external-query_src="{[%$querySrc%]}">
	        <!--{[%$item|atom|json_encode%]}-->
	    </div>
	{[%else%]}
		{[%include file="tpl/list/atom.soy" sub_data=$item|atom query_src=$querySrc%]}
	{[%/if%]}
{[%elseif $item.type eq "COLUMN"%]}
	{[%include file="./wide_column.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "COLUMN_TITLE"%]}
	{[%include file="./wide_column_title.tpl" sub_data=$item.data_value|columnTitleModify%]}
{[%elseif $item.type eq "CONTENT_TEXT"%]}
	{[%include file="./wide_content_text.tpl"  sub_data=$item.data_value%]}
{[%elseif $item.type eq "INDEX"%]}
	{[%if $item.style_type eq "SHORT_LINK" && $item.func_type != "MAIN_NAV"%]}
		{[%include file="./wide_index_short.tpl" sub_data=$item.data_value.items%]}
	{[%elseif $item.func_type != "MAIN_NAV"%]}
		{[%if isInHide()%]}
			<div data-tpl-name="tpl/list/index" data-tpl-data-name="sub_data" data-tpl-data-external-query_src="{[%$querySrc%]}">
		        <!--{[%$item|index|json_encode%]}-->
		    </div>
		{[%else%]}
			{[%include file="tpl/list/index.soy" query_src=$querySrc sub_data=$item|index%]}
		{[%/if%]}
	{[%/if%]}
{[%elseif $item.type eq "LINK"%]}
	{[%if isInHide()%]}
		<div data-tpl-name="tpl/list/link" data-tpl-data-name="sub_data">
	        <!--{[%$item.data_value|json_encode%]}-->
	    </div>
	{[%else%]}
		{[%include file="tpl/list/link.soy" sub_data=$item.data_value%]}
	{[%/if%]}
{[%elseif $item.type eq "INLINE"%]}
	{[%if isInHide()%]}
		<div data-tpl-name="tpl/list/inline" data-tpl-data-name="sub_data" data-tpl-data-external-query_src="{[%$querySrc%]}">
	        <!--{[%$item.data_value.items|inline|json_encode%]}-->
	    </div>
	{[%else%]}
		{[%include file="tpl/list/inline.soy" sub_data=$item.data_value.items|inline query_src=$querySrc%]}
	{[%/if%]}
{[%elseif $item.type eq "LIST"%]}
	{[%include file="tpl/list/list.soy" sub_data=$item|list query_src=$querySrc%]}
{[%elseif $item.type eq "MYPOS"%]}
	{[%include file="../../common/mypos.tpl" item=$item.data_value%]}
{[%elseif $item.type eq "NORMAL" || $item.type eq "ADVERTISE" || $item.type eq "FLOAT" || $item.type eq "FORM" %]}
	{[%include file="./wide_normal.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "COPYRIGHT"%]}
	{[%include file="./wide_normal.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "TOP_SEARCH"%]}
	{[%include file="./wide_normal.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "PAGE_TURNING"%]}
	{[%include file="../../common/page_turn.tpl" item=$item.data_value%]}
{[%elseif $item.type eq "TEXT" || $item.type eq "TITLE"%]}
	{[%if $item.func_type eq "TITLE"%]}
		{[%include file="tpl/text_title.soy" sub_data=$item.data_value|textTitle%]}
	{[%else%]}
		{[%include file="tpl/list/text.soy" sub_data=$item.data_value%]}
	{[%/if%]}
{[%elseif $item.type eq "GROUPBOX"%]}
	{[%include file="./wide_groupbox.tpl" sub_data=$item.data_value.items%]}
{[%elseif $item.type eq "TABLE"%]}
	{[%include file="./wide_table.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "IMAGE_LIST"%]}
	{[%if $item.signtype eq "IGNORE_FOCUSPIC"%]}
	{[%elseif $item.signtype eq "IGNORE_BANNER"%]}
	{[%elseif $item.signtype eq "CAROUSEL" || $item.signtype eq "FOCUSPIC"%]}
        {[%include file="tpl/page/lunBo.soy" sub_data=$item.data_value.items|slider query_src=$querySrc has_text=$item.hasText%]}
	{[%elseif $item.signtype eq "PRE_FOCUSPIC" %]}
	    {[%if $item%]}
		    {[%include file="../../../common/dev/focusPIC.tpl" item=$item%]}
		{[%/if%]}
	{[%else%]}
		{[%if isInHide()%]}
		{[%assign var="blockcontrol" value=$item.block_area_control%]}
			<div data-tpl-name="tpl/list/imgList" data-tpl-data-name="sub_data" data-tpl-data-external-query_src="{[%$querySrc%]}" data-tpl-data-external-blockcontrol="{[%$blockcontrol%]}">
		        <!--{[%$item.data_value.items|slider|json_encode%]}-->
		    </div>
		{[%else%]}
			{[%include file="tpl/list/imgList.soy" query_src=$querySrc sub_data=$item.data_value.items|slider blockcontrol=$item.block_area_control%]}
		{[%/if%]}
	{[%/if%]}
{[%elseif $item.type eq "AUTHOR"%]}
	{[%include file="./wide_author.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "NORMAL_ITEM"%]}
	{[%if isInHide()%]}
		<div data-tpl-name="tpl/list/normalItem" data-tpl-data-name="sub_data" data-tpl-data-external-query_src="{[%$querySrc%]}">
	        <!--{[%$item|json_encode%]}-->
	    </div>
	{[%else%]}
		{[%include file="tpl/list/normalItem.soy" sub_data=$item query_src=$querySrc%]}
	{[%/if%]}
{[%elseif $item.type eq "IMAGE_ATOM"%]}
	{[%if isInHide()%]}
		<div data-tpl-name="tpl/list/normalItem" data-tpl-data-name="sub_data" data-tpl-data-external-query_src="{[%$querySrc%]}" data-tpl-data-external-parenttype="{[%$parentType%]}">
	        <!--{[%$item|normalItem|json_encode%]}-->
	    </div>
	{[%else%]}
		{[%include file="tpl/list/normalItem.soy" sub_data=$item|normalItem parenttype=$parentType query_src=$querySrc%]}
	{[%/if%]}
{[%elseif $item.type eq "VIDEO"%]}
    {[%include file="./wide_video.tpl" sub_data=$item%]}
{[%elseif $item.type eq "SIGN_AREA"%]}
    {[%include file="./wide_signarea.tpl" sub_data=$item%]}
{[%elseif $item.type eq "PRE_TAB"%]}
    {[%foreach from=$item.items item=subitem%]}
        {[%include file="./wide_process.tpl" item=$subitem%]}
    {[%/foreach%]}
{[%elseif $item.type eq "TAB"%]}
    {[%*处理tab options 导航处理*%]}
    {[%include file="./wide_tab.tpl" sub_data=$item.data_value|tabOptions%]}
{[%elseif $item.type eq "TAB_CONTENT_ITEM"%]}
    {[%include file="./wide_tab_content.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "SEARCH_NEW" || $item.type eq "TOP_SEARCH_NEW" %]}
    {[%include file="tpl/navSearch.soy" item= $item|topSearchParse%]}
{[%elseif $item.type eq "TABLELIST" %]}
	{[%if isInHide()%]}
		<div data-tpl-name="tpl/list/list" data-tpl-data-name="sub_data">
	        <!--{[%$item|list|json_encode%]}-->
	    </div>
	{[%else%]}
		{[%include file="tpl/list/list.soy" sub_data=$item|list%]}
	{[%/if%]}
{[%elseif $item.type eq "TABLE_LIST_ITEM"%]}
	{[%if isInHide()%]}
		<div data-tpl-name="tpl/tableList/item" data-tpl-data-name="item">
	        <!--{[%$item|json_encode%]}-->
	    </div>
	{[%else%]}
		{[%include file="tpl/tableList/item.soy" item=$item%]}
	{[%/if%]}
{[%elseif $item.type eq "POPCOMMENTLIST"%]}
    {[%include file="./wide_popcommentlist.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "COMMENT_ITEM"%]}
    {[%include file="./wide_comment_item.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "RESOURCE"%]}
    {[%include file="./wide_resource.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "VIDEO_BD_RESOURCE"%]}
    {[%include file="./wide_video_bd.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "RESOURCE_ENTRY"%]}
	{[%include file="./wide_video_entry.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "PICTURN"%]}
	{[%include file="./wide_picturn.tpl" sub_data=$item.data_value%]}
{[%elseif $item.type eq "DIMIMG"%]}
	{[%include file="tpl/dimimg.soy" sub_data=$item.data_value|dimimg%]}
{[%/if%]}
