{[%strip%]}
{[%if $parentType eq "GROUPBOX" %]}
<ul class="yi-list-ul yi-listdata hList">
<li class="yi-list-li hListItem hBoxH">
{[%/if%]}


<div class="hListContent hFlex" {[%if $sub_data.hListContentHeight %]}style="height:{[%$sub_data.hListContentHeight%]}px;"{[%/if%]} >
<div class="hListTitle hOmit2 ">
{[%foreach name=normal_list_title from=$sub_data.ITEM_TITLE item=item%]}
   <p class="{[%if $item.type eq "INLINE"%]} ssListItemInLine {[%/if%]}">
	{[%include file="./wide_process.tpl" item=$item%]}
   </p>
{[%/foreach%]}
</div>

{[%if $sub_data.ITEM_UNDERLINE%]}
   <div class="hListAttr1 hOmit2 ssListItemUnderLine">
      {[%foreach from=$sub_data.ITEM_UNDERLINE item=item%]}
            <p class="{[%if $item.type eq "INLINE"%]} ssListItemInLine {[%/if%]}">
            {[%foreach from=$item.data_value.items item=item_sub%]}

                    {[%if !empty($item_sub.href)%]}<a  href="{[%$item_sub.href%]}"> {[%/if%]}
                       {[%if !empty($item_sub.text)%]}
                          <span>{[%$item_sub.text%]}</span>
                       {[%/if%]}
                    {[%if !empty($item_sub.src)%]}
                        <img data-src="{[%$item_sub.src|regex_replace:"/.{1}tpl_size.{1}/":"w100"%]}" data-width="{[%$item_sub.width%]}" data-height="{[%$item_sub.height%]}" style="min-width:{[%$item_sub.width%]}px;min-height:{[%$item_sub.height%]}px;" />
                    {[%/if%]}
                   {[%if !empty($item_sub.href)%]} </a>  {[%/if%]}


             {[%/foreach%]}
             </p>
      {[%/foreach%]}
   </div>
 {[%/if%]}

{[%if $sub_data.ITEM_CONTENT%]}
<div class="hListAttr hOmit2">
{[%foreach name=normal_list_content from=$sub_data.ITEM_CONTENT item=item%]}
    <p class="{[%if $item.type eq "INLINE"%]} ssListItemInLine {[%/if%]}">
	{[%include file="./wide_process.tpl" item=$item%]}
	</p>
{[%/foreach%]}
</div>
{[%/if%]}


{[%if $sub_data.ITEM_LASTLINE%]}
   <div class="hListAttr1 hOmit2">
     {[%foreach from=$sub_data.ITEM_LASTLINE item=item%]}
         <p class="{[%if $item.type eq "INLINE"%]} ssListItemInLine {[%/if%]}">
          {[%foreach from=$item.data_value.items item=item_sub%]}
             {[%if !empty($item_sub.href)%]}<a  href="{[%$item_sub.href%]}">  {[%/if%]}
                  {[%if !empty($item_sub.text)%]}
                    <span> {[%$item_sub.text%]} </span>
                  {[%/if%]}
                  {[%if !empty($item_sub.src)%]}
                     <img data-src="{[%$item_sub.src|regex_replace:"/.{1}tpl_size.{1}/":"w100"%]}" data-width="{[%$item_sub.width%]}" data-height="{[%$item_sub.height%]}" style="min-width:{[%$item_sub.width%]}px;min-height:{[%$item_sub.height%]}px;" />
                   {[%/if%]}
              {[%if !empty($item_sub.href)%]} </a> {[%/if%]}

          {[%/foreach%]}
          </p>
     {[%/foreach%]}
 </div>
{[%/if%]}

</div>

{[%if $sub_data.ITEM_IMG && getImageRealHight($sub_data.ITEM_IMG,78)%]}
    <a style="{[%if $sub_data.ITEM_IMG.showHeight%]}height:{[% $sub_data.ITEM_IMG.showHeight%]}px;{[%if $sub_data.ITEM_IMG.showHeight>98%]}background-size:contain!important;{[%/if%]}{[%/if%]}{[%if $sub_data.ITEM_IMG.resizeMinHeight==true%]}min-height:20px;{[%/if%]}" class="hListImg {[%$sub_data.ITEM_IMG.className%]}" {[%if $sub_data.ITEM_IMG.img_href%]}href="?{[%$querySrc|cat:"&"%]}src={[%$sub_data.ITEM_IMG.img_href|urlencode%]}"{[%/if%]} data-src="{[%$sub_data.ITEM_IMG.src|regex_replace:"/.{1}tpl_size.{1}/":"w156"%]}" data-height="{[%$sub_data.ITEM_IMG.height%]}" data-width="{[%$sub_data.ITEM_IMG.width%]}" >
	</a>
{[%/if%]}

{[%if $parentType eq "GROUPBOX" %]}
</li>
</ul>
{[%/if%]}
{[%/strip%]}
