<div class="nav-list-wrap">
    <div class="nav-list">
        <ul>
            {[%foreach from=$sub_data item=navItem%]}
                <li>{[%$navItem.text%]}</li>
            {[%/foreach%]}
        </ul>
    </div>
    <div class="prev"></div>
    <div class="next"></div>
</div>