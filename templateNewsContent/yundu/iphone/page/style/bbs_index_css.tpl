@charset "UTF-8";

/*reset
--------------------------------------------*/
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,p,blockquote{margin:0;padding:0;font-family:STHeiti-Light,'Hiragino Sans GB','Microsoft Yahei',Arial;}
fieldset,img{border:0}
address,caption,cite,code,dfn,em,th,var{font-style:normal;font-weight:normal}
ul,ol,dl,li,dt,dd{list-style:none}
table{border-collapse:collapse;font-size:inherit;border-spacing:0}
h1,h2,h3,h4,h5,h6{font-size:100%;line-height:1;font-weight:normal;}

/*setup
--------------------------------------------*/
html{font-size:14px !important;/* overflow:scroll;overflow:-moz-scrollbars-vertical*/}
body{background:#fff;color:#000;word-break:break-all;font-size-adjust:none;font-style:normal;font-variant:normal;font-weight:normal; text-align:left}




/* head */
.w-header{ height:43px; padding:0px 22px; text-align:center; border-top:1px solid #d2b483; border-bottom:1px solid #ae6318; position:relative; border-top-left-radius: 3px; border-top-right-radius: 3px;
background: #ffb943;
background: -moz-linear-gradient(top, #ffb943 0%, #eb7b04 100%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffb943), color-stop(100%,#eb7b04));
background: -webkit-linear-gradient(top, #ffb943 0%,#eb7b04 100%);
background: -o-linear-gradient(top, #ffb943 0%,#eb7b04 100%);
background: -ms-linear-gradient(top, #ffb943 0%,#eb7b04 100%);
background: linear-gradient(to bottom, #ffb943 0%,#eb7b04 100%); 
}
.w-header h1{ line-height:43px; height:43px; color:#fff; font-size:18px; font-weight:bold; text-align:center;}
.w-header h1 a{ color:#fff; text-decoration:none;}
.back-home{ position:absolute; left:22px; top:13px; background:url(http://siteapp.baidu.com/static/appui/plain/img/w-icon.png) no-repeat  0px 0px; background-size:18px  40px; width:18px; height:16px;}
.back-nav{ position:absolute; right:22px; top:13px; background:url(http://siteapp.baidu.com/static/appui/plain/img/w-icon.png) no-repeat  -1px -19px; background-size:18px  40px; width:16px; height:16px;}
/* head end */



/*w-mypos*/
.w-mypos{  line-height:39px; height:39px;   padding:0px 4px; border-top:1px solid #e1e1e1; border-bottom:1px solid #d6d6d6; background:#f5f5f5;}
/*.w-mypos li{ float:left; max-width:25%; position:relative; background:url(http://siteapp.baidu.com/static/appui/plain/img/w-arrow3.png) no-repeat right 14px; background-size:8px 13px;  }*/
.w-mypos li,.w-mypos .last{ float:left; max-width:25%; position:relative;}
.w-mypos li{background:url(http://siteapp.baidu.com/static/appui/plain/img/w-arrow3s.png) no-repeat right 14px;}
.w-mypos .last{background:none;}
/*.w-mypos li:last-child{ background:none;}*/
.w-mypos li a{padding:0px 18px 0px 6px; text-decoration:none;color: #282828;}
.w-mypos-last{ color:#acacac; background:none; padding-left:6px;}
.f-ellipsis-c,.f-ellipsis li{text-overflow:ellipsis; -o-text-overflow:ellipsis; white-space:nowrap;  overflow:hidden; }
.f-ellipsis-a a{  display:block;text-overflow:ellipsis; -o-text-overflow:ellipsis; white-space:nowrap;  overflow:hidden;}



/*header
--------------------------------------------*/
.header{
	margin:6px 8px;
}
.header h1,.header .idx {
	font-size:16px;
	-webkit-box-sizing:border-box;
	width:100%;
    padding:10px 13px;
    word-wrap:break-word;
    color:#000 !important;
    border:1px solid #ccc;
    -webkit-border-radius:4px;
	/*text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;*/ /*CSS截断，只显示一行*/
}
.header * {
    color:#000 !important;
}
.header br {
    display:none;
}
.header .idx {color:#40403e;font-size:1.2em;}
.header span{font-size:1.2em;color:#714a0c;}
.bbs-title {
	-webkit-box-sizing:border-box;
	margin:20px 8px 20px 20px;
    font-size:18px;
    font-weight:bold;
}

/*container
--------------------------------------------*/
.container {
	margin:0;
}
.container .section {
	margin:0;
	-webkit-box-sizing:border-box;
	width:100%;
}
.section .title_info {
	background-color:#ededed;
	width:100%;
	min-height:36px;
	display:-webkit-box;
	-webkit-box-sizing:border-box;
	-webkit-box-pack:justify;
	-webkit-box-align:center;
	padding:0 6px 0 20px;
	position:relative;
}
.section h2{
	line-height:1.4;
	max-width:90%;
	color:#000 !important;
	font-size:16px !important;
}
.section h2 *{
	color:#000 !important;
	font-size:16px !important;
}
.pull_list{
    display:block;
    margin:0; padding:0;
    word-wrap:break-word;
}
.section.pull_list_fold .title_info {
    -webkit-border-radius:3px;
    border-bottom:none;
    padding-bottom:1px;
}
.section.pull_list_fold ul {
	display:none;
}
.pull_list li {
    display:block;
    position:relative;
    font-size:16px;
    width:100%;
	-webkit-box-sizing:border-box;
    border-bottom:1px solid #ccc;
    color:#6c6c6c;
	padding:10px 7px 10px 20px;
}
.pull_list li:last-child {
    border-bottom:none;
}
.list_title{
	overflow: hidden;
	text-overflow: ellipsis;
	width: 100%;
	display: block;
	white-space: nowrap;
}
.list_title a, .list_title a:link, .list_title a:visited {
	color:#6c6c6c !important;
}
.list_title_info {
	color:#ef593e;
}
.pull_list .owner_info {
	display:-webkit-box;
	-webkit-box-pack:justify;
	-webkit-box-align:center;
}
.owner_info .owner_name{
	display:block;
	color:#a2a2a2;
}
.owner_name a {
    color:#a2a2a2 !important;
}
.owner_info .pb_time{
	display:block;
	color:#a2a2a2;
}

/*footer
--------------------------------------------*/
.page_area {
    margin:12px auto;
    text-align:center;
}
.page_area .prev,.page_area .next{width: 78px;height: 37px;display:inline-block;}
.page_area .prev{float:left;text-align:right;}
.page_area .next{float:right;text-align:left;}
.page_area .page_num{margin:0 18px;height:37px;}
.page_area span,.page_area a{display:inline-block;padding:6px 12px;}


#addfav {
    right:7px !important;
}


/* page-turn */
.page-turn{ padding:16px; font-size:14px; font-weight:bold; background:#fff;zoom:1;}
.page-turn div{
	float:left; border:1px solid #c7c7c7; border-radius:2px; margin-right:12px; text-align:center; line-height:35px; height:35px; width:87px;background: #fbfbfb;
	background: -moz-linear-gradient(top, #fbfbfb 0%, #ededed 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fbfbfb), color-stop(100%,#ededed ));
	background: -webkit-linear-gradient(top, #fbfbfb 0%,#ededed  100%);
	background: -o-linear-gradient(top, #fbfbfb 0%,#ededed  100%);
	background: -ms-linear-gradient(top, #fbfbfb 0%,#ededed  100%);
	background: linear-gradient(to bottom, #fbfbfb 0%,#ededed  100%);
	margin-bottom:12px;
}
.page-turn .page-turn-forbid{ color:#acacac; background:#f5f5f5;}
.page-turn a{ color:#282828;}
.page-turn .page-turn-n{ padding-right:40px;position:relative;zoom:1;width: 80px;}
.page-turn-n span{display:inline-block;padding-left:3px;/*float:left;*/}
.page-turn-n-current{ color:#f17400; padding-right:2px;}
.page-turn-n-total{ padding-left:2px; /*padding-right:16px; background:url(http://siteapp.baidu.com/static/appui/plain/img/w-arrow2.png) no-repeat right center; background-size:10px 6px;*/width:55px;text-align: left;}
/*select*/
.page-turn-ndiv{}
/*.page-turn-n-form{ position:absolute; left:0px; top:-1px; text-align:left; width:124px; }*/
.page-turn-n-form{ left:0px; top:-1px; text-align:left; width:124px; }
.page-turn-n-select{
	float:left; width:88px; display:inline-block; height:37px;
	-webkit-box-sizing: border-box; -webkit-appearance: none; opacity:0;
	margin-right:-1px;position:absolute;top:0;left:0;*top:15px;
	FILTER: Alpha(opacity=0);
}
.page-turn-n-submit{
	float:left; width:36px; display:inline-block;
	-webkit-box-sizing: border-box; line-height:36px; height:36px;
	margin-top:1px;border:1px solid transparent;border-left:1px solid #c7c7c7; background-color:transparent;
	position:absolute;top:0px;*top:-1px;left:82px;*left:82px;
}

/* foot */
.w-footer{background:#ebebeb; padding:14px 16px; border-top:1px solid #e1e1e1; font-size:12px; color:#000;}
.w-search{
	height:26px; font-size:12px; border:1px solid #ccc;
	background: #fbfbfb; 
	background: -moz-linear-gradient(top, #fbfbfb 0%, #e2e2e2 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fbfbfb), color-stop(100%,#e2e2e2 ));
	background: -webkit-linear-gradient(top, #fbfbfb 0%,#e2e2e2  100%);
	background: linear-gradient(to bottom, #fbfbfb 0%,#e2e2e2  100%);
	position:relative;
}
.w-search-btn{ float:right; width:69px;  height:24px;  display:inline-block; border:1px solid  transparent; border-left:none;  text-align:center;  background-color: transparent;}
.w-search-text{ margin-right:70px;position:relative;}
.w-search-text-input{
	line-height:26px; height:26px;width:100%;
	text-indent:0.5em; border:none;
	border-right:1px solid #ccc;display:inline-block;-moz-box-shadow:1px 1px 2px #ddd inset;-webkit-box-shadow:1px 1px 2px #ddd inset;shadow:1px 1px 2px #ddd inset;
	position: absolute; top: 0px; left: 0px;
}
.fgrey{ color:#959595;}
.w-footer-tel{ font-size:12px; line-height:22px;  border-bottom:1px solid #e1e1e1; padding:9px 0px 11px; }
.w-footer-tel p{ position:relative; padding-left:60px;}
.w-footer-tel .fgrey{ position:absolute; left:0px ;top:0px; line-height:22px; height:22px;  }
.w-footer-copr{ font-size:13px;  padding-top:10px; text-align:center; line-height:22px;}
.w-footer-copr a{ color:#000; padding:0px 10px;}
.w-footer-copr .back-top{ float:right;color:#959595; background:url(http://siteapp.baidu.com/static/appui/plain/img/w-back-top.png) no-repeat left 4px; background-size:10px 11px;width:50px; text-align:center; padding:0px;}
/* foot end */