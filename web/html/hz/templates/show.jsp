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

<div class="mg-content small vus-fr vus-pb-20"><%-- vus-pt-20--%>

	<h1 class="vus-h3 vus-pt-30 vus-pb-30 vus-border-bottom-1 vus-text-center">
		${category.title}
	</h1>
	<div class="vus-text-center vus-color--gray">
		<c:if test="${category.releasetime!=''}">
			<span class="vus-inline-block vus-pl-10 vus-pr-10">发布于：${category.releasetime}</span>
		</c:if>
		<c:if test="${category.releasesource!=''}">
			<span class="vus-inline-block vus-pl-10 vus-pr-10">来源：${category.releasesource}</span>
		</c:if>
		<c:if test="${category.releaseuser!=''}">
		<span class="vus-inline-block vus-pl-10 vus-pr-10">作者：${category.releaseuser}</span>
		</c:if>
	</div>
	<div class="vus-fs-18 vus-hidden content-img vus-lh-2 vus-pt-20 vus-pb-20">
		${category.content}
	</div>

</div>

<%@include file="include/v-bottom.jsp"%>
<%@include file="include/footer.jsp"%>
</body>
</html>
