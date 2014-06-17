{[%if $tcaudio.need_transcode== 0%]}
<div class="yi-audio">
    <style type="text/css">
        .sip-aud{position:relative;padding:0 45px 0 90px;height:46px;border:1px solid #D9D9D9;background-color:#F3F3F3;font-size:12px;margin:10px;}
        .sip-aud .play,.sip-aud .time{position:absolute;left:0;top:0;height:46px;width:45px;line-height:46px;text-align:center;color:#999;}
        .sip-aud .play{height:44px;border:1px solid #F3F3F3;background-color:#F44F55;}
        .sip-aud .play:after{content:"";position:absolute;border:10px solid rgba(0,0,0,0);border-left:solid 14px #fff;left:16px;top:12px;}
        .sip-aud .play.pause:after,.sip-aud .play.pause:before{content:"";position:absolute;border:none;width:5px;height:15px;background-color:#fff;top:15px;}
        .sip-aud .play.pause:after{left:25px;}
        .sip-aud .play.pause:before{left:15px;}
        .sip-aud .cur-time{left:46px;}
        .sip-aud .total-time{position:absolute;left:auto;right:0;}
        .sip-aud .progress{position:relative;height:45px;}
        .sip-aud .bg,.sip-aud .played,.sip-aud .buffer{position:absolute;width:100%;height:8px;border-radius:4px;left:0;top:18px;}
        .sip-aud .bg{border:1px solid #fff;background-color:#E6E5E3;margin-left:-1px;}
        .sip-aud .buffer{background-color:#DBDAD8;top:19px;width:0%;}
        .sip-aud .played{background-color:#F44F55;top:19px;width:0%;}
        .sip-aud .played-btn{top:18px;position:relative;height:20px;margin:0 18px 0 -2px;}
        .sip-aud .playedicon{position:absolute;z-index:10;width:22px;height:22px;top:-6px;left:0;-webkit-backface-visibility: hidden;background-image:url(http://m.baidu.com/static/search/siteapp/image/icon-audio.png);background-size:20px 20px;background-repeat:no-repeat;}
    </style>
    <audio class="audio" controls="controls" style="height:0;width:0;overflow:hidden;display:none;" src="{[%$tcaudio.video_resource_str%]}" preload="auto"></audio>
    <div class="sip-aud">
        <div class="play"></div>
        <div class="time cur-time">00:00</div>
        <div class="time total-time"></div>
        <div class="progress">
            <div class="bg"></div>
            <div class="buffer"></div>
            <div class="played"></div>
            <div class="played-btn">
                <div class="playedicon"></div>
            </div>
        </div>
    </div>
</div>
{[%/if%]}
