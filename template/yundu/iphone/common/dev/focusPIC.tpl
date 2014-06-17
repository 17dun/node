{[%strip%]}
    {[%math equation=rand(0,10000) assign=fPICRandom%]}
    <div class="hSlider hUI focusPic {[%if $item.hasText == 0%]}noTitle{[%/if%]}" data-role="Slider4" id="itemSliderContainerID_{[%$fPICRandom%]}" data-item-width="{[%$item.data_value.itemWidth%]}" data-item-height="{[%$item.data_value.itemHeight%]}">
        <div class="hSliderView  h3D">
            <div class="hSliderBelt">
            {[%foreach name=focuspic from=$item.data_value.items item=item%]}
                <div class="hSliderItem tap {[%$item.no_zoom%]}" data-href="?{[%$querySrc|cat:"&"%]}src={[%$item.data_value.href|urlencode%]}" {[%if $item@index == 0 && $showFirstImg %]}style="background-image:url({[%$item.data_value.src|regex_replace:"/.{1}tpl_size.{1}/":"w640"%]});"{[%else%]}data-src="{[%$item.data_value.src|regex_replace:"/.{1}tpl_size.{1}/":"w640"%]}"{[%/if%]} data-title="{[%$item.data_value.text%]}" data-noDel="true">
                </div>
            {[%/foreach%]}
            </div>

        </div>
        <div class="sliderNumIndex">
             <i class="indexItem"></i>
        </div>
        <div class="ssFocusPicTitle">
            <div class="sliderInfo hOmit"></div>
        </div>
    </div>
    <script type="text/javascript">
        (function(){
            var itemHeight = "{[%$item.data_value.itemHeight%]}";
            var itemWidth = "{[%$item.data_value.itemWidth%]}";
            var focusPic = document.getElementById("itemSliderContainerID_{[%$fPICRandom%]}");
            var  hSliderBelt = focusPic.querySelector(".hSliderBelt");
            var hSliderBeltWidth = hSliderBelt.offsetWidth;
            var maxHeight = parseInt(getComputedStyle(hSliderBelt).maxHeight);
            /*var maxHeight = hSliderBeltWidth*5/3;
             hSliderBelt.style.maxHeight =  maxHeight+"px";*/
            itemHeight = parseInt(itemHeight);
            itemWidth = parseInt(itemWidth);
            if(itemWidth > 0 && itemHeight >0 ){
                var hSliderBeltHeight = (parseInt(itemHeight)/parseInt(itemWidth))*hSliderBeltWidth;
                if(hSliderBeltHeight >= maxHeight){
                    hSliderBeltHeight = maxHeight;
                }
                hSliderBelt.style.height =  hSliderBeltHeight+"px";
            }
        })();
    </script>
{[%/strip%]}