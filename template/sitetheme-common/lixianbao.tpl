{[%if $siteInfo.islxb%]}
{[%if $ishead%]}
<div class="yi-lixianbao yi-lixianbao-left yi-fontcolor">
    <a href="#lixianbao" class="yi-fontcolor">点击免费通话</a>
</div>
{[%/if%]}
<div class="yi-lixianbao yi-lixianbao-box {[%if $ishead%]}head{[%/if%]}">
<form class="yi-lixianbao-form" action="." data-coord="{[%if $ishead%]}head{[%else%]}foot{[%/if%]}">
    <div class="yi-lixianbao-wrap">
        <div class="yi-lixianbao-inner">
            <input type="tel" name="tel" placeholder="请输入你的电话号码" class="yi-lixianbao-text"/>
        </div>
        <button class="yi-lixianbao-bn" type="submit"><em class="yi-fontcolor">点击免费通话</em></button>
    </div>
</form>
</div>
{[%if $isfoot%]}<a name="lixianbao"></a>{[%/if%]}
{[%/if%]}
