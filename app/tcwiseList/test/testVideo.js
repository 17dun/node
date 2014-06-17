/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-27
 * Time: 下午5:00
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
    describe('#query_object',function(){

        //case 1 测试query_object
        it('should be ',function(){
            var str = "http://mp4.31tg.com/30/1173/6654/83090248.m4a";
            var query = predata.query_object(str);
            assert.equal(1,query.cdn);
        })

        //need_transcode:0
        it('need_transcode should be 0',function(done){

             var block = {
                 "type":"VIDEO",
                 "xpath":[],
                 "order":499,
                 "data_type":"STRUCT",
                 "func_type":"VIDEO_AUDIO",
                 "data_value":{
                     "video_resource_str":"http://mp4.31tg.com/30/1173/6654/83090248.m4a",
                     "need_transcode":0
                 }};

                var res = {
                    nav:{
                        navList : []
                    }
                };

                predata.prepro_video(block, res, function(err,block){
                    if(err !== null){
                        bdlog.warn(err);
                    }else{
                        // console.log(block);
                        //console.log(block.data_value.need_transcode);
                        assert.equal(0, block.data_value.need_transcode);
                        assert.equal("http://mp4.31tg.com/30/1173/6654/83090248.m4a", block.data_value.video_resource_str);
                    }
                    done();
                })

        })

        //str不带http
        it('need_transcode should be 1',function(done){

            var block = {
                "type":"VIDEO",
                "xpath":[],
                "order":499,
                "data_type":"STRUCT",
                "func_type":"VIDEO_AUDIO",
                "data_value":{
                    "video_resource_str":"mp4.31tg.com/30/1173/6654/83090248.m4a",
                    "need_transcode":1
                }};

            var res = {
                nav:{
                    navList : []
                }
            };

            predata.prepro_video(block, res, function(err,block){
                if(err !== null){
                    bdlog.warn(err);
                }else{
                    // console.log(block);
                    //console.log(block.data_value.need_transcode);
                    assert.equal(1, block.data_value.need_transcode);
                    assert.equal("mp4.31tg.com/30/1173/6654/83090248.m4a", block.data_value.video_resource_str);
                }
                done();
            })

        })

        it('need_transcode should be 0',function(done){


            fs.readFile('./app/tcwise/test/data/video.txt', function (err, block) {
                if (err) throw err;
                //console.log(data);
                var res = {
                    nav:{
                        navList : []
                    }
                };
                block = JSON.parse(block);

                predata.prepro_video(block, res, function(err,block){
                      if(err !== null){
                          bdlog.warn(err);
                      }else{
                         // console.log(block);
                          //console.log(block.data_value.need_transcode);
                          assert.equal(0, block.data_value.need_transcode);
                      }
                    done();
                })

            });

        })
    })
})

