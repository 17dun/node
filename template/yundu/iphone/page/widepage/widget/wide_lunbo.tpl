{[%*TODO 删除这个模板，放弃使用 使用 tpl/page/lunBo.soy *%]}
{[%strip%]}
<div class="hSlider hUI sSlider slider3 " data-role="Slider3">
    <div class="hSliderView h3D {[%$sub_data.className%]}">
        <div class="hSliderBelt">
        {[%foreach $sub_data.data as $item%]}
             <div class="ssLunBoItem">
             <div wrap="ssLunBoItem" class="ssImgItem tap" data-width="{[%$item.data_value.width%]}" data-height="{[%$item.data_value.height%]}"  style="{[%if !empty($sub_data.ssLunBoItemHeight)%]}height:{[%$sub_data.ssLunBoItemHeight%]}px;{[%else%]}background-size:contain!important;{[%/if%]}{[%if !empty($sub_data.backgroundSize)%]}background-size:{[%$sub_data.backgroundSize%]};{[%/if%]}"  {[%if $item.data_value.href%]}data-href="?{[%$querySrc|cat:"&"%]}src={[%$item.data_value.href|urlencode%]}"{[%/if%]}  {[%if $item@index < 4 %]}data-src{[%else%]}data-srcd{[%/if%]}="{[%$item.data_value.src|regex_replace:"/.{1}tpl_size.{1}/":"w640"%]}" data-noDel="true">

             </div>
             <p class="sSliderItemTitle hOmit2 ssImgItemTitle">{[%$item.data_value.text%]}</p>
             </div>
         {[%/foreach%]}
         </div>
    </div>
    <div class="sliderCtrl">
      <div class="sliderPrev tap" data-action="sliderPrev"></div>
      <div class="sliderNum"><span>1</span> / 1</div>
      <div class="sliderNext tap" data-action="sliderNext"></div>
    </div>
</div>
{[%/strip%]}
