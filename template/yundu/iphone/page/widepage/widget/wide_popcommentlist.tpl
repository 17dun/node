{[%if !empty($sub_data.items)%]}
     <div class="popcommentlist hCard" data-block_type="popcommentlist">
             <style type="text/css">
                 .popcommentlist{background-color: #fff;font-size:14px;}
                 .popcommentlist ul li{position: relative;border-bottom:1px solid #EFEFEF;padding:8px;display:block;}
                 .popcommentlist ul li:last-child{border-bottom: none;}
                 .popcommentlist .time-info,.popcommentlist .name-info{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}
                 .popcommentlist .time-info{position: absolute;right:8px;top:10px;width:140px;color:#aaa;text-align:right;}
                 .popcommentlist .name-info{max-width:10em;font-size:14px;color:#555;height:22px;line-height:18px;}
                 .popcommentlist .name-info a{font-size:14px;color:#555;}
                 .popcommentlist .time-info a{font-size:14px;color:#aaa;}
                 .popcommentlist .content-info, .popcommentlist .content-info a{margin:0px 0px 5px;font-size:16px;color: #373737;}
                 .popcommentlist .other-info,.popcommentlist .other-info a{font-size:14px;color:#aaa;}
                 .popcommentlist a[href],.popcommentlist .name-info a[href]{color:#2d71ea}
                  .popcommentlist img{min-width:14px;min-height:14px;}
                 .popcommentlist .popcommentlist-list img{max-height:16px;vertical-align:bottom;}
             </style>
             {[%include file="./wide_list.tpl" sub_data=$sub_data%]}
         </div>
{[%/if%]}