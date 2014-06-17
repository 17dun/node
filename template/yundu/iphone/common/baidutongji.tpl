{[%if $jzFlag%]}
  {[%if $jzInfo.jscode.head%]}
    {[%$jzInfo.jscode.head%]}
  {[%elseif $jzInfo.jscode.foot%]}
    {[%$jzInfo.jscode.foot%]}
  {[%elseif $jzInfo.jscode%]}
    {[%$jzInfo.jscode%]}
  {[%/if%]}
  
  <script type="text/javascript">
  var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
  document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F971ccd7aa409b103da57b2ae6f23890a' type='text/javascript'%3E%3C/script%3E"));
  </script>

  <script>
  window.ConversionShareData = {
      "appid":{[%$appid|escape:javascript%]},
      "hmSign":'{[%$jzInfo.hmsign|escape:javascript%]}'
  }
  </script>
  <script type="text/javascript" src="http://page.baidu.com/conversion_js.php?sid={[%$statSiteId%]}"></script>
{[%else%]}
  {[%if $res.data.pvCount%10 == 0 || $sample == "tj"%]}
  <script class="baidutongji" type="text/javascript">
  var _hmt = _hmt || [];
  function _baidTongJiLoadScript() {
    var hm = document.createElement("script");
    hm.src = "//hm.baidu.com/hm.js?4f5f078d48fbdd41799e3238b92d23eb";
    var s = document.getElementsByTagName("script")[0]; 
    s.parentNode.insertBefore(hm, s);
  }
  window.addEventListener("load",function(){
      setTimeout(function(){
          _baidTongJiLoadScript();
      },1);
  });
  {[%if $isSearchResult%]}
  _hmt.push(['_setCustomVar', 4, "isSearch", "{[%$isSearchResult%]}", 3]);
  window.isSearchResultPage=true;
  {[%/if%]}
  </script>
  {[%/if%]}
{[%/if%]}