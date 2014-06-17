var config = require('../conf') ;
var app_name = config.app_name;
//console.log('./'+app_name+'App');
module.exports = require('./'+app_name+'App');
