<script type="text/javascript">
;(function(){
    var baidutk;
    var userId = Du.front.userId;
    var referer = document.referrer;
    var time = +new Date();
    var getTurl = "http://lxbjs.baidu.com/cb/user/check?uid="+userId+"&f=6&r="+ referer +"&t="+ time;
    var callTurl = "http://lxbjs.baidu.com/cb/call?uid="+userId;
    var sendAjax = function(options){
        $.ajax({
            url      : options.url,
            data     : options.data||null,
            dataType : "jsonp",
            jsonp    : "callback",
            success  : function(data) {
                if(!data.status && data.data.tk){
                    options.suc&&options.suc(data);
                }else if(options.error){
                    options.error(data);
                }
            },
            error: function(data){
                options.error&&options.error(data);
            },
            timeout: 6000
        });
    };
    //获取tk
    sendAjax({
        url : getTurl,
        suc : function(data){
            baidutk = data.data.tk;
            $(".yi-lixianbao").show();
        }
    });
    $(".yi-lixianbao-left").click(function(){
        $(".yi-lixianbao-text").get(1).focus();
    });
    $(".yi-lixianbao-text").focus(function(){
        setTimeout(function(){
            window.scrollTo(0,window.pageYOffset+40);
        },500);
    });
    $(".yi-lixianbao-form").submit(function(){
        if(!baidutk) return false;
        var $t = $(this);
        var $val = $t.find(".yi-lixianbao-text").val();
        sendAjax({
            url:callTurl,
            suc:function(data){
                alert("Hi,呼叫成功，稍后给你回拨请接听")
            },
            error:function(data){
                if(data.status&&data.msg){
                    alert(data.msg)
                }else{
                    alert("对不起出现了错误，请稍后再拨")
                }
            },
            data:{
                vtel : $val,
                tk : baidutk,
                t : (+new Date())
            }
        });
        TJ({
            ac:'lxb',
            coord:$t.data('coord')
        });
        return false;
    })
}());
</script>