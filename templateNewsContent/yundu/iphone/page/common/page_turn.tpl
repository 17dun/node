{[%strip%]}
{[%if $item%]}
	{[%if $item.pt_link%]}
		<div class="yi-pageturn">
            <div class="yi-pageturn-up"><a {[%if empty($item.pre)%]}class="yi-pageturn-first"{[%/if%]} {[%if !empty($item.pre_nextpage)||$item.next_nextpage===0%]}data-addparam="nextpage={[%$item.pre_nextpage%]}"{[%/if%]} {[%if $item.pre%]}href="?src={[%$item.pre|escape:"url"%]}"{[%/if%]}></a></div>
            {[%if $item.pt_link neq ""%]}
            <div class="yi-pageturn-n">
                <p class="yi-pageturn-ndiv"><span class="yi-pageturn-n-current yi-fontcolor">{[%$item.pi|escape:"html"%]}</span>/<span class="yi-pageturn-n-total">{[%$item.pn|escape:"html"%]}</span></p>
                
            </div>
		    {[%/if%]}
		    <div class="yi-pageturn-down"><a {[%if empty($item.next)%]}class="yi-pageturn-last"{[%/if%]} {[%if !empty($item.next_nextpage)||$item.next_nextpage===0%]}data-addparam="nextpage={[%$item.next_nextpage%]}" {[%/if%]} {[%if $item.next%]}href="?src={[%$item.next|escape:"url"%]}"{[%/if%]}></a></div>
		</div>
		{[%elseif (($item.pre_anchor&&$item.pre)||($item.next&&$item.next_anchor))%]}
		{[%if $item.add_ext_pre_text==1 || $item.add_ext_next_text==1%]}
		<div class="yi-prenext">
			<div class="yi-prenext-title">延伸阅读：</div>
			{[%if $item.pre_anchor&&$item.pre%]}
			<a {[%if !empty($item.pre_nextpage)||$item.next_nextpage===0%]}data-addparam="nextpage={[%$item.pre_nextpage%]}"{[%/if%]} href="?src={[%$item.pre|escape:"url"%]}" class="yi-pre" >
				<span class="yi-prenext-a">上一篇</span><span class="yi-fontcolor">{[%$item.pre_anchor%]}</span>
			</a>
			{[%/if%]}
			{[%if $item.next_anchor&&$item.next%]}
			<a {[%if !empty($item.next_nextpage)||$item.next_nextpage===0%]}data-addparam="nextpage={[%$item.next_nextpage%]}" {[%/if%]} href="?src={[%$item.next|escape:"url"%]}" class="yi-next" >
                <span class="yi-prenext-a">下一篇</span><span class="yi-fontcolor">{[%$item.next_anchor%]}</span>
			</a>
			{[%/if%]}

		{[%else%]}
		<div class="yi-prenext yi-prenext-inline">
				<div class="yi-prenext-title">延伸阅读：</div>
				{[%if $item.pre_anchor&&$item.pre%]}
				<a {[%if !empty($item.pre_nextpage)||$item.next_nextpage===0%]}data-addparam="nextpage={[%$item.pre_nextpage%]}"{[%/if%]} href="?src={[%$item.pre|escape:"url"%]}">
	                <span>{[%$item.pre_anchor|escape:"none"%]}</span>
				</a>
				{[%/if%]}
				{[%if $item.next_anchor&&$item.next%]}
				<span>|</span>
				<a {[%if !empty($item.next_nextpage)||$item.next_nextpage===0%]}data-addparam="nextpage={[%$item.next_nextpage%]}" {[%/if%]} href="?src={[%$item.next|escape:"url"%]}">
	                <span>{[%$item.next_anchor|escape:"none"%]}</span>
				</a>
				{[%/if%]}
			{[%/if%]}
		</div>
		{[%/if%]}
{[%/if%]}
{[%/strip%]}
