/**
 * 为了能再页面中使用require
 * @type {{Object}}
 */
var xn = {},require,define;
require = xn.use = function() {
	var arr = [];
	for ( var i = 0, il = arguments.length; i < il; i++) {
		arr.push(arguments[i]);
	}
	xn._cache_use.push(arr);
};
define = xn.create = function() {
	var arr = [];
	if(arguments.length < 3){
		console.error("在页面上使用define 参数不能少于3个，不能缺少 module name");
		return;
	}
	for ( var i = 0, il = arguments.length; i < il; i++) {
		arr.push(arguments[i]);
	}
	xn._cache_create.push(arr);
};

xn._cache_use = new Array();
xn._cache_create = new Array();
window.xn =xn;
window.require =require;
window.define = define;
