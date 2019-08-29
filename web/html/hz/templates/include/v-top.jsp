<%@page language="java" pageEncoding="UTF-8"%>
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
	<div class="vus-clearfix mg-exhibition">
		<div class="mg-menu small vus-fl vus-pt-20 vus-pb-20">
			<%@include file="tree.jsp"%>
		</div>