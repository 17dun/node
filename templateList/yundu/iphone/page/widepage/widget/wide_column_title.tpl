{[%strip%]}
{[%if $sub_data.items[0].data_value.text%]}
        {[%if $sub_data.items[0].data_value.text%]}
            <div class="hCardTop">
                <div class="saCardTitle">
                    <i class="bdline"></i>
                    <a  class="cardTitleText" {[%if !empty($sub_data.items[0].data_value.href)%]}href="?{[%$querySrc|cat:"&"%]}src={[%$sub_data.items[0].data_value.href|escape:'url'|urlencode%]}&tj=column_title"{[%/if%]} >{[%$sub_data.items[0].data_value.text%]}
                    </a>
                   {[%math equation=rand(0,10000) assign=random%]} 
					{[%if count($sub_data.items)>1%]}
                    <a class="icon options tap" data-js="showMore('#showMoreCard{[%$random%]}');" data-tj="showMoreCard"></a>
                    {[%/if%]}
                </div>
        {[%else%]}
            {[%*include file="./wide_prcessor.tpl" item=$sub_data.data*%]}
        {[%/if%]}
    </div>
    {[%if count($sub_data.items)>1%]}
        <div class="noDis" id="showMoreCard{[%$random%]}">
            {[%*include file="tpl/fastLink.soy" sub_data=$sub_data.items|columnTitleFastLink*%]}
            <div data-tpl-name="tpl/fastLink" data-tpl-data-name="sub_data">
                <!--{[%$sub_data.items|columnTitleFastLink|json_encode%]}-->
            </div>
        </div>
        {[%*
                <div class="saFastLink noDis" >
                    {[%foreach name=list from=$sub_data.items item=item key=index%]}
                        {[%if !$smarty.foreach.list.first%]}
			    {[%if $index%3==1%]}
				<div class="saFastLinkRow">
			    {[%/if%]}
			           {[%if !empty($item.data_value.href)%]}
			           <a data-tj="saColumnTitleMoreLink" href="{[%$item.data_value.href%]}"
                            {[%if empty($item.data_value.text) && !empty($item.data_value.src) %]}data-src="{[%$item.data_value.src|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}"{[%/if%]} >
                                                    {[%if !empty($item.data_value.text)%]}{[%$item.data_value.text%]}{[%else%]}&nbsp;{[%/if%]}
                       </a>
                       {[%/if%]}
			    {[%if $index%3==0 || $index == count($sub_data.items)-1 %]}
                                </div>
                            {[%/if%]}
				
                        {[%/if%]}
                    {[%/foreach%]}
                </div>
        *%]}
    {[%/if%]}

{[%elseif !empty($sub_data.items[0].data_value.src)%]}
<h2 class="yi-wrap-imgtitle">
    <img data-src="{[%$sub_data.items[0].data_value.src|regex_replace:'/@tpl_size@/':'l400'%]}"/>
</h2>
{[%/if%]}
{[%/strip%]}
