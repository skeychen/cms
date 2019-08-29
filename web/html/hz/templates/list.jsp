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
	<ul class="mg-news">
		<c:forEach items="${datalist}" var="d">
		<li class="vus-pt-20 vus-pb-20 vus-clearfix vus-border-bottom-1">
			<div class="vus-w-px-170 vus-h-px-100 vus-bg--gray-smoke vus-hidden vus-fl">
				<a href="${d.url}" class="mg-bg-cover hover vus-anim-all" style="background-image: url(${d.img})"></a>
			</div>
			<div class="list-content vus-fr">
				<h5 class="vus-h5 vus-fs-18 vus-text-ellipsis">
					<a href="${d.url}">${d.title}</a>
				</h5>
				<div class="summary vus-hidden vus-color--gray vus-text-ellipsis line-2">
					${d.summary}
				</div>
				<div class="vus-pt-3 vus-color--gray">
					<img src="${ctx}/f/res/image/time.png" class="vus-inline-block vus-align-middle vus-w-px-15">
					<span class="vus-inline-block vus-align-middle">${d.releasedate}</span>
				</div>
			</div>
		</li>
		</c:forEach>
	</ul>
	<%@include file="include/pageview.jsp"%>
</div>

<%@include file="include/v-bottom.jsp"%>
<%@include file="include/footer.jsp"%>
</body>
</html>
