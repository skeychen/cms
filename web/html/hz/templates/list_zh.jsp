<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%common.cms.CmsFactory cms = (common.cms.CmsFactory)request.getAttribute("cms");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0,minimal-ui"/>
<title>${category.name} - ${site.name}</title>
<meta name="keywords" content="${category.metakeywords}"/>
<meta name="description" content="${category.metadescription}"/>
</head>
<body>
<%@include file="include/header.jsp"%>
<%@include file="include/v-top.jsp"%>

<div class="mg-content small vus-fr vus-pb-20">
	<!-- 搜索条件 -->
	<div class="search vus-clearfix vus-border-1 vus-relative vus-hidden vus-fs-16">
		<dl class="vus-clearfix vus-pt-10 vus-pb-10 vus-pl-10 vus-pr-10">
			<dt class="vus-w-px-80 vus-fl vus-color--gray">日期：</dt>
			<dd id="d_pbegin" class="mg-calc-4 vus-fr">
				<span class="mg-color-1 vus-mr-15 vus-cursor-pointer vus-inline-block" v="0">所有</span>
				<span class="vus-cursor-pointer vus-mr-15 vus-inline-block" v="1">24小时内</span>
				<span class="vus-cursor-pointer vus-mr-15 vus-inline-block" v="3">近三天</span>
				<span class="vus-cursor-pointer vus-mr-15 vus-inline-block" v="7">近一周</span>
				<span class="vus-cursor-pointer vus-mr-15 vus-inline-block" v="30">近一月</span>
				<span class="vus-cursor-pointer vus-mr-15 vus-inline-block" v="365">近一年</span>
			</dd>
		</dl>
		<dl class="vus-border-top-1 vus-border-dotted vus-clearfix vus-pt-10 vus-pb-10 vus-pl-10 vus-pr-10">
			<dt class="vus-w-px-80 vus-fl vus-color--gray">城市：</dt>
			<dd class="mg-calc-4 vus-fr">
				<div id ="d_city" class="vus-hidden">
					<span class="mg-color-1 vus-mr-15 vus-cursor-pointer" v="">不限</span>
					<span class="vus-mr-15 vus-cursor-pointer" v="ABC">A B C</span>
					<span class="vus-mr-15 vus-cursor-pointer" v="DEF">D E F</span>
					<span class="vus-mr-15 vus-cursor-pointer" v="GHI">G H I</span>
					<span class="vus-mr-15 vus-cursor-pointer" v="JKL">J K L</span>
					<span class="vus-mr-15 vus-cursor-pointer" v="MNO">M N O</span>
					<span class="vus-mr-15 vus-cursor-pointer" v="PQR">P Q R</span>
					<span class="vus-mr-15 vus-cursor-pointer" v="STU">S T U</span>
					<span class="vus-mr-15 vus-cursor-pointer" v="VWX">V W X</span>
					<span class="vus-mr-15 vus-cursor-pointer" v="YZ">Y Z</span>
				</div>
				<div id="d_ptype" class="vus-pt-8 vus-pl-10 vus-pr-10 vus-pb-8 vus-bg--light vus-mt-10">
					<span class="vus-mr-15 vus-cursor-pointer" vv="ABC">澳门</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="ABC">北京</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="ABC">长春</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="ABC">重庆</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="ABC">成都</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="ABC">长沙</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="ABC">常州</span>
					
					<span class="vus-mr-15 vus-cursor-pointer" vv="DEF">东莞</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="DEF">大连</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="DEF">大庆</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="DEF">佛山</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="DEF">福州</span>
					
					<span class="vus-mr-15 vus-cursor-pointer" vv="GHI">桂林</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="GHI">广州</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="GHI">贵阳</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="GHI">哈尔滨</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="GHI">合肥</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="GHI">海口</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="GHI">惠州</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="GHI">杭州</span>
					
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">九江</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">济南</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">金华</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">嘉兴</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">揭阳</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">昆明</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">临沂</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">临夏</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">洛阳</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">兰州</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="JKL">肇庆</span>
					
					<span class="vus-mr-15 vus-cursor-pointer" vv="MNO">宁波</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="MNO">南昌</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="MNO">南京</span>				
					<span class="vus-mr-15 vus-cursor-pointer" vv="MNO">南宁</span>				
					<span class="vus-mr-15 vus-cursor-pointer" vv="MNO">南通</span>
					
					
					<span class="vus-mr-15 vus-cursor-pointer" vv="PQR">青岛</span>				
					<span class="vus-mr-15 vus-cursor-pointer" vv="PQR">泉州</span>
									
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">顺德</span>				
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">上海</span>				
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">石家庄</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">沈阳</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">三亚</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">苏州</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">深圳</span>				
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">韶关</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">天津</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="STU">太原</span>
					
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">威海</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">武汉</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">乌鲁木齐</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">无锡</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">温州</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">西安</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">厦门</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">香港</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">西宁</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="VWX">潍坊</span>
									
					<span class="vus-mr-15 vus-cursor-pointer" vv="YZ">绍兴</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="YZ">银川</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="YZ">烟台</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="YZ">义乌</span>				
					<span class="vus-mr-15 vus-cursor-pointer" vv="YZ">珠海</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="YZ">中山</span>
					<span class="vus-mr-15 vus-cursor-pointer" vv="YZ">郑州</span>				
				</div>
			</dd>
		</dl>
		<dl class="vus-border-top-1 vus-border-dotted vus-clearfix vus-pt-10 vus-pb-10 vus-pl-10 vus-pr-10">
			<dt class="dt vus-w-px-80 vus-fl vus-color--gray">关键字：</dt>
			<dd class="mg-calc-4 vus-fr">
				<input id="keyvalue" class="vus-input small warning default vus-w-px-200 vus-fl" type="text" name="key" placeholder="请输入关键字" />
				<button type="button" class="vus-btn small warning vus-fl vus-ml-10" onclick="javascript:searchInfo()">搜索</button>
			</dd>
		</dl>
	</div>	
	<div class="vus-pt-20 vus-clearfix">
		<ul id="dview" class="vus-list hover vus-fs-16">
		</ul>
	</div>
	<div id="dpage" style="text-align:center;"></div>
</div>

<%@include file="include/v-bottom.jsp"%>
<%@include file="include/footer.jsp"%>
<script id="tpl" type="text/tmpl">
{{# for(var i=0; i<d.rows.length; i++){ }}
	<li class="item">
		<a class="link vus-pt-15 vus-pb-15 vus-pr-5 vus-text-ellipsis" href="{{ d.rows[i].url }}">
			<span class="vus-fr vus-pl-10">{{ d.rows[i].releasetime.substring(0, 10) }}</span>
			{{ d.rows[i].title }}
		</a>
	</li>
{{# } }}
</script>
<script src="${ctx}/f/res/js/laytpl.js"></script>
<script src="${ctx}/f/res/js/jskey-page-min.js"></script>
<script type="text/javascript">
var tt = laytpl(document.getElementById('tpl').innerHTML);
var json = {siteid:${site.id}, categoryid:51, ptype:"", pbegin:null, isedit:${cms.isedit}};<%--${category.id}--%>
//获取今天前多少天n的日期
function getBeforeDate(n){
	var n = n;
	var d = new Date();
	var year = d.getFullYear();
	var mon=d.getMonth()+1;
	var day=d.getDate();
	if(day <= n){if(mon>1) {mon=mon-1;}
	else {year = year-1;mon = 12;}}
	d.setDate(d.getDate()-n);
	year = d.getFullYear();
	mon=d.getMonth()+1;
	day=d.getDate();
	s = year+(mon<10?('0'+mon):mon)+(day<10?('0'+day):day);  
	return s;  
}
var mypageobj = $jskey.page({object:'dpage',size:999,page:1,pagesize:10, template:1, prev:"上一页",next:"下一页", fn:function(e){
	json.keyvalue = $("#keyvalue").val();//获取关键字
	json.page = e.page;
	json.pagesize = e.pagesize;
	$.post('/cms/search/searchdata.jsp',json, function(res){
		if(e.size != res.size){
			e.size = res.size;
			e.redo();
		}
		tt.render(res, function(render){document.getElementById('dview').innerHTML = render;});
	});
}});
function searchInfo(){
	mypageobj.go(1);
}
$(function(){
	$("#d_pbegin span").click(function(){//日期下的span
		$("#d_pbegin span").removeClass("mg-color-1");
		$(this).addClass("mg-color-1");
		switch($(this).attr("v")){
			case "0":json.pbegin=null;break;
			case "1":json.pbegin=getBeforeDate(1);break;
			case "3":json.pbegin=getBeforeDate(3);break;
			case "7":json.pbegin=getBeforeDate(7);break;
			case "30":json.pbegin=getBeforeDate(30);break;
			case "365":json.pbegin=getBeforeDate(365);break;
		};
		mypageobj.go(1);
	});
	$("#d_city span").click(function(){//首字母下的span
		$("#d_city span").removeClass("mg-color-1");
		$(this).addClass("mg-color-1");
		var v = $(this).attr("v");
		if(v == ""){
			$("#d_ptype span").show();
		}else{
			$("#d_ptype span").hide();
			$("#d_ptype span[vv="+v+"]").show();
		}
	});
	$("#d_ptype span").click(function(){
		var v = $(this).attr("vv");
		var ptype = $(this).html();
		$("#d_ptype span").removeClass("mg-color-1");
		if(json.ptype == ptype){
			json.ptype = "";
		}
		else{
			$(this).addClass("mg-color-1");
			json.ptype = ptype;
		}
		mypageobj.go(1);
	});
});
</script>
</body>
</html>
