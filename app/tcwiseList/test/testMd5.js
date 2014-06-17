/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-6
 * Time: 下午1:35
 * To change this template use File | Settings | File Templates.
 */
var assert = require("assert");
var crypto = require('crypto');
var lib = require('comlib');
describe("#md5",function(){
    it('should be md5 value',function(){
        var src = "http://www.baidu.com";
        var md5_value = lib.create_md5(src);
       // console.log(md5_value);
        assert.equal('bfa89e563d9509fbc5c6503dd50faf2e',md5_value);
    })
})