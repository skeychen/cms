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
<div class="vus-h-px-200 vus-relative mg-bg-cover" style="background-image: url(${ctx}/f/res/image/expo-date-banner.jpg)"></div>

<div class="mg-page-top vus-bg--white vus-container vus-relative vus-pl-20 vus-pr-20 vus-pt-5">
	<div class="vus-pt-15 vus-pb-15 vus-clearfix vus-border-bottom-1">
		<img src="${ctx}/f/res/image/home.png" class="vus-img vus-w-px-24 vus-inline-block vus-align-middle">
		<div class="vus-inline-block vus-align-middle vus-fs-16 vus-pl-5">
			当前位置：<a href="${ctx}/index.html">首页</a>
			<c:if test="${category.parent.parent != category.parent}"> &gt; <a href="${category.parent.parent.url}">${category.parent.parent.name}</a></c:if>
			<c:if test="${category.parent != category}"> &gt; <a href="${category.parent.url}">${category.parent.name}</a></c:if>
			 &gt; ${category.name}
		</div>
	</div>
	<div class="vus-clearfix">
		<div class="mg-menu vus-fr vus-pt-20 vus-pb-20">
			<div class="title vus-text-center vus-color--white vus-fs-20">近期展会</div>
			<div id="nowbox"></div>

<%--
			<!-- 广告 -->
			<ul class="vus-pt-100 vus-clearfix">
				<li class="vus-w-100 vus-h-px-200 vus-hidden vus-mb-30 vus-relative">
					<a href="#" class="mg-bg-cover hover vus-anim-all" style="background-image: url(http://mice-gz.org/f/img/201907/1564383185479.jpg)"></a>
					<div class="mg-bg-rgba-50 vus-pt-5 vus-pb-5 vus-pl-10 vus-pr-10 vus-text-ellipsis vus-absolute vus-position-bottom vus-position-left vus-w-100">
						<a href="#" class="vus-color--white">进博会倒计时100天 上海准备好了</a>
					</div>
				</li>
				<li class="vus-w-100 vus-h-px-200 vus-hidden vus-mb-30 vus-relative">
					<a href="#" class="mg-bg-cover hover vus-anim-all" style="background-image: url(http://mice-gz.org/f/img/201907/1564112515791.jpg)"></a>
					<div class="mg-bg-rgba-50 vus-pt-5 vus-pb-5 vus-pl-10 vus-pr-10 vus-text-ellipsis vus-absolute vus-position-bottom vus-position-left vus-w-100">
						<a href="#" class="vus-color--white">北京世园会“暑期消夏”模式开启</a>
					</div>
				</li>
			</ul>
--%>
		</div>



<div class="mg-content vus-fl vus-pb-20 vus-pt-20">
	<div class="vus-pb-20 vus-clearfix">
		<div class="vus-fr">
			<select id="dyear" class="vus-input vus-w-px-100 vus-ml-10">
				<c:forEach var="d" begin="2018" end="${year+1}">
				<option value="${d}">${d}</option>
				</c:forEach>
			</select>
		</div>
		<div class="mg-lh-40 vus-fr vus-pr-5 vus-fs-16">年份选择</div>
	</div>
	<div id="d_ym" class="timeline vus-relative">
		<div class="arrow vus-absolute vus-position-left vus-w-px-16 vus-h-px-16"><img src="${ctx}/f/res/image/arrow2.png" class="vus-img"></div>
		<div class="arrow vus-absolute right vus-w-px-16 vus-h-px-16"><img src="${ctx}/f/res/image/arrow2.png" class="vus-img"></div>
		<c:forEach var="d" begin="1" end="11" step="2">
			<div v="${d}" class="t-item vus-fl vus-text-center vus-zindex-2 vus-relative vus-cursor-pointer">
				<div id="d_m${d}" class="ym vus-h-px-25 vus-fs-18" v="${d}">${d}月</div>
				<img src="${ctx}/f/res/image/timeline-top.png" class="vus-inline-block">
			</div>
			<div v="${d+1}" class="t-item bottom vus-fl vus-text-center vus-zindex-2 vus-relative vus-cursor-pointer">
				<img src="${ctx}/f/res/image/timeline-bottom.png" class="vus-inline-block">
				<div  id="d_m${d+1}" class="ym vus-h-px-25 vus-fs-18" v="${d+1}">${d+1}月</div>
			</div>
		</c:forEach>
	</div>
	<!-- 类别 -->
	<div class="vus-pt-30">
		<div id ="d_ptype" class="search vus-clearfix vus-relative vus-hidden vus-border-1 vus-fs-16">
			<dl class="vus-clearfix vus-pt-10 vus-pb-10 vus-pl-10 vus-pr-10">
				<dt class="vus-w-px-130 vus-fl vus-color--gray">轻工化工消费：</dt>
				<dd class="mg-calc-10 vus-fr">
					<div class="mg-calc-4 vus-fl vus-hidden js-search-item" style="height: 24px;">
						<span class="vus-mr-15 vus-cursor-pointer mg-color-1" vv="不限">不限</span>
						<span class="vus-mr-15 vus-cursor-pointer">建材卫浴</span>
						<span class="vus-mr-15 vus-cursor-pointer">玻璃门窗</span>
						<span class="vus-mr-15 vus-cursor-pointer">地材石材</span>
						<span class="vus-mr-15 vus-cursor-pointer">珠宝钟表</span>
						<span class="vus-mr-15 vus-cursor-pointer">婚庆用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">摄影摄像</span>
						<span class="vus-mr-15 vus-cursor-pointer">成人用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">老年产业</span>
						<span class="vus-mr-15 vus-cursor-pointer">残疾殡葬</span>
						<span class="vus-mr-15 vus-cursor-pointer">家电照明</span>
						<span class="vus-mr-15 vus-cursor-pointer">家具家居</span>
						<span class="vus-mr-15 vus-cursor-pointer">家用纺织</span>
						<span class="vus-mr-15 vus-cursor-pointer">医疗医药</span>
						<span class="vus-mr-15 vus-cursor-pointer">保健用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">生物技术</span>
						<span class="vus-mr-15 vus-cursor-pointer">农产农资</span>
						<span class="vus-mr-15 vus-cursor-pointer">畜牧饲料</span>
						<span class="vus-mr-15 vus-cursor-pointer">花卉植保</span>
						<span class="vus-mr-15 vus-cursor-pointer">广告技术</span>
						<span class="vus-mr-15 vus-cursor-pointer">显示设备</span>
						<span class="vus-mr-15 vus-cursor-pointer">零售业</span>
						<span class="vus-mr-15 vus-cursor-pointer">服装面料</span>
						<span class="vus-mr-15 vus-cursor-pointer">鞋帽箱包</span>
						<span class="vus-mr-15 vus-cursor-pointer">纺织制衣</span>
						<span class="vus-mr-15 vus-cursor-pointer">劳保用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">安防消防</span>
						<span class="vus-mr-15 vus-cursor-pointer">警用防护</span>
						<span class="vus-mr-15 vus-cursor-pointer">体育用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">户外休闲</span>
						<span class="vus-mr-15 vus-cursor-pointer">健身器材</span>
						<span class="vus-mr-15 vus-cursor-pointer">家庭用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">礼品玩具</span>
						<span class="vus-mr-15 vus-cursor-pointer">办公用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">宠物用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">水族用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">鱼具钓具</span>
						<span class="vus-mr-15 vus-cursor-pointer">美容美发</span>
						<span class="vus-mr-15 vus-cursor-pointer">个人护理</span>
						<span class="vus-mr-15 vus-cursor-pointer">日化原料</span>
						<span class="vus-mr-15 vus-cursor-pointer">酒店用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">餐饮设备</span>
						<span class="vus-mr-15 vus-cursor-pointer">清洁用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">化工技术</span>
						<span class="vus-mr-15 vus-cursor-pointer">涂料颜料</span>
						<span class="vus-mr-15 vus-cursor-pointer">表面处理</span>
						<span class="vus-mr-15 vus-cursor-pointer">甜食烘焙</span>
						<span class="vus-mr-15 vus-cursor-pointer">食品机械</span>
						<span class="vus-mr-15 vus-cursor-pointer">原料包装</span>
						<span class="vus-mr-15 vus-cursor-pointer">食品饮料</span>
						<span class="vus-mr-15 vus-cursor-pointer">茶叶咖啡</span>
						<span class="vus-mr-15 vus-cursor-pointer">果蔬水产</span>
						<span class="vus-mr-15 vus-cursor-pointer" v="轻工化工消费其他">其他</span>
					</div>
					<div class="vus-fr vus-cursor-pointer js-search-more">
						<span class="js-search-text vus-fs-14">更多</span>
						<img src="${ctx}/f/res/image/arrow-down.png" class="js-search-arrow vus-inline-block vus-align-middle vus-w-px-12 vus-anim-all">
					</div>
				</dd>
			</dl>
			<dl class="vus-border-top-1 vus-border-dotted vus-clearfix vus-pt-10 vus-pb-10 vus-pl-10 vus-pr-10">
				<dt class="vus-w-px-130 vus-fl vus-color--gray">重工工业设备：</dt>
				<dd class="mg-calc-10 vus-fr">
					<div class="mg-calc-4 vus-fl vus-hidden js-search-item" style="height: 24px;">
						<span class="vus-mr-15 vus-cursor-pointer mg-color-1" vv="不限">不限</span>
						<span class="vus-mr-15 vus-cursor-pointer">包装印刷</span>
						<span class="vus-mr-15 vus-cursor-pointer">橡塑技术</span>
						<span class="vus-mr-15 vus-cursor-pointer">造纸技术</span>
						<span class="vus-mr-15 vus-cursor-pointer">机械装备</span>
						<span class="vus-mr-15 vus-cursor-pointer">自动化技术</span>
						<span class="vus-mr-15 vus-cursor-pointer">3D打印</span>
						<span class="vus-mr-15 vus-cursor-pointer">冶金工业</span>
						<span class="vus-mr-15 vus-cursor-pointer">金属材料</span>
						<span class="vus-mr-15 vus-cursor-pointer">有色金属</span>
						<span class="vus-mr-15 vus-cursor-pointer">电力能源</span>
						<span class="vus-mr-15 vus-cursor-pointer">石油天然气</span>
						<span class="vus-mr-15 vus-cursor-pointer">太阳能</span>
						<span class="vus-mr-15 vus-cursor-pointer">五金模具</span>
						<span class="vus-mr-15 vus-cursor-pointer">焊接切削</span>
						<span class="vus-mr-15 vus-cursor-pointer">紧固件</span>
						<span class="vus-mr-15 vus-cursor-pointer">制冷暖通</span>
						<span class="vus-mr-15 vus-cursor-pointer">楼宇电气</span>
						<span class="vus-mr-15 vus-cursor-pointer">园林城建</span>
						<span class="vus-mr-15 vus-cursor-pointer">造船海事</span>
						<span class="vus-mr-15 vus-cursor-pointer">港口设备</span>
						<span class="vus-mr-15 vus-cursor-pointer">物流技术</span>
						<span class="vus-mr-15 vus-cursor-pointer">节能环保</span>
						<span class="vus-mr-15 vus-cursor-pointer">废水处理</span>
						<span class="vus-mr-15 vus-cursor-pointer">过滤分离</span>
						<span class="vus-mr-15 vus-cursor-pointer">建筑设备</span>
						<span class="vus-mr-15 vus-cursor-pointer">工程机械</span>
						<span class="vus-mr-15 vus-cursor-pointer">矿山机械</span>
						<span class="vus-mr-15 vus-cursor-pointer">汽车制造</span>
						<span class="vus-mr-15 vus-cursor-pointer">两轮车</span>
						<span class="vus-mr-15 vus-cursor-pointer">配件及用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">飞机制造</span>
						<span class="vus-mr-15 vus-cursor-pointer">游艇邮轮</span>
						<span class="vus-mr-15 vus-cursor-pointer">轨道交通</span>
						<span class="vus-mr-15 vus-cursor-pointer" v="重工工业设备其他">其他</span>
					</div>
					<div class="vus-fr vus-cursor-pointer js-search-more">
						<span class="js-search-text vus-fs-14">更多</span>
						<img src="${ctx}/f/res/image/arrow-down.png" class="js-search-arrow vus-inline-block vus-align-middle vus-w-px-12 vus-anim-all">
					</div>
				</dd>
			</dl>
			<dl class="vus-border-top-1 vus-border-dotted vus-clearfix vus-pt-10 vus-pb-10 vus-pl-10 vus-pr-10">
				<dt class="vus-w-px-130 vus-fl vus-color--gray">电子通讯技术：</dt>
				<dd class="mg-calc-10 vus-fr">
					<div class="mg-calc-4 vus-fl vus-hidden js-search-item" style="height: 24px;">
						<span class="vus-mr-15 vus-cursor-pointer mg-color-1" vv="不限">不限</span>
						<span class="vus-mr-15 vus-cursor-pointer">电子电器</span>
						<span class="vus-mr-15 vus-cursor-pointer">通讯技术</span>
						<span class="vus-mr-15 vus-cursor-pointer">消费电子</span>
						<span class="vus-mr-15 vus-cursor-pointer">广电网络</span>
						<span class="vus-mr-15 vus-cursor-pointer">光电技术</span>
						<span class="vus-mr-15 vus-cursor-pointer">电线电缆</span>
						<span class="vus-mr-15 vus-cursor-pointer" v="电子通讯技术其他">其他</span>
					</div>
					<div class="vus-fr vus-cursor-pointer js-search-more">
						<span class="js-search-text vus-fs-14">更多</span>
						<img src="${ctx}/f/res/image/arrow-down.png" class="js-search-arrow vus-inline-block vus-align-middle vus-w-px-12 vus-anim-all">
					</div>
				</dd>
			</dl>
			<dl class="vus-border-top-1 vus-border-dotted vus-clearfix vus-pt-10 vus-pb-10 vus-pl-10 vus-pr-10">
				<dt class="vus-w-px-130 vus-fl vus-color--gray">服务贸易文化：</dt>
				<dd class="mg-calc-10 vus-fr">
					<div class="mg-calc-4 vus-fl vus-hidden js-search-item" style="height: 24px;">
						<span class="vus-mr-15 vus-cursor-pointer mg-color-1" vv="不限">不限</span>
						<span class="vus-mr-15 vus-cursor-pointer">旅游房产</span>
						<span class="vus-mr-15 vus-cursor-pointer">文化艺术</span>
						<span class="vus-mr-15 vus-cursor-pointer">教育移民</span>
						<span class="vus-mr-15 vus-cursor-pointer">图书动漫</span>
						<span class="vus-mr-15 vus-cursor-pointer">游戏电玩</span>
						<span class="vus-mr-15 vus-cursor-pointer">游乐设备</span>
						<span class="vus-mr-15 vus-cursor-pointer">金融服务</span>
						<span class="vus-mr-15 vus-cursor-pointer">互联网</span>
						<span class="vus-mr-15 vus-cursor-pointer">加盟连锁</span>
						<span class="vus-mr-15 vus-cursor-pointer">乐器音响</span>
						<span class="vus-mr-15 vus-cursor-pointer">灯光音箱</span>
						<span class="vus-mr-15 vus-cursor-pointer">舞台设备</span>
						<span class="vus-mr-15 vus-cursor-pointer">婴童用品</span>
						<span class="vus-mr-15 vus-cursor-pointer">儿童图书</span>
						<span class="vus-mr-15 vus-cursor-pointer">婴幼教育</span>
						<span class="vus-mr-15 vus-cursor-pointer">综合贸易</span>
						<span class="vus-mr-15 vus-cursor-pointer">综合技术</span>
						<span class="vus-mr-15 vus-cursor-pointer" v="服务贸易文化其他">其他</span>
					</div>
					<div class="vus-fr vus-cursor-pointer js-search-more">
						<span class="js-search-text vus-fs-14">更多</span>
						<img src="${ctx}/f/res/image/arrow-down.png" class="js-search-arrow vus-inline-block vus-align-middle vus-w-px-12 vus-anim-all">
					</div>
				</dd>
			</dl>
			<dl class="vus-border-top-1 vus-border-dotted vus-clearfix vus-pt-10 vus-pb-10 vus-pl-10 vus-pr-10">
				<dt class="dt vus-w-px-130 vus-fl vus-color--gray">关键字：</dt>
				<dd class="mg-calc-10 vus-fr">
					<input id="keyvalue" class="vus-input small warning default vus-w-px-200 vus-fl" type="text" name="key" placeholder="请输入关键字" />
					<button type="button" class="vus-btn small warning vus-fl vus-ml-10" onclick="javascript:searchInfo()">搜索</button>
				</dd>
			</dl>
		</div>
	</div>	
	<div class="vus-pt-20 vus-clearfix">
		<ul id="dview" class="vus-list hover vus-fs-16">
		</ul>
	</div>
	<div class="vus-pt-40 vus-pb-30 vus-clearfix">
		<div class="vus-page vus-text-center" id="dpage"></div>
	</div>
</div>



		</div>
		<%@include file="include/v-tip.jsp"%>
	</div>
</div>
<%@include file="include/footer.jsp"%>
<script id="tpl" type="text/tmpl">
{{# for(var i=0; i<d.rows.length; i++){ }}
<li class="vus-border-bottom-1 vus-pt-20 vus-pb-20 vus-h-px-170 vus-clearfix">
	<div class="vus-w-px-100 vus-fl vus-text-center">
		<div class="vus-img-wrapper">
			<div class="vus-img-container vus-h-px-130">
				<div class="vus-img-inner">
					<div class="vus-bg--warning vus-fs-18 vus-color--white vus-pl-5 vus-pr-5 vus-pt-2 vus-pb-2 vus-radius-lt-4 vus-radius-rt-4">{{ parseInt(d.rows[i].pbegin/10000000000)%10000 }}-{{ parseInt(d.rows[i].pbegin/100000000)%100 }}</div>
					<div class="vus-border-1 vus-border-top-0 vus-fs-24 vus-fw-700 vus-radius-lb-4 vus-radius-rb-4">{{ parseInt(d.rows[i].pbegin/1000000)%100 }}</div>
				</div>
			</div>
		</div>
	</div>
	<div class="vus-fl vus-w-px-180 vus-pl-15 vus-pr-15">
		<div class="vus-img-wrapper">
			<a href="{{ d.rows[i].url }}" class="vus-img-container vus-h-px-130"><img src="{{ d.rows[i].img }}" class="vus-img-inner"></a>
		</div>
	</div>
	<div class="mg-calc-7 vus-fr">
		<h5 class="vus-h5 vus-text-ellipsis"><a href="{{ d.rows[i].url }}">{{ d.rows[i].title }}</a></h5>
		<div class="vus-fs-16">
			<p class="vus-text-ellipsis">{{ parseInt(d.rows[i].pbegin/1000000) }} - {{ parseInt(d.rows[i].pend/1000000) }}</p>
			<p class="vus-text-ellipsis">展厅：{{ d.rows[i].releaseuser }}</p>
			<p class="vus-text-ellipsis">网址：<a href="{{ d.rows[i].releasesource }}" class="mg-color-1 underline">{{ d.rows[i].releasesource }}</a></p>
		</div>
		<div class="vus-text-ellipsis vus-color--gray vus-fs-14 vus-text-right">{{ d.rows[i].ptype }}</div>
	</div>
</li>
{{# } }}
</script>
<script id="tplnow" type="text/tmpl">
{{# if(d.rows.length == 0){ }}
<div class="vus-pt-20 vus-pb-20 vus-pl-15 vus-pr-15 vus-bg--gray-white">
	<p class="vus-p">最近7天内暂无展会信息</p>
</div>
{{# }else{ }}
{{# for(var i=0; i<d.rows.length; i++){ }}
<div class="vus-mb-10 vus-pt-20 vus-pb-20 vus-pl-15 vus-pr-15 vus-bg--gray-white">
	<h5 class="vus-h5 vus-fw-600 vus-fs-18">{{ d.rows[i].title }}</h5>
	<p class="vus-p">{{ parseInt(d.rows[i].pbegin/1000000) }} - {{ parseInt(d.rows[i].pend/1000000) }}</p>
	<p class="vus-p">展厅：{{ d.rows[i].releaseuser }}</p>
	<p class="vus-p">主办：{{ d.rows[i].summary }}</p>
	<p class="vus-p">官网：{{ d.rows[i].releasesource }}</p>
</div>
{{# } }}
{{# } }}
</script>
<script src="${ctx}/f/res/js/laytpl.js"></script>
<script src="${ctx}/f/res/js/jskey-page-min.js"></script>
<script type="text/javascript">
var mypageobj;
var tt = laytpl(document.getElementById('tpl').innerHTML);
var json = {siteid:${site.id}, categoryid:48, ptype:"", isedit:${cms.isedit}};<%--${category.id}--%>
var mydate = new Date();
$("#dyear").val(mydate.getFullYear());
$("#d_m" + (mydate.getMonth()+1)).addClass("vus-color--orange");
$("#dyear").on("click", function(){
	mypageobj.go(1);
});
$("#d_ym .t-item").on("click", function(){
	$("#d_ym div.ym").removeClass("vus-color--orange");
	$("#d_m"+$(this).attr("v")).addClass("vus-color--orange");
	mypageobj.go(1);
});
mypageobj = $jskey.page({object:'dpage',size:999,page:1,pagesize:10, template:1, prev:"上一页",next:"下一页",
	dom:{"tag":"ul", "style":{"className":"pages large bordered warning"},
		"item":{
			"tag":"li", 
			"begin":"<a class='link'>", 
			"end":"</a>", 
			"style":{
				"className":"item", 
				"selected":"item active", 
				"disabled":"item disabled"
			}
		}
	}, fn:function(e){
	json.keyvalue = $("#keyvalue").val();//获取关键字
	json.page = e.page;
	json.pagesize = e.pagesize;
	var _y = $("#dyear").val();
	var _m = parseInt($("#d_ym div.vus-color--orange").attr("v") || 1);
	json.pbegin = (_y*100 + _m)*100;
	json.pend = (_y*100 + _m)*100 + 32;
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

var ttnow = laytpl(document.getElementById('tplnow').innerHTML);
$(function(){
	$("#d_ptype span").click(function(){
		var ptype = $(this).attr("v") || $(this).html();
		$("#d_ptype span").removeClass("mg-color-1");
		if('不限' == ptype){
			json.ptype = "";
			$("#d_ptype span[vv='不限']").addClass("mg-color-1");
		}
		else{
			$(this).addClass("mg-color-1");
			json.ptype = ptype;
		}
		mypageobj.go(1);
	});
	
	var _data = {siteid:${site.id}, categoryid:48, ptype:"", isedit:${cms.isedit}};<%--${category.id}--%>
	_data.page = 1;
	_data.pagesize = 3;
	var mydateend = new Date();
	mydateend.setTime(mydateend.getTime() + 604800000);// 7天
	_data.pbegin = ((parseInt(mydate.getFullYear())*100 + (mydate.getMonth()+1))*100+mydate.getDate());
	_data.pend = ((parseInt(mydateend.getFullYear())*100 + (mydateend.getMonth()+1))*100+mydateend.getDate());
	$.post('/cms/search/searchdata.jsp',_data, function(res){
		ttnow.render(res, function(render){document.getElementById('nowbox').innerHTML = render;});
	});
});
</script>
</body>
</html>
