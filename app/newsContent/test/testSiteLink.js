/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-9
 * Time: 下午7:56
 * To change this template use File | Settings | File Templates.
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require("assert")
    ,get_host_list = require(tcwise_path + '/models/logic/siteLink.js').get_host_list
    ,get_baidu_site_link = require(tcwise_path + '/models/logic/siteLink.js').get_baidu_site_link
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf');

bdlog.init(config.bdlog);
var src = "http://www.7y7.com.cn/pic/71/15071.html";

describe('siteLink',function(){
    describe("#get_host_list",function(){
        it("should be http://7y7.com.cn",function(){
            var host_list=get_host_list(src);
            //console.log(host_list[0]);
            assert.equal('http://7y7.com.cn',host_list[0]);
        })

        it("should be false",function(){
            var host_list=get_host_list('[]');
            //console.log(host_list[0]);
            assert.equal(false,host_list);
        })
    })
})

 var host_list = ['http://7y7.com','http://www.7y7.com','http://www.7y7.com/pic'];
describe('siteLink',function(){
    describe("#get_baidu_site_link",function(){

        it("should be wapsite",function(done){
            var wapsite=get_baidu_site_link('',function(err,data){
                if(err != null) throw err;
                //console.log(data);
                assert.equal(1,data.status);
                done();
                //assert.equal('http://m.7y7.com',data.status);
            });

            //console.log(host_list);
        });

        //dict=22建站
       it("should be wapsite",function(done){
            //console.log('sss');
            var options = {
                'dict':22,
                'logid':123
            };
            var wapsite=get_baidu_site_link("http://www.1000xian.net/",options,function(err,data){
               if(err != null) throw err;
                //console.log('sss');
                //console.log(data);

                assert.equal('http://3g.1000xian.net',data.wapsite);
                assert.equal(2,data.status);
                done();
            });

            //console.log(host_list);
       });


        //dict=23移动域名建站
        it("should be wapsite",function(done){
            //console.log('sss');
            var options = {
                'dict':23,
                'logid':124
            };
            var wapsite=get_baidu_site_link("http://www.guoyan.com.cn",options,function(err,data){
                if(err != null) throw err;
                //console.log('sss');
                //console.log(data);

                assert.equal('http://m.guoyan.com.cn',data.wapsite);
                assert.equal(2,data.status);
                done();
            });

            //console.log(host_list);
        });

        //dict=23前缀形式建站  有移动域名但是未通过审核
        it("should be wapsite",function(done){
            //console.log('sss');
            var options = {
                'dict':23,
                'logid':125
            };
            var wapsite=get_baidu_site_link("http://www.dsfk.net",options,function(err,data){
                if(err != null) throw err;
                //console.log('sss');
                //console.log(data);

                // assert.equal('http://3g.1000xian.net',data.wapsite);
                assert.equal(3,data.status);
                done();
            });

            //console.log(host_list);
        });

        //dict=23前缀形式建站  无移动域名
        it("should be wapsite",function(done){
            //console.log('sss');
            var options = {
                'dict':23,
                'logid':125
            };
            var wapsite=get_baidu_site_link("http://dkaaaa.1688.com",options,function(err,data){
                if(err != null) throw err;
                //console.log('sss');
                //console.log(data);

                // assert.equal('http://3g.1000xian.net',data.wapsite);
                assert.equal(3,data.status);
                done();
            });

            //console.log(host_list);
        });


        it("should be status 3",function(done){
            //console.log('sss');
            var options = {
                'dict':23,
                'logid':125
            };
            var wapsite=get_baidu_site_link("http://www.izuche.cc",options,function(err,data){
                if(err != null) throw err;
                //console.log('sss');
                //console.log(data);

                // assert.equal('http://3g.1000xian.net',data.wapsite);
                assert.equal(3,data.status);
                done();
            });

            //console.log(host_list);
        });

    })
})
