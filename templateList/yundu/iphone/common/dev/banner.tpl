{[%if !empty($BANNER)%]}
{[%strip%]}
    {[%if $BANNER.data_value.items|count > 0 %]}
        {[%if !empty($BANNER.data_value.items[0].data_value.href)%]}
            <div class="singleBanner tap" data-href="?{[%$querySrc|cat:"&"%]}src={[%$BANNER.data_value.items[0].data_value.href|urlencode%]}">
        {[%else%]}
            <div class="singleBanner" >
        {[%/if%]}
            <div id="singleBannerImageContainer" class="bannerImage {[%if !empty($BANNER.data_value.items[0].noSize) %]}noSize{[%/if%]}" style="background-image:url({[%$BANNER.data_value.items[0].data_value.src|regex_replace:"/.{1}tpl_size.{1}/":"w640"%]});" data-width="{[%$BANNER.data_value.items[0].data_value.width%]}" data-height="{[%$BANNER.data_value.items[0].data_value.height%]}">
                 
            </div>
            {[%if empty($BANNER.data_value.items[0].noSize) %]}
            <script type="text/javascript">
                function ssInitBannerSizeFun(){
                  var bannerKWidth = {[%$BANNER.data_value.items[0].data_value.width%]};
                  var bannerKHeight = {[%$BANNER.data_value.items[0].data_value.height%]};
                  var bannerContainer = document.getElementById("singleBannerImageContainer");
                  if(bannerContainer == null){
                        return;
                   }
                  if(bannerKWidth > 0 && bannerKHeight >0){
                       var bili = bannerKWidth/bannerKHeight;
                       var bannerParent = bannerContainer.parentNode;
                       var imageHeight = bannerParent.offsetWidth/bili;
                       if(imageHeight < 30){
                           if(bannerParent != null && !bannerParent.classList.contains("noDis")){
                               /*bannerParent.parentNode.removeChild(bannerParent);*/
                               bannerContainer.classList.add("noDis");
                           }
                       }else if(imageHeight > 30 && imageHeight < 160){
                           bannerContainer.classList.remove("noDis");
                           bannerContainer.style.height = imageHeight + "px";
                           if(bannerContainer.classList.contains("noSize"))
                               bannerContainer.classList.remove("noSize");
                       }else if(imageHeight >= 160){
                           bannerContainer.style.height = 160 + "px";
                           bannerContainer.classList.remove("noDis");
                           if(!bannerContainer.classList.contains("noSize"))
                                bannerContainer.classList.add("noSize");
                       }else{
                             bannerContainer.classList.remove("noDis");
                             if(!bannerContainer.classList.contains("noSize"))
                                 bannerContainer.classList.add("noSize");

                       }
                  }
                };
                ssInitBannerSizeFun();
            </script>
            {[%/if%]}
            {[%if !empty($BANNER.data_value.items[0].data_value.text)%]}
            <div class="singleBannerText hOmit">{[%$BANNER.data_value.items[0].data_value.text%]}</div>
            {[%/if%]}

        </div>
    {[%/if%]}
{[%/strip%]}
{[%/if%]}

{[%if !empty($FOCUSPIC)%]}
{[%include file="./focusPIC.tpl" item=$FOCUSPIC showFirstImg=true %]}
{[%/if%]}
