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
<div class="vus-h-px-200 vus-relative mg-bg-cover" style="background-image: url(${ctx}/f/res/image/${category.parent.parent.parent.id == 1 ? 'news-banner.jpg' : 
	category.parent.parent.parent.id == 10 ? 'brand-expo-banner.jpg' : 
	category.parent.parent.parent.id == 3 ? 'expo-related-banner.jpg' : 
	category.parent.parent.parent.id == 4 ? 'service-banner.jpg' : 
	category.parent.parent.parent.id == 5 ? 'job-banner.jpg' : 
	'brand-expo-banner.jpg'
})"></div>
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
	<div class="vus-clearfix vus-pb-20 vus-pt-20">
		<h1 class="vus-h3 vus-pt-30 vus-pb-30 vus-border-bottom-1 vus-text-center">
			${title}
		</h1>
		<div class="vus-text-center vus-color--gray">
			<c:if test="${releasetime!=''}">
				<span class="vus-inline-block vus-pl-10 vus-pr-10">发布于：${releasetime}</span>
			</c:if>
			<c:if test="${releasesource!=''}">
				<span class="vus-inline-block vus-pl-10 vus-pr-10">来源：${releasesource}</span>
			</c:if>
			<c:if test="${releaseuser!=''}">
			<span class="vus-inline-block vus-pl-10 vus-pr-10">作者：${releaseuser}</span>
			</c:if>
		</div>
		<div class="vus-fs-18 vus-hidden content-img vus-lh-2 vus-pt-20 vus-pb-20">
			${content}
		</div>
	</div>
	<%@include file="include/v-tip.jsp"%>
</div>
<%@include file="include/footer.jsp"%>
</body>
</html>
