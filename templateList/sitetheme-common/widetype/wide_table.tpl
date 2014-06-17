{[%strip%]}
<div class="yi-table-warp">
    <div class="yi-table-inner">
    <table  style="width:{[%$sub_data.width%]}px;"  class="yi-table">
        {[%if $sub_data.th%]}
            <tr class='yi-table-ths'>
                {[%foreach name=w_table_th from=$sub_data.th item=item%]}
                  <th style="width:{[%$item.width%]}px;text-align:{[%$item.halign%]};vertical-align:{[%$item.valign%]}" class='yi-table-th' colspan='{[%$item.colspan%]}' rowspan='{[%$item.rowspan%]}'>{[%$item.html%]}</th>
                {[%/foreach%]}
            </tr>
        {[%/if%]}
        {[%foreach name=w_table_tr from=$sub_data.tr item=item%]}
            {[%if $smarty.foreach.w_table_tr.iteration>3%]}
            <tr class='yi-table-tds more'>
                {[%foreach name=w_table_in from=$item item=sub_item%]}
                <td style="width:{[%$sub_item.width%]}px;text-align:{[%$sub_item.halign%]};vertical-align:{[%$sub_item.valign%]}" class='yi-table-td {[%if $sub_item.rowspan%]}yi-table-td-hasrow{[%/if%]} {[%if $sub_item.colspan%]}yi-table-td-hascol{[%/if%]}' colspan='{[%$sub_item.colspan%]}' rowspan='{[%$sub_item.rowspan%]}'>{[%$sub_item.html%]}</td>
                {[%/foreach%]}
            </tr>
            {[%else%]}
            <tr class='yi-table-tds'>
                {[%foreach name=w_table_in from=$item item=sub_item%]}
                <td style="width:{[%$sub_item.width%]}px;font-size:{[%$sub_item.fontsize%]};text-align:{[%$sub_item.halign%]};vertical-align:{[%$sub_item.valign%]}" class='yi-table-td {[%if $sub_item.rowspan%]}yi-table-td-hasrow{[%/if%]} {[%if $sub_item.colspan%]}yi-table-td-hascol{[%/if%]}' colspan='{[%$sub_item.colspan%]}' rowspan='{[%$sub_item.rowspan%]}'>{[%$sub_item.html%]}</td>
                {[%/foreach%]}
            </tr>
            {[%/if%]}
        {[%/foreach%]}
    </table>
    </div>
</div>
{[%/strip%]}
