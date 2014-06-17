var app = require('./app')
   , config = require('./app/tcwise/conf')
   , bdlog = require('comlib').bdlog
   , http = require('http')
   , cluster = require('cluster')
    ,numCPUs = require('os').cpus().length;


bdlog.init(config.bdlog);
app.start();



