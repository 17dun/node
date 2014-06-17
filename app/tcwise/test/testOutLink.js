/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-10
 * Time: 下午4:12
 * To change this template use File | Settings | File Templates.
 */

var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require('assert')
    ,predata = require(tcwise_path + '/node_modules/predata')
    ,fs = require('fs')
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf');

bdlog.init(config.bdlog);


console.log(tcwise_path);
describe('prepro',function(){
    describe('#prepro_outlink',function(){

        it('it should be 2',function(done){

            fs.readFile('./app/tcwise/test/data/sqOutLink.txt', function (err, data) {
                if (err) throw err;
                //console.log(data);
                var res = {};
                data = JSON.parse(data);
               // console.log(block);
                var block_t ;
                data.data.blocks.forEach(function(block,index,data){

                   if(block.type == "OUTLINK"){
                         block_t = JSON.stringify(block);
                   }
                 })

                 block_t = JSON.parse(block_t);
                predata.prepro_outlink(block_t, res ,function(err, new_block){
		            var length = res.outLink.length;
			    console.log(length);
                    assert.equal(new_block.data_value.outlink.type,res.outLink[length-1].type);
                    done();
                });
            });
        })
    })
})
