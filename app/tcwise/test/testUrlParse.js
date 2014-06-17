

/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-8
 * Time: 下午3:41
 * To change this template use File | Settings | File Templates.
 */
var url = require('url')
    ,assert = require("assert")
    ,url_parse = require('comlib').url_parse
    ,url_format = require('comlib').url_format
    ,url_path_to_query = require('comlib').url_path_to_query;


var url_parse_res = {
    protocol: 'http:',
    slashes: true,
    host: 'www.7y7.com',
    hostname: 'www.7y7.com',
    href: 'http://www.7y7.com/pic/71/15071.html',
    pathname: '/pic/71/15071.html',
    path: '/pic/71/15071.html' };
//var src ='http://www.7y7.com/pic/71/15071.html';
var src ='HTTP://www.7y7.com/pic/71/15071.html';
describe('test_url_parse',function(){
      it('it should be /pic',function(){
          //console.log(url.parse(src));
          var url_parse_test = url.parse(src);
          var url_info = {};
          url_info.path = '/pic/71/15071.html';
          url_info.path = url_info.path.toString().replace(/(^\/[^\/]+)((.*)?)/,'$1');
          //console.log(url_info.path);
          assert.equal('/pic',url_info.path);
      })
})

describe('urlProcess',function(){
    describe('#url_parse',function(){
        it('it should be http://123.com',function(){
            var src = "123.com";
            //console.log(src);
              var res_url = url_format(src);
             // console.log(res_url);
              assert.equal('http://123.com',res_url);
        })
    })
})

describe('urlProcess',function(){
    describe('#url_parse',function(){
        it('it should be 123.com',function(){
            var src ='HTTP://www.7y7.com/pic/71/15071.html';
            //console.log(src);
            var res_url = url_parse(src);
            //console.log(res_url.host);
            assert.equal('www.7y7.com',res_url['host']);
        })
    })
})

describe('urlProcess',function(){
    describe('#url_path_to_query',function(){
        it('it should be from:844b dict:21',function(){
            var path ='/from=844b/bd_page_type=1/ssid=0/uid=CB5B97A920B24F4380DDFE9BA8B2B882/pu=sz@1320_1001,ta@iphone_2_2.3_3_533,usm@4/w=0_10_电子书/t=iphone/l=3/tc';
            var query = { baiduid: '5C3D9DF23F1D41049D85FE9F62797F25',
                srd: '1',
                dict: '21',
                xdebug: '1',
                src: 'http://novel.feiku.com/218422/12820' };
            //console.log(src);
            var res = url_path_to_query(path,query);
            //console.log(res);
            assert.equal('844b',res['from']);
            assert.equal('21',res['dict']);
        })
    })
})


