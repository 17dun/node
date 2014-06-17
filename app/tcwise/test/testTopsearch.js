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
    describe('#prepro_topsearch',function(){
        it('itshould be HTML and PRE_REMOVE_TOP_SEARCH',function(done){


            fs.readFile('./app/tcwise/test/data/topSearch.txt', function (err, block) {
                if (err) throw err;
//                console.log(block);
                var res = {};
                block = JSON.parse(block);
              //  console.log(JSON.parse(block));

                predata.prepro_topsearchnew(block, res ,function(err, data){
                   //console.log(res);
                   assert.equal('HTML',res.top_search.data_type);
                    assert.equal('PRE_REMOVE_TOP_SEARCH',block.type);
                    done();
                });


            });

        })
    })
})
