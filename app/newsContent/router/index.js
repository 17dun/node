var config = require('../conf');
var app_name = config.app_name;
module.exports = require('./'+app_name+'Router');