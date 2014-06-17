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
    ,config = require('../conf');

bdlog.init(config.bdlog);


describe('prepro',function(){
    describe('#prepro_nav',function(){
        it('it should be xxxx',function(done){


            fs.readFile('./app/tcwise/test/data/nav.txt', function (err, data) {
                if (err) throw err;
                //console.log(data);
                var res = {
                    nav:{
                        navList : []
                    }
                };
                data = JSON.parse(data);
                var blocks = [];
                //先把sign_area块都抽出来
                data.blocks.forEach(function(block){
                    if(block.type == 'NAV'){
                        blocks.push(block);
                    }
                });

                var len = blocks.length;
                blocks.forEach(function(block){
                    cpredata.prepro_nav(block, res ,function(err, data){
                        len--;
                        if(len == 0){
                            assert.equal("http://www.3lian.com/edu/",res.nav.navList[0].href);
                            done();
                        }
                    });
                });

            });

        })
    })
})
