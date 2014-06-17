{[%if $sub_data.data_value%]}
{[%if $sub_data.func_type=="VIDEO_REAL"%]}
<div class="ssNormal yi-video">{[%$sub_data.data_value|escape:none%]}</div>
{[%elseif $sub_data.func_type=="VIDEO_SP"%]}
{[%include file="sitetheme-common/tcvideo.tpl" tcvideo=$sub_data.data_value%]}
{[%elseif $sub_data.func_type=="VIDEO_AUDIO"%]}
{[%include file="sitetheme-common/tcaudio.tpl" tcaudio=$sub_data.data_value%]}
{[%/if%]}
{[%/if%]}