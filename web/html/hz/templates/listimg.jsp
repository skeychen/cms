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

<div class="mg-content small vus-fr vus-pt-20 vus-pb-20">
	<div class="vus-clearfix">
		<ul class="masonry-grid grid-list vus-hidden">
			<c:forEach items="${datalist}" var="d">
			<li class="grid-item vus-hidden vus-fl vus-mr-20 vus-mb-20 vus-pl-4 vus-pt-4 vus-pr-4 vus-pb-4 vus-border-1 vus-shadow-10">
				<a href="${d.url}"><img src="${d.img}" class="vus-img-fluid" width="100%"></a>
				<div class="tit vus-mt-15 vus-fs-16 vus-fw-600 vus-pl-15 vus-pr-15 vus-hidden vus-text-ellipsis line-2">
					<a href="${d.url}">${d.title}</a>
				</div>
				<div class="vus-fs-14 vus-pl-15 vus-pr-15 vus-hidden vus-pb-20 vus-pt-10">
					<div class="vus-text-ellipsis">联系方式：${d.vo.lxdh}</div>
					<div class="vus-text-ellipsis">地址：${d.vo.dz}</div>
					<div class="vus-text-ellipsis">官网：<a href="${d.vo.gw}" class="underline">${d.vo.gw}</a></div>
				</div>
				<div class="vus-pb-10 vus-text-center">
					<a href="${d.url}" class="vus-btn small">查看详情</a>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	<%@include file="include/pageview.jsp"%>
</div>
<script src="${ctx}/f/res/js/masonry.pkgd.min.js"></script>
<script src="${ctx}/f/res/js/imagesloaded.pkgd.min.js"></script>

<%@include file="include/v-bottom.jsp"%>
<%@include file="include/footer.jsp"%>
</body>
</html>
