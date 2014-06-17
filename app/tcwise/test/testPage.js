/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-8-31
 * Time: 下午3:02
 * To change this template use File | Settings | File Templates.
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var page = require(tcwise_path + '/models/logic/page.js');
var assert = require("assert");
var fs = require('fs')
,bdlog = require('comlib').bdlog
    ,config = require('../conf');

bdlog.init(config.bdlog);

//var src = "http://www.diyifanwen.com/qitafanwen/duhougan/index_6.htm";
 describe('page', function(){
    describe('#get_page_data', function(){
        //case 1   tc_source=1
        it('tpl_version should be  0', function(done){
            var req = {};
            req.query ={
                nocache : 1,
                tc_source:1,
                src : "http://www.diyifanwen.com/qitafanwen/duhougan/index_6.htm"
            };
            req.get =  function(a){return a;}
            req.nocache = 1;
            req.query.src ="http://www.diyifanwen.com/qitafanwen/duhougan/index_6.htm";
            var options={};
            options.req= req;
            page.get_page_data(req.query.src,function(err, data){
                if(err != null) throw err;
                 assert.equal(0,data.tpl_version);
                done();
            });
        })
        //case 2 test nocache && data
        it('should return page_data', function(done){
            var req = {};
            req.query ={
                nocache : 1,
                src : "http://www.diyifanwen.com/qitafanwen/duhougan/index_6.htm"
            };
            req.get =  function(a){return a;}
            var options={};
            options.req= req;
                   page.get_page_data(req.query.src,options,function(err, data){
                   if(err != null) throw err;
                   //var temp = JSON.stringify(data);
                  // var temp =data;
                   var temp =data;
                       assert.equal(0,data.page_flag);
                 // console.log(temp);
                      /* fs.writeFile('sourcePageData.txt', data, function (err) {
                           if (err) throw err;
                          // console.log('It\'s saved!');
                       }); */
                   //console.log(temp.url);
                   done();
               });
        })

        //case 3 blocks为空
        it('should return true', function(done){
            var req = {};
            req.query ={
               // nocache : 1,
                src : "http://www.cnhubei.com/"
            };
            req.get =  function(a){return a;}
            var options={};
            options.req= req;
            page.get_page_data(req.query.src,options,function(err, data){
                if(err != null) {
                    assert.equal(true,err!=null);
                }
                done();
            });
        })

        //case 4 redirect_type
        it('should return REDIRECT_TYPE_WAP', function(done){
            var req = {};
            req.query ={
                nocache : 1,
                tc_source : 1,
                src : "http://shop106385405.taobao.com/?www.baigouwanggong.com"
            };
            req.get =  function(a){return a;}
            var options={};
            options.req= req;
            page.get_page_data(req.query.src,options,function(err, data){
                if(err != null) throw err;
                //console.log(data);
                assert.equal('REDIRECT_TYPE_WAP',data.redirect_type);
                done();
            });
        })


    })
});

describe('page', function(){
    describe('#get_page_type', function(){
        //case 1  type_num=2
        it('should return type_num = 2', function(done){
               var data = {
                   "page_flag" : 1111
               };
               page.get_page_type(data,function(err, type){
                    assert.equal(2,type );
                    //console.log('type_num:'+data);
                    done();
                });

        })
        //case 2 type_num=4
        it('should return type_num = 4 occur error', function(done){
            var data = {
                "page_type" : "PAGE_TYPE_LINK"
            };
            page.get_page_type(data,function(err, type){
                assert.equal(true,err!=null );
                //console.log('type_num:'+data);
                done();
            });

        })

        //case 3    type_num=1
        it('should return type_num = 1', function(done){
            fs.readFile('./app/tcwise/test/data/sourcePageData.txt', function (err, data) {
                if (err) throw err;
                //console.log(data.toString());
                var temp = data.toString();
                var source_data =JSON.parse(temp);
              //  console.log(source_data);
               // page.get_page_type(source_data);
                //done();
                page.get_page_type(source_data,function(err, type){
                    assert.equal(1,type );
                    //console.log('type_num:'+data);
                    done();
                });
            });
        })
    })
});
