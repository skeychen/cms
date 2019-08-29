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

<div class="mg-content small vus-fr vus-pb-20 vus-text-center"><%-- vus-pt-20--%>
	<h1 class="vus-h1 vus-pt-50 vus-pb-30">统计调研</h1>
	<div class="vus-fs-20">
		<p class="vus-p">非常感谢您的参与配合！</p>
		<p class="vus-p">请对照贵企业属性，选择下放对应问卷填写！</p>
		<p class="vus-p">请使用企业用户账号填报问卷。</p>
		<p class="vus-p">如有疑问，请致电：020-84326939</p>
	</div>
	<div class="vus-pt-50 vus-pb-50 vus-fs-18">
		<a href="#" class="mg-service-link vus-inline-block vus-pl-15 vus-pr-15">
			<img src="${ctx}/f/res/image/service-tjdy-1.png" class="vus-img vus-mx-auto vus-anim-all">
			<div class="vus-pt-10">酒店会议</div>
		</a>
		<a href="#" class="mg-service-link vus-inline-block vus-pl-15 vus-pr-15">
			<img src="${ctx}/f/res/image/service-tjdy-2.png" class="vus-img vus-mx-auto vus-anim-all">
			<div class="vus-pt-10">搭建企业</div>
		</a>
		<a href="#" class="mg-service-link vus-inline-block vus-pl-15 vus-pr-15">
			<img src="${ctx}/f/res/image/service-tjdy-3.png" class="vus-img vus-mx-auto vus-anim-all">
			<div class="vus-pt-10">展览场馆</div>
		</a>
		<a href="#" class="mg-service-link vus-inline-block vus-pl-15 vus-pr-15">
			<img src="${ctx}/f/res/image/service-tjdy-4.png" class="vus-img vus-mx-auto vus-anim-all">
			<div class="vus-pt-10">组展企业</div>
		</a>
		<a href="#" class="mg-service-link vus-inline-block vus-pl-15 vus-pr-15">
			<img src="${ctx}/f/res/image/service-tjdy-5.png" class="vus-img vus-mx-auto vus-anim-all">
			<div class="vus-pt-10">品牌展会</div>
		</a>
	</div>
	
</div>
<%@include file="include/v-bottom.jsp"%>
<%@include file="include/footer.jsp"%>
</body>
</html>
