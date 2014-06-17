/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-5
 * Time: 下午4:36
 * To change this template use File | Settings | File Templates.
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var mysql = require(tcwise_path + '/models/dao/yunDuDb.js').mysql
    ,assert = require('assert')
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf');

bdlog.init(config.bdlog);
var config= {
    host     : '10.36.117.60',
    port : 5180,
    user     : 'mcloud_rd',
    password : 'd8e73ki32liqu9',
    database : 'mcloud'
//    debug : true
};

/*describe('#get_ad',function(){
    it('should',function(done){
        var mysql_connection = new mysql;
        mysql_connection.get_ad('http://www.baidu.com',function(err,data){
            if (err) throw err;
            //console.log(data);
        });
        done();
    })
})*/

/*describe('#set_ad',function(){
    //更新qs_ad
    it('should',function(done){
        var mysql_connection = new mysql;
        var appsid = "bfbad7a2";
        var appsec = "bfbad7a2";
        var id = 1;
        mysql_connection.set_ad('http://www.baidu.com',appsid,appsec,id,function(err,data){
            assert.equal(false,err!==null);
           // console.log('callbackdata: '+data);
            done();
        });

    })
    it('should',function(done){
        var mysql_connection = new mysql;
        mysql_connection.set_ad('http://www.baidu.com',56,66,0,function(err,data){
            assert.equal(false,err!==null);
           // console.log('callbackdata: '+data);
            done();
        });

    })
})*/

var host_list = ['http://www.jdxsw.net','http://jdxsw.net'];
describe('#get_baidu_site_link',function(){
    it('should get appid',function(done){
        var mysql_connection = new mysql;
        var options = {
            'dict':22
        };
        mysql_connection.get_baidu_site_link(host_list,options,function(err,data){
          // console.log(data);
            assert.equal(false,err!==null);
            done();
        })
       // done();
    })
})





