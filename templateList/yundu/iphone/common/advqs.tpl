{[%strip%]}
{[%if $ad && $ad.type == 'qs'%]}
<script type="text/javascript" src="http://mobads.baidu.com/jssdk/js_siteapp.js"></script>
<script type="text/javascript">
_$MADS({
            appsid: '{[%$ad.appsid%]}',
            appsec: '{[%$ad.appsec%]}',
            domain: '{[%$ad.domain%]}',
            referer: '{[%$ad.url%]}',
        ads: [{
                container: 'yi-ad-top',
                apid: 'apid1',
                count: 1,
                at: ['image'],
                onAdShow: function(evt) {
                },
                onAdClick: function(evt) {
                },
                onAdFailed: function(evt){
                }
            },{
                container: 'yi-ad-bottom',
                apid: 'apid2',
                count: 2,
                at: ['text']
            }],
            onAdShow: function(evt) {
            },
            onAdClick: function(evt) {
            },
            onAdFailed: function(evt){
            }
        });
</script>
{[%/if%]}
{[%/strip%]}