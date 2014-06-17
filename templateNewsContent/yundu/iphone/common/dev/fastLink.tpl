{[%* TODO 该模板已废弃，使用tpl/fastLink.soy *%]}
<div class="saFastLink">
  {[%foreach from=$sub_data item=item key=index%]}
	{[%if !empty($item.title)||!empty($item.img) %]}
	{[%if $index%3==0 %]}
		<div class="saFastLinkRow">
	{[%/if%]}
	      {[%if !empty($item.href)%]}
     		<a href="{[%$item.href%]}" class="" {[%if empty($item.title) && !empty($item.img) %]}data-src="{[%$item.img|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}"{[%/if%]} >
			   {[%if !empty($item.title)%]}{[%$item.title%]}{[%else%]}&nbsp;{[%/if%]}
		    </a>
           {[%else%]}
              <a class="" {[%if empty($item.title) && !empty($item.img) %]}data-src="{[%$item.img|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"%]}"{[%/if%]} >
                  {[%if !empty($item.title)%]}{[%$item.title%]}{[%else%]}&nbsp;{[%/if%]}
              </a>
		  {[%/if%]}
	{[%if $index == ($sub_data.length-1) || $index%3 == 2 %]}
	  	</div> 
	{[%/if%]}
	{[%/if%]}
  {[%/foreach%]}
	
</div>
