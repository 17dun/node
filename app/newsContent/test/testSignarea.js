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


describe('prepro',function(){
    describe('#prepro_signarea',function(){
        //case 1
        it('it should be 2',function(done){
                //console.log(data);
                var res = {
                    custom : {
                        cpt_tab : []
                    }

                };

                //console.log(data);
                var block = {
                    "SSS" : 1,
                    "CPT_INFO":""
                };
                predata.prepro_signarea(block, res ,function(err, data){
                    assert.equal(1,data.SSS);
                    done();

                });



        })
        //case 2   test
        it('it should be 2',function(done){

            fs.readFile('./app/tcwise/test/data/signarea.txt', function (err, data) {
                if (err) throw err;
                //console.log(data);
                var res = {
                    custom : {
                        cpt_tab : []
                    }

                };

                data = JSON.parse(data);
                //console.log(data);
                var blocks = [];
                //先把sign_area块都抽出来
                data.blocks.forEach(function(block){
                    if(block.type == 'SIGN_AREA'){
                        blocks.push(block);
                    }
                });

                var len = blocks.length;
                blocks.forEach(function(block){
                     predata.prepro_signarea(block, res ,function(err, data){
                         len--;
                         if(len == 0){
                            // console.log(res);
                             assert.equal(2,res.custom.cpt_tab[2][0].group_id);
                             assert.equal(2,res.custom.cpt_tab[2][0].group_id);
                             done();
                         }
                    });
                });
            });

        })
    })
})
