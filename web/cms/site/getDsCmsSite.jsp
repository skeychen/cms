<%@page language="java" pageEncoding="UTF-8" import="java.util.*,dswork.web.MyRequest,dswork.core.page.*,
dswork.cms.service.DsCmsSiteService"%><%
MyRequest req = new MyRequest(request);
Map map = req.getParameterValueMap(false, false);
Page pageModel = ((DsCmsSiteService)dswork.spring.BeanFactory.getBean("dsCmsSiteService")).queryPage(req.getInt("page"), req.getInt("pageSize", 10), map);

request.setAttribute("pageModel", pageModel);
request.setAttribute("pageNav", (new PageNav(request, pageModel)));
request.setAttribute("param", map);
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/web.jsp"%>
<script type="text/javascript">
$(function(){
	$dswork.page.menu("delDsCmsSite.jsp", "updDsCmsSite1.jsp", "getDsCmsSiteById.jsp", "${pageModel.page}");
});
$dswork.callback = function(){if($dswork.result.code == 1){
	location.href = "getDsCmsSite.jsp?page=${pageModel.page}";
}};
</script>
</head> 
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">网站站点列表</td>
		<td class="menuTool">
			<a class="insert" href="addDsCmsSite1.jsp?page=${pageModel.page}">添加</a>
			<a class="delete" id="listFormDelAll" href="#">删除所选</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="queryForm" method="post" action="getDsCmsSite.jsp">
<table border="0" cellspacing="0" cellpadding="0" class="queryTable">
	<tr>
		<td class="input">
			&nbsp;拥有者：<input type="text" class="text" name="own" value="${fn:escapeXml(param.own)}" />
			&nbsp;站点名称：<input type="text" class="text" name="name" value="${fn:escapeXml(param.name)}" />
			&nbsp;目录名称：<input type="text" class="text" name="folder" value="${fn:escapeXml(param.folder)}" />
			&nbsp;链接：<input type="text" class="text" name="url" value="${fn:escapeXml(param.url)}" />
			&nbsp;图片：<input type="text" class="text" name="img" value="${fn:escapeXml(param.img)}" />
			&nbsp;开启日志(0否,1是)：<input type="text" class="text" name="enablelog" value="${fn:escapeXml(param.enablelog)}" />
			&nbsp;开启移动版(0否,1是)：<input type="text" class="text" name="enablemobile" value="${fn:escapeXml(param.enablemobile)}" />
			&nbsp;meta关键词：<input type="text" class="text" name="metakeywords" value="${fn:escapeXml(param.metakeywords)}" />
			&nbsp;meta描述：<input type="text" class="text" name="metadescription" value="${fn:escapeXml(param.metadescription)}" />
		</td>
		<td class="query"><input id="_querySubmit_" type="button" class="button" value="查询" /></td>
	</tr>
</table>
</form>
<div class="line"></div>
<form id="listForm" method="post" action="delDsCmsSite.jsp">
<table id="dataTable" border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr class="list_title">
		<td style="width:2%"><input id="chkall" type="checkbox" /></td>
		<td style="width:5%">操作</td>
		<td>拥有者</td>
		<td>站点名称</td>
		<td>目录名称</td>
		<td>链接</td>
		<td>图片</td>
		<td>开启日志(0否,1是)</td>
		<td>开启移动版(0否,1是)</td>
		<td>meta关键词</td>
		<td>meta描述</td>
	</tr>
<c:forEach items="${pageModel.result}" var="d">
	<tr>
		<td><input name="keyIndex" type="checkbox" value="${d.id}" /></td>
		<td class="menuTool" keyIndex="${d.id}">&nbsp;</td>
		<td>${fn:escapeXml(d.own)}</td>
		<td>${fn:escapeXml(d.name)}</td>
		<td>${fn:escapeXml(d.folder)}</td>
		<td>${fn:escapeXml(d.url)}</td>
		<td>${fn:escapeXml(d.img)}</td>
		<td>${fn:escapeXml(d.enablelog)}</td>
		<td>${fn:escapeXml(d.enablemobile)}</td>
		<td>${fn:escapeXml(d.metakeywords)}</td>
		<td>${fn:escapeXml(d.metadescription)}</td>
	</tr>
</c:forEach>
</table>
<input name="page" type="hidden" value="${pageModel.page}" />
</form>
<table border="0" cellspacing="0" cellpadding="0" class="bottomTable">
	<tr><td>${pageNav.page}</td></tr>
</table>
</body>
</html>
