var log = require('../library/bdlog');
var path = require('path');

console.log(__dirname);
log.init({
    'level': 4,
    'path': __dirname + '/test.log' 


});
log.log('sdfdsfdsf');
log.warn('[test]', 'sdfdsfdsfsdfdsf');
