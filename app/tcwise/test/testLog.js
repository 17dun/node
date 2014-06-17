bdlog = require('comlib').bdlog
    ,config = require('../conf')
    ,assert = require("assert");
/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-5
 * Time: 下午3:46
 * To change this template use File | Settings | File Templates.
 */
describe('#bdlog.warn',function(){
    it('should write a string in tcwise.log.wf',function(){
        bdlog.init(config.bdlog);
        //bdlog.warn({'file':'test'});
    })
});
