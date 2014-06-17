{[%if $res.data.video_resource_type%]}
{[%assign var=tcvideo value=$res.data%]}
{[%/if%]}
{[%if $tcvideo.video_resource_type=="1"%]}
<div class="yi-tcvideo yi-www">
        <div class="yi-tcvideo-img"></div>
        <div class="yi-tcvideo-title">建议你使用百度视频播放:</div>
        <div class="yi-tcvideo-buttons">
            <a href="http://m.baidu.com/static/video/super_proxy.html#{&quot;title&quot;:&quot;{[%$res.data.page_title|escape:html%]}&quot;,&quot;url&quot;:&quot;{[%$tcvideo.video_resource_str|escape:html%]}&quot;,&quot;return_url&quot;:&quot;http://{[%$smarty.server.HTTP_HOST|escape:html%]}{[%$smarty.server.REQUEST_URI|escape:html%]}&quot;}" class="yi-tcvideo-button play">立即播放</a>
            <a href="http://m.baidu.com/app?action=content&from=siteapp#pid=3955661916" class="yi-tcvideo-button down">下载安装</a>          
        </div>  
        <div class="yi-tcvideo-tip">百度仅提供转码技术<br/>来源:{[%$res.data.url%]}</div>
    </div>
{[%/if%]}
{[%if $tcvideo.video_resource_type=="2"%]}
<div class="yi-tcvideo yi-www">
        <div class="yi-tcvideo-img"></div>
        <div class="yi-tcvideo-title">建议你使用快播播放:</div>
        <div class="yi-tcvideo-buttons">
            <a href="{[%$tcvideo.video_resource_str|escape:html%]}" class="yi-tcvideo-button play qvod">立即播放</a>
            <a href="http://m.kuaibo.com" class="yi-tcvideo-button down">下载安装</a>          
        </div>  
        <div class="yi-tcvideo-tip">百度仅提供转码技术<br/>来源:{[%$res.data.url|escape:html%]}</div>
    </div>
{[%/if%]}