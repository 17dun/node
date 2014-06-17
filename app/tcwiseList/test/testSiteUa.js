/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-11
 * Time: 下午5:34
 * To change this template use File | Settings | File Templates.
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require('assert')
    ,get_site_ua = require(tcwise_path + '/models/dao/siteUa.js').get_site_ua
    ,test_wapsite = require(tcwise_path + '/models/logic/siteUa.js').test_wapsite;

describe('#get_site_ua',function(){
    it("should be 32",function(done){
        var url = "http://www.baidu.com";
        get_site_ua(url,function(err,data){
            if(err !== null) throw err;
           // console.log(data.dict_res_vec[0][0]);

            assert.equal("source=3\tm.baidu.com",data);
            done();
        })
    })
})

describe('#test_wapsite',function(){
    it("should be true",function(done){
        var url = "http://www.baidu.com";
        var options = [];
        test_wapsite(url,options,function(err,flag){
            //console.log(flag);
            assert.equal(true,flag);
            done();
        })
    })
})

describe('#test_wapsite',function(){
    it("should be true",function(done){
        var url = "http://www.55bbs.com/";
        var options = [];
        test_wapsite(url,function(err,flag){
            //console.log(flag);
            assert.equal(false,flag);
            done();
        })
    })
})

