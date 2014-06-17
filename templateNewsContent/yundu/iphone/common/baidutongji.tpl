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
