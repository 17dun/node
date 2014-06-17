/**获取网站的icon**/
var url = require("url");
var siteIconMap = require("../../conf/iconSite.online");

/**倒置数据的key**/
function reverseKey(obj){
    for(var i in obj){
        var hostKey = getHostNameArray(i).join(".");
        obj[hostKey] = obj[i];
        delete obj[i];
    }
}
reverseKey(siteIconMap.data);

function getHostNameArray(hostName){
        var resultArray = hostName.split(".");
        return resultArray.reverse();
}

function getSiteIcon(urlSRC){
      var siteURL = url.parse(urlSRC);
      var hostname = siteURL.hostname;
      var hostNameArray = getHostNameArray(hostname);
      if(hostNameArray == null || hostNameArray.length <=1){
               return null;
      }
      var tmpKey = "";
      for(var i =0,l = hostNameArray.length;i<l;i++ ){
          tmpKey +=hostNameArray[i];
          if(siteIconMap.data[tmpKey] != null){
             //console.log(siteIconMap.baseURL+siteIconMap.data[tmpKey]);
             return  siteIconMap.baseURL+siteIconMap.data[tmpKey];
          }else{
             tmpKey +=".";
          }
      }
}

module.exports = getSiteIcon;