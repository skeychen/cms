<%@page language="java" pageEncoding="UTF-8" import="java.util.*,dswork.web.MyRequest,
dswork.cms.service.DsCmsSiteService"%><%
MyRequest req = new MyRequest(request);
Long id = req.getLong("keyIndex");
request.setAttribute("po", ((DsCmsSiteService)dswork.spring.BeanFactory.getBean("dsCmsSiteService")).get(id));
request.setAttribute("page", req.getInt("page", 1));
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/updAjax.jsp"%>
<script type="text/javascript">
$dswork.callback = function(){if($dswork.result.type == 1){
	location.href = "getDsCmsSite.jsp?page=${page}";
}};
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">修改</td>
		<td class="menuTool">
			<a class="save" id="dataFormSave" href="#">保存</a>
			<a class="back" href="getDsCmsSite.jsp?page=${page}">返回</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="dataForm" method="post" action="updDsCmsSite2.jsp">
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">拥有者</td>
		<td class="form_input"><input type="text" name="own" maxlength="300" value="${fn:escapeXml(po.own)}" /></td>
	</tr>
	<tr>
		<td class="form_title">站点名称</td>
		<td class="form_input"><input type="text" name="name" maxlength="300" value="${fn:escapeXml(po.name)}" /></td>
	</tr>
	<tr>
		<td class="form_title">目录名称</td>
		<td class="form_input"><input type="text" name="folder" maxlength="300" value="${fn:escapeXml(po.folder)}" /></td>
	</tr>
	<tr>
		<td class="form_title">链接</td>
		<td class="form_input"><input type="text" name="url" maxlength="300" value="${fn:escapeXml(po.url)}" /></td>
	</tr>
	<tr>
		<td class="form_title">图片</td>
		<td class="form_input"><input type="text" name="img" maxlength="300" value="${fn:escapeXml(po.img)}" /></td>
	</tr>
	<tr>
		<td class="form_title">开启日志(0否,1是)</td>
		<td class="form_input"><input type="text" name="enablelog" maxlength="10" value="${fn:escapeXml(po.enablelog)}" /></td>
	</tr>
	<tr>
		<td class="form_title">开启移动版(0否,1是)</td>
		<td class="form_input"><input type="text" name="enablemobile" maxlength="10" value="${fn:escapeXml(po.enablemobile)}" /></td>
	</tr>
	<tr>
		<td class="form_title">meta关键词</td>
		<td class="form_input"><input type="text" name="metakeywords" maxlength="300" value="${fn:escapeXml(po.metakeywords)}" /></td>
	</tr>
	<tr>
		<td class="form_title">meta描述</td>
		<td class="form_input"><input type="text" name="metadescription" maxlength="300" value="${fn:escapeXml(po.metadescription)}" /></td>
	</tr>
</table>
<input type="hidden" name="id" value="${po.id}" />
</form>
</body>
</html>
