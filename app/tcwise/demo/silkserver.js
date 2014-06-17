var http = require('http');
var querystring = require('querystring');

var mcpack = require('mcpack');

var post_data = querystring.stringify({
	'src': 'www.qq.com'
  });

var headers = {
	'Host': 'internal_wise_domain.baidu.com',
	'Content-Type': 'application/json'
};

var options = {
	host: '10.26.188.13',
	headers: headers,
	port: '8831',
	path: '/webapp?structpage=1&siteappid=1&version=0&siteType=5&logpack=1&src=http%3A%2F%2Fwww.qq.com',
	method: 'GET'
};



console.log('send request');
var req = http.request(options, function(res){
	console.log('STATUS: ' + res.statusCode);
    console.log('HEADERS: ' + JSON.stringify(res.headers));
    //res.setEncoding('utf8');
    var ret = [];
    var ret_buffer,
    	ret_obj;
    res.on('data', function(chunk){
    	var tmp_buffer = new Buffer(chunk);
    	console.log(Buffer.isBuffer(chunk));
    	console.log(chunk.length);
    	ret.push(chunk);

    });

    res.on('end', function(){

    	ret_buffer = Buffer.concat(ret);
    	ret_obj = mcpack.mcpackbuf_2_object(ret_buffer);

    	log_pack = mcpack.mcpackbuf_2_object(ret_obj.log_pack);
    	struct_data = JSON.parse(ret_obj.struct_data);

    	console.log(log_pack);
    	console.log(struct_data.url);

    });

});

req.on('error', function(e) {
  console.log('problem with request: ' + e.message);
});


req.end();
