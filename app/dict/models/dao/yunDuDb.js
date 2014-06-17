
var config = require("../../conf/tcwiseConf")
    ,mysql = require('mysql')
    ,bdlog = require('comlib').bdlog
    ,create_md5 = require('comlib').create_md5;
var mysql_connection = function(){
    this.connection = '';
}

mysql_connection.prototype.get_baidu_site_link = function(host_list,options,callback){
    //console.log('www');
    if(arguments.length == 2) {
        callback = options;
        options = [];
    }
    var mysql_config =  config.appdb;
   // console.log(mysql_config);
    //bdlog.debug('logid:' + options.logid + ' mysql_config:' + JSON.stringify(mysql_config));
   // console.log(mysql_config);
    var index = Math.floor(Math.random()*config.appdb.backend.length);
    mysql_config.host = mysql_config.backend[index].host;
    mysql_config.port = mysql_config.backend[index].port;
    this.connection = mysql.createConnection(mysql_config);
    this.connection.connect(function(err){
        if(err != null){
            bdlog.warn('logid:'+ options.logid + ' cannot connect mysql' + ' errno:' + err);
            callback(err);
            return;
        }
    });

    if(options.dict == 23){
        var sql = "SELECT `site`,`wapsite`,`app_state`,`is_dns_validate` FROM `site_basic_info` WHERE `app_state` = 6  AND `site_type` = 2 AND `site` IN(";
    }else if(options.dict == 22){
        var sql = "SELECT `site`,`wapsite`,`app_state`,`is_dns_validate` FROM `site_basic_info` WHERE `app_state` = 6 AND `site_type` <> 2 AND `site` IN(";
    }

    for(var i=0; i<host_list.length; i++){
            sql += this.connection.escape(host_list[i])+",";
            //sql += "'"+this.connection.escape(host_list[i])+"',";
    }
    sql = sql.toString().replace(/,$/,'');
    sql += ')';
    //bdlog.debug('logid:' + options.logid + ' sql:' + sql);
    //console.log(sql);
    // console.log(this.connection);
    //this.connection.query('select count(*) from site_basic_info where app_state=6',function(err,rows,fields){
    this.connection.query(sql,function(err,rows,fields){
       //console.log(rows);
        callback(null,rows);
    });
    this.connection.end();
}

exports.mysql = mysql_connection;
