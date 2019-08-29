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
	<div class="vus-clearfix mg-brand">
		<div class="vus-pt-20 vus-pb-20 vus-clearfix">
			<ul class="masonry-grid grid-list vus-hidden">
				<c:forEach items="${datalist}" var="d">
				<li class="grid-item vus-hidden vus-fl vus-mr-20 vus-mb-20 vus-pl-4 vus-pt-4 vus-pr-4 vus-pb-4 vus-border-1 vus-shadow-10">
					<a href="${d.url}"><img src="${d.img}" class="vus-img"></a>
					<div class="tit vus-mt-15 vus-mb-10 vus-fs-16 vus-fw-600 vus-pl-15 vus-pr-15 vus-hidden vus-text-ellipsis line-2">
						<a href="${d.url}">${d.title}</a>
					</div>
					<div class="summary vus-fs-14 vus-pl-15 vus-pr-15 vus-hidden vus-text-ellipsis line-5">
						${d.summary}
					</div>
					<div class="vus-fs-16 vus-pl-15 vus-pr-15 vus-hidden vus-pb-10 vus-pt-10">
						<div class="vus-text-ellipsis vus-fl mg-calc-6">举办时间: ${d.vo.jbsj}</div>
						<div class="vus-fr vus-w-px-40 vus-text-right">广州</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		<%@include file="include/pageview.jsp"%>
	</div>
	<%@include file="include/v-tip.jsp"%>
</div>
<script src="${ctx}/f/res/js/masonry.pkgd.min.js"></script>
<script src="${ctx}/f/res/js/imagesloaded.pkgd.min.js"></script>

<%@include file="include/footer.jsp"%>
</body>
</html>
