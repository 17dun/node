var express = require('express')
    , router = require('./router')
    , config = require('./conf/tcwiseConf')
    , genLogid = require('comlib').genLogid ;


var app = express();

//app.use(express.logger());
app.use(express.cookieParser());
app.use(express.responseTime());
app.use(express.bodyParser());
app.use(express.favicon());
app.disable('x-powered-by');
app.set('port',config.server.port);
app.use(function(req, res, next){
    //actually we should not inject res, the better way is to use res.init to record info
    //but res.init is used to render template, so ...
    //res.headers = {};
    res.locals.req_info = {};
    if(req.get('Tc-Default-Logid')){
        res.locals.req_info.logid = req.get('Tc-Default-Logid');
    }else{
        res.locals.req_info.logid = genLogid();
    }
    res.locals.req_info.req_ip = req.ip;
    res.locals.req_info.time = Date.now();
    res.locals.req_info.pid = process.pid;
    res.locals.req_info.errno = 0;
    res.locals.req_info.http_code = -1;
    res.locals.req_info.route  = null;
    res.locals.req_info.req_uri = req.originalUrl;
    res.locals.req_info.protocol  = req.protocol;
    res.locals.req_info.cookies  =req.cookies;
    res.locals.req_info.ua  =req.get("User-Agent");

    next();
});

// development only
if ('development' == app.get('env')) {
    app.use(express.errorHandler({dumpExceptions:true,showStack:true}));
}

// production only
/*if ('production' == app.get('env')) {
    app.set('db uri', 'n.n.n.n/prod');
}*/

//call router��dispatch url
router.init(app);

module.exports = app;