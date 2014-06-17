{[%strip%]}
<div class="ssListContainer">
 {[%assign var=isListInHide value=false%]}
 {[%math equation=rand(0,10000) assign=listRandomId%]}
{[%if isInHide()%]}
    {[%assign var=isListInHide value=true%]}
{[%/if%]}
{[%if $sub_data.type == 'INDEXLIST'%]}   
    {[%if !empty($sub_data['data_value']['items'])%]}
        <ul class="yi-list-ul hList{[%if $sub_data['split'] == 1%]} yi-split-ul{[%/if%]}">
        {[%foreach name=indexlist from=$sub_data.data_value.items item=item%]}
            {[%if $item['type'] && $item['type'] != "TEXT" && !empty($item['isNoDis'])  && $sub_data.isInHide != true && $isListInHide == false%]}
                {[%inHide($sub_data,"indexList",$listRandomId)%]}
            {[%/if%]}
            {[%if $item['type'] == 'ATOM'%]}
            <li class="yi-list-li  yi-list-atom hBoxH hListItem {[%if !empty($item['isNoDis'])%]}{[%$item['isNoDis']%]}{[%/if%]}" data-type="img-text-list">
                {[%if $sub_data.isInHide%]}
                    <div data-tpl-name="tpl/list/atom" data-tpl-data-name="sub_data" data-tpl-data-external-query_src="{[%$querySrc%]}">
                        <!--{[%$item|atom|json_encode%]}-->
                    </div>
                {[%else%]}
                    {[%include file="tpl/list/atom.soy" sub_data=$item|atom query_src=$querySrc%]}
                {[%/if%]}
            </li>
            {[%elseif $item['type'] == 'LINK'%]}
            <li class="yi-list-li yi-list-link hListItem {[%if !empty($item['isNoDis'])%]}{[%$item['isNoDis']%]}{[%/if%]} {[%if $sub_data['split'] == 1 && $item['index'] % 2 ==0%]}yi-split-lieven{[%else%]}yi-split-liodd{[%/if%]}" data-type="text-list">
                <a class="yi-list-name yi-hover" href="?{[%$querySrc|cat:"&"%]}src={[%$item['data_value']['href']|urlencode%]}">
                    {[%if $sub_data.isInHide%]}
                        <div data-tpl-name="tpl/list/link" data-tpl-data-name="sub_data">
                            <!--{[%$item.data_value|json_encode%]}-->
                        </div>
                    {[%else%]}
                        {[%include file="tpl/list/link.soy" sub_data=$item.data_value%]}
                    {[%/if%]}
                </a>
            </li>
            {[%elseif $item['type'] == 'INLINE'%]}
            <li class="yi-list-li yi-list-inline hListItem {[%if !empty($item['isNoDis'])%]}{[%$item['isNoDis']%]}{[%/if%]} {[%if $sub_data['split'] == 1 && $item['index'] % 2 ==0%]}yi-split-lieven{[%else%]}yi-split-liodd{[%/if%]}" data-type="text-list">
                <div class="yi-list-name {[%if $item['align_right'] != null%]}ssInLineAlignRight{[%/if%]}">
                    {[%if $sub_data.isInHide%]}
                        <div data-tpl-name="tpl/list/inline" data-tpl-data-name="sub_data" data-tpl-data-external-query_src="{[%$querySrc%]}">
                            <!--{[%$item.data_value.items|inline|json_encode%]}-->
                        </div>
                    {[%else%]}
                        {[%include file="tpl/list/inline.soy" sub_data=$item.data_value.items|inline query_src=$querySrc%]}
                    {[%/if%]}
                </div>
            </li>
            {[%elseif $item['type'] == 'TEXT'%]}
            <li class="yi-list-li yi-list-inline hListItem {[%if $sub_data['split'] == 1 && !$item@first && !$item@last%]}{[%if $item['index'] % 2 ==0%]}yi-split-lieven{[%else%]}yi-split-liodd{[%/if%]}{[%/if%]} {[%if $sub_data['split'] == 1%]} yi-split-text{[%/if%]}" data-type="text-list">
                {[%include file="./wide_process.tpl" item=$item%]}
            </li>
             {[%else%]}
                未知列表类型
            {[%/if%]}
            {[%if $sub_data.isInHide == true && $item@last && $isListInHide == false%]}
                {[%outHide($sub_data,"indexList",$listRandomId)%]}
            {[%/if%]}
        {[%/foreach%]}
        </ul>
    {[%/if%]}
    {[%if $sub_data.items|count > $sub_data.showCount+4 && $sub_data.showCount >0 && $sub_data.split != 1%]}
       <div class="hShowMoreItem tap" data-action="showMoreListItem" {[%if $sub_data['showConfig'] %]}data-showConfig="{[%$sub_data['showConfig']%]}"{[%/if%]}><span>点击加载更多</span></div>
    {[%/if%]}
{[%else%]} 
    <ul class="yi-list-ul yi-listdata hList {[%if $styleType == "HORIZONTAL"%]}ssListH{[%/if%]}">
    {[%foreach name=list_list from=$sub_data.items item=sub_item %]}
        {[%if $sub_data.showCount >0 && $sub_item@index>= $sub_data.showCount && $sub_data.items|count > $sub_data.showCount+4 && $sub_data.isInHide != true && $isListInHide == false %]}
            {[%inHide($sub_data,"list",$listRandomId)%]}
        {[%/if%]}
        <li class="yi-list-li hListItem {[%if $sub_data.showCount >0 && $sub_item@index>= $sub_data.showCount && $sub_data.items|count > $sub_data.showCount+4 %]} noDis {[%/if%]}{[%if $styleType == "HORIZONTAL"%]}hBoxV{[%else%]}hBoxH{[%/if%]}" data-type="img-text-list">
        	{[%include file="./wide_process.tpl" item=$sub_item parentType=$sub_data.type%]}
        </li>
        {[%if $sub_data.isInHide == true && $sub_item@last && $isListInHide == false %]}
            {[%outHide($sub_data,"list",$listRandomId)%]}
        {[%/if%]}
    {[%/foreach%]}
    </ul>
    {[%if $sub_data.items|count > $sub_data.showCount+4 && $sub_data.showCount >0 %]}
       <div class="hShowMoreItem tap" data-action="showMoreListItem" {[%if $sub_data.showConfig %]}data-showConfig="{[%$sub_data.showConfig%]}"{[%/if%]}><span>点击加载更多</span></div>
    {[%/if%]}
{[%/if%]}
</div>
{[%/strip%]}
