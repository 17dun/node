{[%strip%]}
<div class="yi-table-warp">
    <div class="yi-table-inner">
    <table class="yi-table">
        {[%if $sub_data.th%]}
            <tr class='yi-table-ths'>
                {[%foreach name=w_table_th from=$sub_data.th item=item%]}
                  <th class='yi-table-th' colspan='{[%$item.colspan%]}' rowspan='{[%$item.rowspan%]}'>{[%$item.html|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"|regex_replace:"/(<img\b.*?)(\ssrc=)(.*?\/?>)/gi":'$1 data-src=$3'%]}</th>
                {[%/foreach%]}
            </tr>
        {[%/if%]}
        {[%foreach name=w_table_tr from=$sub_data.tr item=item%]}
            <tr class='yi-table-tds'>
                {[%foreach name=w_table_in from=$item item=sub_item%]}
                <td class='yi-table-td {[%if $sub_item.rowspan%]}yi-table-td-hasrow{[%/if%]} {[%if $sub_item.colspan%]}yi-table-td-hascol{[%/if%]}' colspan='{[%$sub_item.colspan%]}' rowspan='{[%$sub_item.rowspan%]}'>{[%$sub_item.html|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"|regex_replace:"/(<img\b.*?)(\ssrc=)(.*?\/?>)/gi":'$1 data-src=$3'%]}</td>
                {[%/foreach%]}
            </tr>
        {[%/foreach%]}
    </table>
    </div>
</div>
{[%/strip%]}
