var tcwise_path = process.env.SUMERU_COV ? '../../tcwise-cov' : '../../tcwise';
var page = require(tcwise_path + '/models/logic/page.js')
    ,assert = require("assert")
    ,fs = require('fs')
    ,page_data = require(tcwise_path + '/models/dao/pageData.js').silk_request
    ,bdlog = require('comlib').bdlog
    ,config = require('../conf');

bdlog.init(config.bdlog);

var request = [];
request.siteappid=406936;
request.siteType = 6;

describe('page', function(){
    describe('#get_page_data', function(){
        it('should tpl_verions=1', function(done){
            request.src = "http://www.diyifanwen.com/qitafanwen/duhougan/index_6.htm";
            page_data(request,function(err, data){
                if(err != null) throw err;
                //var temp = JSON.stringify(data);
                // var temp =data;
                var temp =data;
                //console.log(temp);
               // console.log(JSON.parse(temp).tpl_version);
                assert.equal(0,temp.tpl_version);
                done();
            });
        });


        //case 2  post

        it('should ', function(done){
            request.src="http://detail.zol.com.cn/index.php";
            var options = {
                req : {
                    body : {
                        "x-tc-form-method":"GET",
                        "x-tc-form-charset":"gbk",
                        "c" : "SearchList",
                        "keyword" : "K900"
                    }
                }
            };
            page_data(request, options, function(err, data){
                if(err != null) throw err;
                 //  console.log(data);
                // console.log(JSON.parse(temp).tpl_version);
                 assert.equal("K900报价查询-中关村在线产品报价频道",data.page_title);
                //console.log(temp.url);
                done();
            });
        })
    })
});
/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-14
 * Time: 下午7:46
 * To change this template use File | Settings | File Templates.
 */
