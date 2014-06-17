/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-8-30
 * Time: 下午5:30
 * To change this template use File | Settings | File Templates.
 */
var assert = require("assert");
var http_request = require('comlib').http_request;
var qs=require('querystring')
    ,config = require('../conf')
    ,bdlog = require('comlib').bdlog;

bdlog.init(config.bdlog);
var options = {
    hostname:'www.baidu.com',
   // hostname:'muadmin.baidu.com',
   // path:'/api/getSiteAppInfo/html?domain=sina.com',
    port: 80,
    method: 'GET'
};
describe('http', function(){
    describe('#request',function(){
         it('it should return the body of www.baidu.com',function(done){
             http_request(options,function(err,data){
                  assert.equal(true,err==null );
                  if(err) throw err;
                 // console.log(data.toString());
                  done();
              })
          })
    })
});

/**
 *  post request
 */
var options_post = {
    host: '10.42.83.16',
    port:  8851,
        path: '/webapp?structpage=1&from=844b&bd_page_type=1&ssid=0&uid=CB5B97A920B24F4380DDFE9BA8B2B882&pu=sz@1320_1001,ta@iphone_2_2.3_3_533,usm@4&w=0_10_电子书&t=iphone&l=3&tc&srd=1&dict=21&nocache=1&siteappid=406936&preview=0&version=0&siteType=6&onlyspdebug=1&recache=1&src=http://home.feiku.com/feiku/search/go',
    method: 'POST',
    headers:
    { Host: 'internal_wise_domain.baidu.com',
        'X-TC-Ori-Uri': '/from=844b/bd_page_type=1/ssid=0/uid=CB5B97A920B24F4380DDFE9BA8B2B882/pu=sz%401320_1001%2Cta%40iphone_2_2.3_3_533%2Cusm%404/w=0_10_%E7%94%B5%E5%AD%90%E4%B9%A6/t=iphone/l=3/tc?srd=1&dict=21&src=http%3A%2F%2Fhome.feiku.com%2Ffeiku%2Fsearch%2Fgo&nocache=1',
        'X-Forwarded-For': null,
        'Tc-Default-Logid': 1379468994746227,
        Referer: 'http://10.46.192.34:8008/from=844b/bd_page_type=1/ssid=0/uid=CB5B97A920B24F4380DDFE9BA8B2B882/pu=sz%401320_1001%2Cta%40iphone_2_2.3_3_533%2Cusm%404/w=0_10_%E7%94%B5%E5%AD%90%E4%B9%A6/t=iphone/l=3/tc?baiduid=5C3D9DF23F1D41049D85FE9F62797F25&srd=1&dict=21&src=http%3A%2F%2Fnovel.feiku.com%2F218422%2F12820',
        Cookie: {} },
    appid: 406936,
        retry: 0,
    timeout: 30000,
    server_name: 'silkserver',
    write_data:
    { 'x-tc-form-method': 'GET',
        'x-tc-form-charset': 'UTF-8',
        type: '1',
        keywords: 'dd' } };

describe('http', function(){
    describe('#request()',function(){
       it('it should be WIDE_STRUCT',function(done){
            options_post.write_data =  qs.stringify(options_post.write_data);
            options_post.headers['Content-Length'] = options_post.write_data.length;
           //options_post.headers['Transfer-Encoding'] = "chunked";
            http_request(options_post,function(err,data){
                //console.log(data);
                assert.equal('WIDE_STRUCT',JSON.parse(data.toString()).struct_type );
                assert.equal('WIDE_STRUCT',JSON.parse(data.toString()).struct_type );
                if(err) throw err;
                //console.log(JSON.parse(data.toString()));
               done();
           })
        })
   })
});
