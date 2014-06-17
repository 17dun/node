{[%*广告管家物料*%]}
<script type="text/javascript">
(function($) {
    var front = Du.front;
    var createAds = function(){
        var textAds = function(obj){
            return "<div class='adv-text'><a style='display: block;color:#007cbc;line-height: 23px;' href='"+ obj.clickUrl+ "' target='_blank'>"+ obj.text+ "</a></div>";
        };
        var imgAds = function(obj){
            return "<div class='adv-image'><a style='display: block;color:#007cbc;line-height: 23px;' href='"+ obj.clickUrl+ "'><img style='max-width:100%;max-height:98px' src='" + obj.src +"'></a></div>";
        };
        var headerAds = "", footerAds="";
        function callback(data){
			try{
				if(!data) return;
				var arr = data.replace(/BAIDU_CLB_M_SETJSONADSLOT \(|\n| /mg,"").replace(/\);/mg,",");
				arr = JSON.parse("["+arr.slice(0,-1)+"]");
				$.each(arr, function(i, item){
					for(name in item){
						var obj = item[name]["_html"];
						if(!obj ) continue;
						if(i > 1){
							footerAds += obj.type == "image" ? imgAds(obj) : textAds(obj);
						}else{
							headerAds += obj.type == "image" ? imgAds(obj) : textAds(obj);
						}
					}
				});
				
				headerAds && $("<div class='yi-wrap yi-ads'></div>").html(headerAds).insertAfter($('.yi-nav-wrap'));
				
				footerAds && $("<div class='yi-wrap  yi-ads'></div>").html(footerAds).insertBefore($('.yi-footer'));
			}catch(e){
				console.log && console.log(e);
			}
        };
        var config = "screenh="+window.screen.height+"&screenw="+window.screen.width+"&pageh="+window.innerHeight+"&pagew="+window.innerWidth;
        $.getJSON("/app/adv?appid="+front.appid+"&userid="+front.userId+"&"+config,callback);
        
    };
    if(parseInt(front.ucid) > 0 &&  $("body").hasClass('WIDE_STRUCT')){
        createAds();
    }
})(Zepto);
</script>