/**TODO remove use tpl/list/inline.soy*/
{[%strip%]}
{[%foreach name=inline_list from=$sub_data item=sub_item%]}

{[%if !empty($sub_item.inlineblock)%]}
<a class="yi-list-name-br" {[%if $sub_item.href neq ""%]}href="?{[%$querySrc|cat:"&"%]}src={[%$sub_item.href|urlencode%]}"{[%/if%]}>
{[%else%]}
<a {[%if $sub_item.href neq ""%]}href="?{[%$querySrc|cat:"&"%]}src={[%$sub_item.href|urlencode%]}"{[%/if%]}>
{[%/if%]}
        {[%if !empty($sub_item.text)%]}
            <span {[%if !empty($sub_item.weak)%]}class="ssInlineWeak"{[%/if%]} >{[%$sub_item.text%]}</span>
        {[%/if%]}
        {[%if !empty($sub_item.src)%]}
             <img data-src="{[%$sub_item.src|regex_replace:"/.{1}tpl_size.{1}/":"w50"%]}" data-width="{[%$sub_item.width%]}" data-height="{[%$sub_item.height%]}" />
        {[%/if%]}
</a>
{[%/foreach%]}
{[%/strip%]}
