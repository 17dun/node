<style type="text/css">
.yi-htopc{
    background-color: #fbfbe3;
}
.yi-htopc-link{
    height: 30px;
    line-height: 30px;
    color: #67675f;
    font-size: 13px;
    background: url(http://img.siteapp.baidu.com/static/appui/sitetheme0/images/topc.png) no-repeat 5px center;
    display: block;
    -webkit-background-size: 16px 15px;
    background-size: 16px 15px;
    padding-left: 22px;
}
</style>
<div class="yi-htopc">
{[%if $res.data.url%]}
    <a class="yi-htopc-link yi-tj" data-ac="topc" data-coord="head" href="{[%$res.data.url|escape:'html'%]}">点击切换至电脑版</a>
{[%else%]}
    <a class="yi-htopc-link yi-tj" data-ac="topc" data-coord="head" href="{[%$pcUrl|escape:'html'%]}">点击切换至电脑版</a>
{[%/if%]}
</div>
