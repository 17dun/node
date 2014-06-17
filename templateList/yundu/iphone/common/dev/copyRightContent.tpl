{[%if !empty($sub_data)%]}

<ul class="hList saCopyRight">

{[%foreach from=$sub_data.cr item=item %]}
<li class="hListItem">
	<div class="saCopyRightRight  hListTitle">
	    {[%if $item.key neq ""%]}<p>{[%$item.key%]}</p>{[%/if%]}
	    <p><a {[%if !empty($item.link) %]}href="{[%$item.link%]}"{[%/if%]}>{[%$item.text%]}</a></p>
	</div>
</li>
{[%/foreach%]}

{[%if !empty($sub_data.contact)%]}
{[%foreach from=$sub_data.contact item=item %]}
<li class="hListItem">
{[%$item.key%]}:<a 
	{[%if !empty($item.link) %]}href="{[%$item.link%]}"{[%/if%]}>
{[%$item.text%]}
	</a>
</li>
{[%/foreach%]}
{[%/if%]}


{[%if !empty($sub_data.record)%]}
<li class="hListItem saCopyRightRecord">
	{[%foreach from=$sub_data.record item=item%]}
		<a class="hListAttr" {[%if !empty($item.link)%]}href="{[%$item.link%]}" {[%/if%]}>{[%$item.text%]}</a>
	{[%/foreach%]}
</li>
{[%/if%]}

{[%if !empty($sub_data.friendLink)%]}
<li class="hListItem saCopyRightFriendLink noDis">
    {[%include file="tpl/fastLink.soy" sub_data=$sub_data.friendLink%]}
</li>
{[%/if%]}
</ul>
{[%if !empty($sub_data.friendLink)%]}
<div class="yi-load-more">
     <a>查看更多</a>
</div>
{[%/if%]}
{[%/if%]}
