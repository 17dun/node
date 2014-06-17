/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-10
 * Time: 下午4:12
 * To change this template use File | Settings | File Templates.
 */

var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require('assert')
    ,cpredata = require('cpredata')
    ,fs = require('fs')
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf')
    ,predata = require(tcwise_path + '/node_modules/predata');

bdlog.init(config.bdlog);


describe('prepro',function(){
    describe('#prepro_mypos',function(){
        //mypos lenght 3
        it('it should be http://home.feiku.com/category/15',function(done){
            fs.readFile('./app/tcwise/test/data/mypos.txt', function (err, block) {
                if (err) throw err;
                //console.log(data);
                var res = {};
                block = JSON.parse(block);
                //console.log(block);

                predata.prepro_mypos(block, res ,function(err, data){
                  // console.log(res);
                   //assert.equal('HTML',res.top_search.data_type);
                    assert.equal('http://home.feiku.com/category/15',res.top_left_link);
                    done();
                });
            });
        })
        //mypos lenght 1
        it('it should be http://home.feiku.com/category/15',function(done){
            fs.readFile('./app/tcwise/test/data/mypos1.txt', function (err, block) {
                if (err) throw err;
                //console.log(data);
                var res = {
                    'url' :  'http://home.feiku.com/category/15'
                };
                block = JSON.parse(block);
                //console.log(block);

                predata.prepro_mypos(block, res ,function(err, data){
                     console.log(res);
                    //assert.equal('HTML',res.top_search.data_type);
                    //assert.equal('http://home.feiku.com/category/15',res.top_left_link);
                    done();
                });
            });
        })
    })
})
