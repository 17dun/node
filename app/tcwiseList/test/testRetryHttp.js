/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-14
 * Time: 下午9:53
 * To change this template use File | Settings | File Templates.
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require("assert");
var retry_http_request = require('comlib').retry_http_request
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf');

bdlog.init(config.bdlog);

var options ={
    backend:
    [ { host: '10.42.83.00', port: 8851 },
        { host: '10.42.83.01', port: 8851 },
        { host: '10.26.224.02', port: 8851 } ],
    path: '/webapp?structpage=1&siteType=6&siteappid=406936&onlyspdebug=1&src=http://www.diyifanwen.com/qitafanwen/duhougan/index_6.htm',
    method: 'GET',
    headers: { Host: 'internal_wise_domain.baidu.com' },
    appid: 406936,
    retry: 2,
    timeout: 30000,
    logid :1
};
describe('retryHttp', function(){
    describe('#request',function(){
        it('it ',function(done){
            retry_http_request(options,function(err,data){
                //console.log(err);
                assert.equal("connect all undefined backend fail",err.message);
                //if(err) throw err;
                //console.log(data);
                done();
            })
        })
    })
});

