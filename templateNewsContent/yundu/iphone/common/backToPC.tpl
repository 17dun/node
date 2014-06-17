{[%if $dict != 64 && $dict != 72%]}
    <div class="ssBackToPC ssNormal">
        提示:<a class="yi-www" href="{[%$pageFooter['redirectURL']%]}&type=pcURLTop&src={[%$pageFooter.src|urlencode%]}&mask={[%$pageFooter['mask']%]}">原网站</a><span class="ssInlineWeak">已由百度转码，以便在移动设备上查看。</span>
    </div>
{[%/if%]}