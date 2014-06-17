/*
 *shimingzhe@baidu.com
 */
var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var assert = require("assert");
var s = require(tcwise_path + '/models/logic/serviceDataSemi.js');
var fs = require("fs");
//var data = eval('(' + fs.readFileSync('./app/tcwise/test/data/silkData.json') + ')');
var bdlog = require('comlib').bdlog;
var config = require('../conf');

//console.log(data);
bdlog.init(config.bdlog);
describe('s', function(){
        it('getData error',function(done){
            //console.log(s.sData.getData(data,'12345654'));
            var data = eval('(' + fs.readFileSync('./app/tcwise/test/data/silkData.json') + ')');
            data1 = s.sData.getData(data,1,'12345654',function(err,process_data){
                assert.equal(15,process_data.toString().length);
                done();
            });
            //console.log(data.toString().length);
        });
});

describe('s', function(){
    it('getData error',function(done){

        //console.log(s.sData.getData(data,'12345654'));
        var data = eval('(' + fs.readFileSync('./app/tcwise/test/data/silkData.json') + ')');
        data2 = s.sData.getData(data,1,'12345654',function(err,process_data){
            assert.equal(15,process_data.toString().length);
            done();
        });
        //console.log(data.toString().length);
    });
});

describe('s', function(){
    it('getData error',function(done){

        fs.readFile('./app/tcwise/test/data/bbscontent.txt', function (err, data) {
            if (err) throw err;

            s.sData.getData(JSON.parse(data),9,'12345654',function(err,process_data){
                //console.log(process_data);
                assert.equal('page_type_bbs_content',process_data.pageType);
                assert.equal('PAGE_TYPE_BBS_CONTENT',process_data.pageData.pageType);
                done();
            });

        });
    });
});