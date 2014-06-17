#bbs-pwd {
	margin:6px 8px;
}
#bbs-pwd-inner {
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
#bbs-pwd * {
    color:#000 !important;
}
/*#bbs-pwd a {
    font-size:18px;
    color:#319bcc !important;
    overflow:hidden;
    text-decoration:none;
    font-weight:bold;
}*/
#bbs-pwd br {
    display:none;
}
.bbs-title {
	-webkit-box-sizing:border-box;
	margin:6px 8px 20px 8px;
    font-size:18px;
    font-weight:bold;
}
#bbs-content {
	margin:6px 0px;
}

.floor-first {
    background:#fffdfa;
    border-bottom:1px solid #c1d4e2;
}
.floor-first .floor-title {
	font-size:18px;
	font-weight:bold;
	padding:4px 7px;
	-webkit-box-sizing:border-box;
	/*text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;*/ /*CSS截断，只显示一行*/
}
.floor-header {
	color:#595959;
	padding:4px 7px;
	border-bottom:1px solid #c1d4e2;
	font-size:15px;
}
.floor-first .floor-author a {
	color:#595959;
}
.floor-first .floor-content {
	padding:7px 12px 23px 7px;
}
.floor:last-of-type {
    border-bottom-color:#e0d7ca;
}

.floor {
	margin:10px 0;
}
.floor-body {
	position:relative;
	display:table;
	width:100%;
	padding:10px 11px 10px 0;
	*padding-right:0px;
	border-bottom:1px solid #CCC;
	
	margin-bottom:2px;
}
.floor-body-inner {
	display:table-row;
}

.floor-content {
	display:table-cell;
	/*overflow:hidden;*/
    word-wrap:break-word;
	word-break:break-all;
	padding-left:20px;
}
.floor-content img {
	max-width:100%;
}
.floor-header, .floor-footer {
    /*padding:0 10px;*/
    display:-webkit-box;
    -webkit-box-align:start;
    word-wrap:break-word;
    color:#595959;
    padding:0 20px;
}
.floor-author {
    -webkit-box-flex:1;
    min-width:6em;
    margin-right:0.5em;
    font-weight:normal !important;
	/*text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;*/ /*CSS截断，只显示一行*/
}
.floor .floor-author {
}

.floor-author * {
    color:#595959;
    text-decoration:none;
}
.floor-time {
	-webkit-box-sizing:border-box;
    -webkit-box-flex:1;
    text-align:right;
    min-width:7em;
	/*text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;*/ /*CSS截断，只显示一行*/
}

#bbs-pages {
    display:-webkit-box;
    -webkit-box-orient:horizontal;
    -webkit-box-pack:center;
    -webkit-box-align:center;
    /*min-height:40px;*/
    /*padding:3px 4px;*/
    text-align:center;
    font-size:18px;
}
#bbs-pages * {
    display:inline-block;
    background:none;
    margin:0;
    padding:5px 10px;
}
#bbs-pages strong {
}
#bbs-pages a {
    color:#319bcc;
    border:1px solid transparent;
    text-decoration:none;
}
.bbs-pages-tapped {
    background:#d2e7f1 !important;
    border-color:#44a4d1 !important;
    border-radius:3px;
}
