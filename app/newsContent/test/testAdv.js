/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-10
 * Time: 下午4:12
 * To change this template use File | Settings | File Templates.
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var get_adv_info = require(tcwise_path + '/models/logic/adv.js').get_adv_info
,get_qs_ad_from_qs_server = require(tcwise_path + '/models/logic/adv.js').get_qs_ad_from_qs_server
,get_union_adv  = require(tcwise_path + '/models/logic/adv.js').get_union_adv
,assert = require('assert')
,bdlog = require('comlib').bdlog
,config = require('../conf');

bdlog.init(config.bdlog);
//case 1 equal to case 4
describe('adv',function(){
    describe('#get_adv_info',function(){
        it('it should be true',function(done){
            var src ='HTTP://www.7y7.com/pic/71/15071.html';
            get_adv_info(src,function(err,data){
                if(err != null){
                    //bdlog.warn('err:' + err);
                }

                assert.equal(true,err==null);
                /*var res = {};
                res = {};
                assert.equal(res.toString(),data.toString()) */
                done();
            })

        })
    })
})

//case 2
describe('adv',function(){
    describe('#get_union_adv',function(){
        it('it should be xinhuanet.com',function(){
            var host ='news.xinhuanet.com';
            var ad = get_union_adv(host);
            assert.equal('xinhuanet.com',ad.hostClaim);

        })
    })
})

//case 3
describe('adv',function(){
    describe('#get_adv_info',function(){
        it('it should be sohu.com',function(done){
            var src ='http://cul.sohu.com/20130910/n386288932.shtml';
            get_adv_info(src,function(err,data){
                //console.log(data['ad']);
                assert.equal('sohu.com',data.ad.host);
                done();
            })

        })
    })
})
 /*
//case 4
    //.{"appsid":"ad619580","appsec":"ad619580","firstId":99,"secondId":9901,"code":0,"errmsg":""}
describe('adv',function(){
    describe('#get_qs_ad_from_qs_server',function(){
        it('it should be xxxx',function(done){
            var host ='cul.sohu.com';
            get_qs_ad_from_qs_server(host,function(err,data){
                if(err != null) {
                   // console.log(err.message);
                    assert.equal(true,err!=null);
                    //callback(err);
                }
               //console.log(data.appsid);
               // console.log(data.errmsg.length);
               // assert.equal('ad619580',data.appsid);
                done();
            })

        })
    })
})

describe('adv',function(){
    describe('#get_qs_ad',function(){
        it('it should be xxxx',function(done){
            var host ='cul.sohu.com';
            get_qs_ad(host,function(err,data){
                if(err != null) {
                    // console.log(err.message);
                    assert.equal(true,err!=null);
                    //callback(err);
                }
                //console.log(data.appsid);
                // console.log(data.errmsg.length);
                // assert.equal('ad619580',data.appsid);
                done();
            })

        })
    })
}) */
