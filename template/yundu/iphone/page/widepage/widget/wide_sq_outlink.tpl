{[%if $res.data.outLink%]}
<div class="hCard">
{[%foreach from=$res.data.outLink item=dataItemOutLink%]}
{[%foreach from=$dataItemOutLink.data item=dataItem%]}
        {[%if !empty($dataItem)%]}
                {[%include file="./wide_process.tpl" item=$dataItem %]}
        {[%/if%]}
{[%/foreach%]}
{[%/foreach%]}
</div>
{[%/if%]}
