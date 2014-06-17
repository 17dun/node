/**
 * Created with JetBrains WebStorm.
 * User: miaoyichan
 * Date: 13-9-3
 * Time: 下午5:51
 * To change this template use File | Settings | File Templates.
 */
var config = require('../../conf')
    ,mysql = require('mysql')
    ,bdlog = require('comlib').bdlog
    ,create_md5 = require('comlib').create_md5;
var mysql_connection = function(){
    this.connection = '';
}
/*mysql_connection.prototype.get_ad = function(host,options,callback){
    if(arguments.length == 2) {
        callback = options;
        options = [];
    }
    var mysql_config =  config.appdb;
    var index = Math.floor(Math.random()*config.appdb.backend.length);
    mysql_config.host = mysql_config.backend[index].host;
    mysql_config.port = mysql_config.backend[index].port;
    this.connection = mysql.createConnection(mysql_config);
//    console.log(this.connection);
    this.connection.connect(function(err){
        if(err != null){
            bdlog.warn('logid:'+ options.logid + ' cannot connect mysql' + ' errno:' + err);
            callback(err);
            return;
        }
    });
    var sql = "SELECT `id`, `appsid`, `appsec`, `datetime` ";
    sql += "FROM `ad_qs` WHERE `md5` = '" + create_md5(host) + "' LIMIT 1";
    this.connection.query(sql,function(err, rows, fields){
        if(err) callback(err,null);
       // console.log('aaaaaaaaaaa');
       // console.log(rows[0]);
        if(rows === undefined){
            callback(null,null);
        }else{
            callback(null,rows[0]);
        }

    });
    this.connection.end();

}


mysql_connection.prototype.set_ad = function(host, appsid, appsec, id, options,callback){
    if(arguments.length == 5) {
        callback = options;
        options = [];
    }
    var mysql_config =  config.appdb;
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
    id = id ? id : 0 ;
    id = Math.floor(id);
    appsid = this.connection.escape(appsid);
    appsec = this.connection.escape(appsec);
    set_value = {
        'appsid' : appsid,
        'appsec' : appsec,
        'datetime' : Date.now()/1000
    };
    if(id){
        query = this.connection.query("UPDATE `ad_qs` SET ? WHERE `id` = "+id, set_value,function(err,rows,fields){
            if(err) callback(err);
           // console.log(query.sql);
           // console.log("rows:"+rows);
            callback(null,rows ? rows.insertId : false);
        });
    }else{
       // console.log(this.connection);
         set_value.md5 = create_md5(host);
        query = this.connection.query("INSERT INTO `ad_qs` SET ?",set_value,function(err, rows, fields){
            if(err) callback(err);
          //  console.log(query.sql);
          //  console.log("rows:"+rows);
            callback(null,rows ? rows.insertId : false);
        })
    }
    this.connection.end();
}
*/
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

//module.exports.mysql = mysql_connection;
exports.mysql = mysql_connection;
