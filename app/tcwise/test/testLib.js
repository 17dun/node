/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-5
 * Time: 下午3:46
 * To change this template use File | Settings | File Templates.
 */

lib = require('comlib')
    ,assert = require("assert");

describe('#is_empty_object',function(){
    it('should be false',function(){
        var res = lib.is_empty_object({});
        //console.log(res);
        assert.equal(true,res);
    })

    it('should be true',function(){
        var res = lib.is_empty_object({a:1});
       // console.log(res);
        assert.equal(false,res);
    })

    it('should be true',function(){
        var res = lib.is_empty_object({a:null});
        // console.log(res);
        assert.equal(false,res);
    })
});
