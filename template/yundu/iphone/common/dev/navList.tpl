/** TODO 删除模板 不再使用 新模板 tpl/nav/navList.soy**/
<!--sed模板模块-->

{[%if $sub_data.navListSed|count>0%]}
    <div class="saNavCard">
        {[%foreach from=$sub_data.navListSed item=sedItem%]}
            {[%if $sedItem.hasSub == 0%]}
                <div class="hCard">
                    {[%include file="tpl/fastLink.soy" sub_data=$sedItem.data_value%]}
                </div>
            {[%else%]}
                <div class="hCard">
                    <ul class="hList navList">
                        {[%foreach from=$sub_data.navListSed item=item%]}
                            {[%if empty($item.data)%]}
                                {[%include file="./navListItemLink.tpl" sub_data=$item %]}
                            {[%else%]}
                                {[%include file="./navListItemContent.tpl" sub_data=$item %]}
                            {[%/if%]}
                        {[%/foreach%]}
                    </ul>
                </div>
            {[%/if%]}
        {[%/foreach%]}

        {[%if $sub_data.navList|count > 0 %]}
            {[%if $sub_data.navListHasSub == 0%]}
                <div class="hCard">
                    {[%include file="tpl/fastLink.soy" sub_data=$sub_data.navList%]}
                </div>
            {[%else%]}
                <div class="hCard">
                    <ul class="hList navList">
                        {[%foreach from=$sub_data.navList item=item%]}
                            {[%if empty($item.data)%]}
                                {[%include file="./navListItemLink.tpl" sub_data=$item %]}
                            {[%else%]}
                                {[%include file="./navListItemContent.tpl" sub_data=$item %]}
                            {[%/if%]}
                        {[%/foreach%]}
                    </ul>
                </div>
            {[%/if%]}
        {[%/if%]}

    </div>
{[%/if%]}
{[%if $sub_data.navList|count > 0 %]}
    {[%if $sub_data.navListHasSub == 0%]}
        <div class="hCard saNavCard">
            {[%include file="tpl/fastLink.soy" sub_data=$sub_data.navList%]}
        </div>
    {[%else%]}
        <div class="hCard">
            <ul class="hList navList">
                {[%foreach from=$sub_data.navList item=item%]}
                    {[%if empty($item.data)%]}
                        {[%include file="./navListItemLink.tpl" sub_data=$item %]}
                    {[%else%]}
                        {[%include file="./navListItemContent.tpl" sub_data=$item %]}
                    {[%/if%]}
                {[%/foreach%]}
            </ul>
        </div>
    {[%/if%]}
{[%/if%]}
{[%if $sub_data.mainNavList|count > 0 %]}
    {[%if $sub_data.mainNavListHasSub == 0%]}
        <div class="hCard saNavCard">
            {[%include file="tpl/fastLink.soy" sub_data=$sub_data.mainNavList%]}
        </div>
    {[%else%]}
        <div class="hCard">
            <ul class="hList navList">
                {[%foreach from=$sub_data.mainNavList item=item%]}
                    {[%if empty($item.data)%]}
                        {[%include file="./navListItemLink.tpl" sub_data=$item %]}
                    {[%else%]}
                        {[%include file="./navListItemContent.tpl" sub_data=$item %]}
                    {[%/if%]}
                {[%/foreach%]}
            </ul>
        </div>
    {[%/if%]}
{[%/if%]}

	

