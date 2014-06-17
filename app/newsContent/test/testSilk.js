/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-8-30
 * Time: 下午7:56
 * To change this template use File | Settings | File Templates.
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require("assert")
    ,page_data = require(tcwise_path + '/models/dao/pageData.js')
    ,fs = require("fs");

var options = {
    appid : 680073,
    src : 'http://www.newyx.net',
};

describe('page_data', function(){
    describe('#silk_request',function(){
        it('it should return the struct data of the page of www.7y7.com',function(done){
            page_data.silk_request(options,function(err,data){
                assert.equal(true,err==null );
                //console.log(data);
                done();
            })
        })
    })
});