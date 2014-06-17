{[%foreach name=column_list from=$res.data.pageData.columnList item=item%]}

<div class="yi-wrap">

{[%if $item.tabs.0.title%]}

<h2 class="yi-wrap-title yi-title-text yi-bgcolor ellipsis" data-bgopacity="0.15">{[%$item.tabs.0.title%]}</h2>

{[%/if%]}

<ul class="yi-list-ul yi-listdata">
{[%foreach name=column_list_item from=$item.tabs.0.textLinks item=sub_item%]}


{[%if $sub_item.image%]}
<li class="yi-list-li yi-list-atom">
<div class="yi-list-imgwrap">
    <a href="./?src={[%$sub_item.url%]}">
        <img class="yi-list-img" src="{[%$sub_item.image|regex_replace:"/.{1}tpl_size.{1}/":"b150&quality=100"%]}" />
    </a>
</div>


<dl class="yi-list-dl">

    <dt class="yi-list-name">
        <a href="./?src={[%$sub_item.url%]}">{[%$sub_item.name%]}</a>
    </dt>
    <dd class="yi-list-jj">{[%$sub_item.des%]}</dd>

</dl>
{[%else%]}

<li class="yi-list-li yi-list-link">


<dl class="yi-list-dl">

    <dt class="yi-list-name">
        <a href="./?src={[%$sub_item.url%]}">{[%$sub_item.name|escape:'html'%]}</a>
    </dt>
    <dd class="yi-list-jj">{[%$sub_item.des|escape:'html'%]}</dd>

</dl>

{[%/if%]}

</li>
{[%/foreach%]}
</ul>
</div>

{[%/foreach%]}
