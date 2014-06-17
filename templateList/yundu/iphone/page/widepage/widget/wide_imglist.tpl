
{[%strip%]}
<div class="yi-imglist1-wrap  s-clear image-news">
    <ul class="h-list h-list1 {[%$sub_data.className%]} ssImgList" {[%if $sub_data.data|@count>6 %]} style="height:{[%$sub_data.containerHeightSSImgList%]}px" {[%/if%]}>
        {[%foreach name=w_imglist from=$sub_data.data item=item%]}
    	<li class="h-list1-item ssImgItem {[%if $sub_data.data|@count>6 && $smarty.foreach.w_imglist.iteration>4 && ($blockControl == 0 || $blockControl == 1)%]} noDis {[%/if%]}"  data-width="{[%$item.data_value.width%]}" data-height="{[%$item.data_value.height%]}">
        <a  {[%if $item.data_value.href%]}href="?{[%$querySrc|cat:"&"%]}src={[%$item.data_value.href|urlencode%]}"{[%/if%]}>
                    <div wrap="ssImgItem" class="ssImgListImg" data-src="{[%$item.tImgSrc|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}"  style="height:{[%$sub_data.ssImgListItemHeight%]}px;{[%if !empty($sub_data.backgroundSize)%]}background-size:{[%$sub_data.backgroundSize%]};{[%/if%]}"></div>
                {[%if $item.data_value.text%]}
                <span class="img-title hOmit{[%$sub_data.maxTextRowCount%]}">{[%$item.data_value.text|escape:none%]}</span>
                {[%/if%]}
            </a>
    	</li>
        {[%/foreach%]}
    </ul>
    {[%if $sub_data.data|@count>6 && ($blockControl == 0 || $blockControl == 1)%]}
        <div class="hShowMoreItem showMoreImg tap" data-action="down" data-tj="imgListShowMoreBtn"><span>点击加载更多</span></div>
    {[%/if%]}
</div>
{[%/strip%]}
