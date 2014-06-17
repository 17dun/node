#sitapp建站 static to local文档

##文件说明
- store.js; localstorage主逻辑文件；
- data.json
本模版所使用的静态资源文件，json格式，如下

		{
			css_head: "yi-min.css",
			js_lib: "lib-min.js",
			js_main: "yi-min.js",
		}

- lib-min.js
本模版所使用的js库文件

- yi-min.css
本模版所使用的css文件

- yi-min.js
本模版所使用的js文件

##主要Store.js 代码
	<script>
	;(function(root){
	    var storage = root.localStorage;
	    var store = {
			//localStorage是否可用
	        enable : true,
			//localStorage 存储
	        get : function( name ){
	            return storage[name]; 
	        },
			//localStorage 取值
	        set : function(name,value){
	            storage[name] = value;
	        },
			//获取localStorage值到html中
	        toHtml : function(id,name){
	            var dom = document.getElementById(id);
	            var value = this.get(name+id);
	            if(!value || value.length<100){
	                this.disable();
	                location.reload();
	            }else{
	                dom.innerHTML = value;
	            }
	        },
			//获取localStorage的js值，并执行；
	        evalJs : function(id,name){
	            var value = this.get(name+id);
	            if(!value || value.length<100){
	                this.disable();
	            }else{
	                eval(value);
	            }
	        },
			//获取dom值存储为localStorage；
	        toLocal : function(id,name){
	            var dom = document.getElementById(id);
	            this.set(name+id, dom.innerHTML);
	        },
			//禁用local，并设置禁用cookie；
	        disable : function(){
	            this.enable = false;
	            var n = new Date;
	            n.setTime(n.getTime() + 3600*24*100);
	            document.cookie = "sapp_ls=no;domain=" + document.domain + ";path=/;expires=" + n.toGMTString() + ";";
	        }
	    };
		//有的浏览器可禁用本地存储(小米)，依然可以读取信息，只是返回不了值；
		//safai的隐私浏览下操作storage出错
	    try{
	        storage["try"] = "try";
			storage["try"]?storage.removeItem("try"):store.disable();
	    }catch(e){
	        store.disable();
	    }
	    root.Store = store;
	})(window);
	</script>

##主要Store.php 代码
	private function getThemeStatic($tpl, $theme=0){
	        $static_path = $tpl->getTemplateDir(0).'sitetheme-'.$theme.'/static/';
	        $static_data = json_decode(file_get_contents($static_path.'data.json'));
	        $cookie_lv = $_COOKIE['sapp_theme_'.$theme];
	        $cookie_islv = $_COOKIE['sapp_ls'];
	        $expire  = time()+3600*24*100;
	        $cookie_new = array();
	        $cookie_ary = array();
	        $statics = array();
	        if(!$cookie_lv || $cookie_islv==="no"){
	            foreach ($static_data as $key => $value) {
	                $md5 = substr(md5_file($static_path.$value),0,5);
	                $statics[$key] = file_get_contents($static_path.$value);
	                $cookie_new[] = $key.'@'.$md5;
	            }
	            if($cookie_islv==="no"){
	                setcookie('sapp_ls','no',$expire);
	                setcookie('sapp_theme_'.$theme,'',time()-3600);
	            }else{
	                setcookie('sapp_theme_'.$theme,implode($cookie_new,","),$expire);
	            }
	        }elseif($cookie_lv){
	            $cookie_lv =  explode(",", $cookie_lv);
	            foreach($cookie_lv as $key => $value){
	                $cookie_kv = explode("@", $value);
	                $cookie_ary[$cookie_kv[0]] = $cookie_kv[1];
	            }
	            foreach ($static_data as $key => $value) {
	                $md5 = substr(md5_file($static_path.$value),0,5);
	                if($cookie_ary[$key]!==$md5){
	                    $statics[$key] = file_get_contents($static_path.$value);
	                }
	                $cookie_new[] = $key.'@'.$md5;
	            }
	            setcookie('sapp_theme_'.$theme,implode($cookie_new,","),$expire);
	        }
	        return $statics;
	    }

##执行顺序

cookie值：
sapp_ls 如果有这个值说明不支持local，js css内嵌；
sapp_theme_x:filename@md5,filename1@md5 data.json各个key对应文件的md5值，如果文件md5不等侧下发文件内容

**请求过程**：

发请求---》查看cookie值(sapp_ls,sapp_theme_x)---》解析data.json和cookie值---》比较data.json对应文件的md5与cookie是否相等---》下发静态文件和下发新cookie---》如果有对应的静态文件侧把文件存储到本地---》出现异常或者不可用local客户端下发禁用local的cookie；


