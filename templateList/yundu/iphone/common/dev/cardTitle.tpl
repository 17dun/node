{[%math equation=rand(0,10000) assign=random%]}

<div class="saCardTitle">
	<i class="bdline"></i>
	<a class="cardTitleText">{[%$sub_data.title%]}</a>
        {[%if !empty($data.options)%]}
        <a class="icon options tap" data-js="showMore('#showCardMenu{[%$random%]}');"></a>
        {[%/if%]}
</div>
{[%if !empty($data.options) %]}
<div id="showCardMenu{[%$random%]}">
    {[%include file="../warp_processor.tpl" item=$sub_data.data%]}
</div>
{[%/if%]}
