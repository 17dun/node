{[%foreach name=cpt_tab from=$res.custom.cpt_tab item=item%]}
    {[%if $item|@count >1%]}
    <div class="yi-tabs-wrap" >
    <div  class="yi-tabs-title">
        {[%foreach name=cpt_tab_sub from=$item item=item_sub%]}
            <div class="yi-tabs-tli ellipsis">{[%$item_sub.title%]}</div>
        {[%/foreach%]}
    </div>
    <div class="yi-tabs">
    {[%foreach name=cpt_tab_svb from=$item item=item_svb%]}
        <div class="yi-tabs-content {[%if $item_svb.title_link%]}yi-hasLink{[%/if%]}">
            {[%foreach name=cpt_tab_scb from=$item_svb.data_value.items item=item_scb%]}
                        {[%include file="./widget/wide_process.tpl" item=$item_scb%]}
            {[%/foreach%]}
            {[%if $item_svb.title_link%]}
            <div class="yi-tonav">
                <a class="yi-morelist" href="{[%$item_svb.title_link%]}">
                    进入频道
                    <span class="yi-morelist1"></span>
                </a>
            </div>
            {[%/if%]}
        </div>
    {[%/foreach%]}
    </div>
    </div>
    {[%elseif $item.0.data_value%]}
    <div class="yi-wrap">
        {[%if $item.0.title%]}
            <h2 class="yi-wrap-title yi-fontcolor">{[%$item.0.title%]}</h2>
        {[%/if%]}
        <div class="yi-wrap-main {[%if $item.0.title_link%]}yi-hasLink{[%/if%]}" >
            {[%foreach name=cpt_tab_scb from=$item.0.data_value.items item=item_scb%]}
                    {[%include file="./widget/wide_process.tpl" item=$item_scb%]}
            {[%/foreach%]}
            {[%if $item.0.title_link%]}
            <div class="yi-tonav">
                <a class="yi-morelist" href="{[%$item.0.title_link%]}">
                    进入频道
                    <span class="yi-morelist1"></span>
                </a>
            </div>
            {[%/if%]}
        </div>
    </div>
    {[%/if%]}
{[%/foreach%]}

