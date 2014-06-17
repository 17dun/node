/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-11
 * Time: 下午3:30
 * To change this template use File | Settings | File Templates.
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require('assert')
    ,nshead = require('comlib').nshead
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf');
bdlog.init(config.bdlog);
var header = {
        'id': 123,
        'version': 2,
        'log_id':  1222 ,
        'provider':  'test',
        'magic_num': 4218459028,
        'reserved': 123,
        'body_len': 0
    }
var options = {
    'host':'10.44.24.45',
    'port' : 5357,
    'code' : 'gbk',
    'timeout' : 10000
}

var body = {
    'dict_type': 2048,
    'key': {
        "dict_id":[],
        "dict_key":[]
    },
    "num": 1,
    "url": ["http://www.baidu.com"]
}

describe("#nshead",function(){
    it('should be 2048',function(done){
        nshead(header,body,options,function(err,data){
            if(err !== null) throw err;
            //console.log(data.dict_type);
            assert.equal('2048',data.dict_type);
            done();
        })
    })
});