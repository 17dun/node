/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-10
 * Time: 下午4:12
 * To change this template use File | Settings | File Templates.
 */

var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require('assert')
    ,cpredata = require('cpredata')
    ,fs = require('fs')
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf');

bdlog.init(config.bdlog);


describe('prepro',function(){
    describe('#prepro_float',function(){
        it('the pos of data-ad-type=FLOAT should be 32',function(done){


            fs.readFile('./app/tcwise/test/data/float.txt', function (err, block) {
                if (err) throw err;
                //console.log(data);
                var res = {
                    'page_ad' : "<div class='ssNormal ssAD'>"
                };
                block = JSON.parse(block);
              //  console.log(JSON.parse(block));

                cpredata.prepro_advertise(block, res ,function(err, data){
                   // console.log(res);
                    //'<div class=\'ssNormal ssAD\'><div data-ad-type=ADVERTISE><div ><a  href="http://www.baidu.com/cb.php?c=IgF_pyfqnHRsn1b1P1c0IZ0qnfK9ujYzPjRLrj60uARqnW0dPHR30ZKET1YkrHR3rjm0T1YYuy7WujfLm1KbmH6srjRz0AwY5HD1rjDdPHRYPj00IgF_5y9YIZ0lQzqLILT8UgNVmg-GQhPEUiq1TANWpy7_Q1csnHnEXA--mv9-UhTE0ZFb5HnY0AFV5H00TZcqn0Kdpyfqn1fkPWDkPsKEpyfqP1cLnWR0mv-b5HDsnW6LP0KEIv3qP10Lrj60mLFW5HmsnWf"><div class="tc-normal-center"><img  src="http://timg01.baidu-2img.cn/timg?pa&amp;quality=100&amp;size=@tpl_size@&amp;fsize=@tpl_fsize@&amp;sec=1381555441&amp;di=55504ae54ae22517e9b7e21b787619f2&amp;ref=http%3A%2F%2Fwww%2Emumayi%2Ecom%2Ftag%2F239%2Fzhinengdianshiduopinghudong%5F239945%5F2%2Ehtml&amp;src=http%3A%2F%2Fubmcmm%2Ebaidustatic%2Ecom%2Fmedia%2Fv1%2F0f0005DvCZ6xTLwTKT7tDf%2Ejpg" alt="携程旅行"/></div></a></div></div>';
                    res.page_ad += "</div>";
                    assert.equal(32,res.page_ad.search(/data-ad-type=FLOAT/));
                    done();

                });


            });

        })
    })
})
