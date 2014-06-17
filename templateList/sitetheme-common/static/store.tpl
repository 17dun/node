{[%strip%]}
<script>
;(function(root){
    var storage = root.localStorage;
    var store = {
        enable : true,
        get : function( name ){
            return storage[name];
        },
        set : function(name,value){
            storage[name] = value;
        },
        toHtml : function(id,name){
            var dom = document.getElementById(id);
            var value = this.get(name+id);
            if(!value || value.length<100){
                this.disable();
                location.reload();
            }else{
                var css_text = document.createTextNode(value);
                dom.appendChild(css_text);
            }
        },
        evalJs : function(id,name,isEval){
            var value = this.get(name+id);
            if(!value || value.length<100){
                this.disable();
                location.reload();
            }else if(isEval){
                eval(value);
            }else{
                var sc = document.createElement('script');
                var sc_text = document.createTextNode(value);
                sc.appendChild(sc_text);
                document.body.appendChild(sc);
            }
        },
        toLocal : function(id,name){
            var dom = document.getElementById(id);
            this.set(name+id, dom.innerHTML);
        },
        disable : function(){
            this.enable = false;
            var n = new Date;
            n.setTime(n.getTime() + 3600*24*100);
            document.cookie = "sapp_ls=no;domain=" + document.domain + ";path=/;expires=" + n.toGMTString() + ";";
        }
    };
    try{
        storage["try"] = "try";
        storage['try']? storage.removeItem("try"):store.disable();
    }catch(e){
        store.disable();
    }
    root.Store = store;
})(window);
</script>
{[%/strip%]}

