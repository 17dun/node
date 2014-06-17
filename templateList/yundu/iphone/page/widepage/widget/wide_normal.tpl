{[%strip%]}
<div class="ssNormal">{[%$sub_data|regex_replace:"/.{1}tpl_size.{1}/g":"b640_640"|regex_replace:"/(<img\b.*?)(\ssrc=)(.*?\/?>)/gi":'$1 data-src=$3'%]}</div>
{[%/strip%]}