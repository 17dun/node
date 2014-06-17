{[%if $item.type eq "FAST_LINK"%]}
    {[%**TODO check 一下copyRight 里面是不是还有使用短链接块**%]}
	{[%include file="tpl/fastLink.soy" sub_data=$item.data_value%]}
{[%elseif $item.type eq "COPY_RIGHT"%]}
	{[%*include file="./dev/copyRightContent.tpl" sub_data=$item.data_value*%]}
	{[%include file="tpl/copyRightContent.soy" sub_data=$item.data_value%]}
{[%else%]}
    {[%include file="../page/widepage/widget/wide_process.tpl"%]}
{[%/if%]}
