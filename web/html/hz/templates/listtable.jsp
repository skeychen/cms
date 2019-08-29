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
<%--
	<div class="vus-pt-40 vus-pb-40 vus-text-center">
		<div class="vus-relative vus-mx-auto vus-w-50">
			<input class="vus-input warning default vus-pr-70" type="text" placeholder="请输入完整的企业名称..." />
			<div class="vus-absolute vus-position-top vus-position-bottom vus-position-right vus-w-px-60 vus-zindex-2 vus-cursor-pointer">
				<img src="image/search.png" class="vus-img vus-w-px-24 vus-mt-8 vus-mx-auto">
			</div>
		</div>
	</div>
--%>
	<div class="vus-pt-20 vus-fs-16 vus-table-auto">
		<table class="vus-table hover striped text-center" border="0" cellspacing="0" cellpadding="0">
			<thead class="warning">
				<tr>
					<th class="vus-w-px-70">序号</th>
					<th>登记信息</th>
					<th>信源单位</th>
					<th>类型</th>
					<th>时间</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${datalist}" var="d">
				<tr>
					<th>d.count</th>
					<td>${d.vo.name}</td>
					<td>${d.vo.xy}</td>
					<td>${d.vo.type}</td>
					<td>${d.vo.sj}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<%@include file="include/pageview.jsp"%>
</div>

<%@include file="include/v-bottom.jsp"%>
<%@include file="include/footer.jsp"%>
</body>
</html>
