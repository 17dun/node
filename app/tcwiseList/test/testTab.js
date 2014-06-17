/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-10
 * Time: 下午4:12
 * To change this template use File | Settings | File Templates.
 */

/*该功能已经下线
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require('assert')
    ,cpredata = require('cpredata')
    ,fs = require('fs')
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf');

bdlog.init(config.bdlog);


describe('prepro',function(){
    describe('#prepro_tab',function(){
        //tab大于3个，按照3个一组切分
        it('it should be 2',function(done){

            fs.readFile('./app/tcwise/test/data/tab4.txt', function (err, block) {
                if (err) throw err;
                //console.log(data);
                var res = {};
                block = JSON.parse(block);
               // console.log(block);

                cpredata.prepro_tab(block, res ,function(err, new_block){
                   //console.log(new_block.items.length);
                    assert.equal(2,new_block.items.length);
                    done();
                });
            });

        })
       //tab小于等于3个，原样输出
        it('it should be 1',function(done){

            fs.readFile('./app/tcwise/test/data/tab3.txt', function (err, block) {
                if (err) throw err;
                //console.log(data);
                var res = {};
                block = JSON.parse(block);
                // console.log(block);

                cpredata.prepro_tab(block, res ,function(err, new_block){
                    //console.log(new_block);
                    assert.equal(1,new_block.items.length);
                    done();
                });
            });

        })
    })
})
*/
