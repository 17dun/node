<div class="hCard">
   {[%if $sub_data.title%]}
      <div class="hCardTop">
	    {[%include file="./cardTitle.tpl"%]}
      </div>
   {[%/if%]}
   
   {[%if !empty($sub_data.data)%]}
         {[%include file="../wide_process.tpl" item=$sub_data.data%]}
   {[%/if%]}
</div>
