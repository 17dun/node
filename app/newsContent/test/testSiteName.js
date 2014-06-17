/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-11
 * Time: 下午5:34
 * To change this template use File | Settings | File Templates.
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require('assert')
    ,get_site_name = require(tcwise_path + '/models/dao/siteName.js').get_site_name
    ,pro_site_name = require(tcwise_path + '/models/logic/siteName.js').pro_site_name
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf');

bdlog.init(config.bdlog);
describe('#get_site_name',function(){
    it("should be 百度",function(done){
        var url = "http://www.baidu.com";
        get_site_name(url,function(err,data){
            //console.log(data.dict_res_vec[0][0]);
            //assert.equal("百度",data.dict_res_vec[0][0]);
            assert.equal("百度",data);
            done();
        })
    })
})

describe('#pro_site_name',function(){
    it("should be 百度",function(done){
        var url = "http://www.baidu.com/a/b";
        pro_site_name(url,function(err,data){
          // console.log(data);
            //assert.equal("百度",data.dict_res_vec[0][0]);
            assert.equal("百度",data.site_name);
            done();
        })
    })
})
