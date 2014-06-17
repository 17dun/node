{[%strip%]}
{[%math equation=rand(0,10000) assign=tabRandomId%]}
<div class="hTab hUI" data-role="Tab" data-ss-tabId="ssTabId{[%$tabRandomId%]}">
    <div class="nav-list-wrap">
        <div class="nav-list">
            <ul>
                {[%foreach name=tab_block_item from=$sub_data.items item=item%]}
                    <li class="hTabNavi tap {[%if $item@index eq 0 %]}selected{[%/if%]}" data-action="tabGo" data-ss-tabId="ssTabId{[%$tabRandomId%]}"><a>
                        {[%if $item.data_value.tab_head &&  $item.data_value.tab_head.data_value  && $item.data_value.tab_head.data_value.items%]}
                            {[%if !empty($item.data_value.tab_head.data_value.items) && !empty($item.data_value.tab_head.data_value.items[0])%]}
                                {[%if !empty($item.data_value.tab_head.data_value.items[0].data_value.text)%]}
                                    {[%$item.data_value.tab_head.data_value.items[0].data_value.text|escape:none%]}
                                {[%elseif !empty($item.data_value.tab_head.data_value.items[0].data_value.src)%]}
                                    <p class="saTabTitleImage" data-src="{[%$item.data_value.tab_head.data_value.items[0].data_value.src|regex_replace:"/.{1}tpl_size.{1}/":"w120"%]}">&nbsp;</p>
                                {[%/if%]}
                            {[%/if%]}   
                        {[%else%]}
                            &nbsp;&nbsp;
                        {[%/if%]}
                    </a></li>
                {[%/foreach%]}
            </ul>
        </div>
        <div class="prev" data-action="down" data-tj="tabPreBtn"></div>
        <div class="next" data-action="down" data-tj="tabNextBtn"></div>
    </div>




    <div class="yi-tabs">
        {[%foreach name=tab_body_block_item from=$sub_data.items item=item %]}

        <div class="hTabContent {[%if $item@index eq 0 %]}current{[%/if%]}" data-ss-tabId="ssTabId{[%$tabRandomId%]}" >
            {[%*嵌套在tab 里面的不做注释处理，只对第一层级，非当前显示tab 做处理*%]}
            {[%if $item@index>0 &&$sub_data.isInTab<=1%]}
                <script type="text/lazyRender">
                    {[%inHide("tab",$tabRandomId)%]}
            {[%/if%]}
            {[%if $item.tab_head_options|count > 0 %]}
                   {[%*include file="../../../common/dev/fastLink.tpl" sub_data=$item.tab_head_options*%]}
                    {[%include file="tpl/fastLink.soy" sub_data=$item.tab_head_options%]}
            {[%/if%]}
            {[%if $item.data_value.tab_body%]}
                 {[%include file="./wide_process.tpl" item=$item.data_value.tab_body%]}

                {[%if !empty($item.data_value.tab_head) && $item.data_value.tab_head.data_value && $item.data_value.tab_head.data_value.items && !empty($item.data_value.tab_head.data_value.items[0]) && $item.data_value.tab_head.data_value.items[0].type eq "LINK"%]}
                <div class="yi-tonav">
                    {[%if !empty($item.data_value.tab_head.data_value.items[0].data_value)%]}
                    <a class="yi-morelist" data-tj="tabIntoChannel" {[%if $item.data_value.tab_head.data_value.items[0].data_value.href%]} href="{[%$item.data_value.tab_head.data_value.items[0].data_value.href|escape:url%]}"{[%/if%]}>
                        进入频道
                        <span class="yi-morelist1"></span>
                    </a>
                    {[%/if%]}
                </div>
                {[%/if%]}
           {[%/if%]}
            {[%if $item@index>0 &&$sub_data.isInTab<=1%]}
                    {[%outHide("tab",$tabRandomId)%]}
                </script>
            {[%/if%]}
        </div>

        {[%/foreach%]}
    </div>
</div>


{[%/strip%]}
