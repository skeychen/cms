<%@page language="java" pageEncoding="UTF-8" import="java.util.*,dswork.web.MyRequest"%><%
MyRequest req = new MyRequest(request); 
request.setAttribute("param", req.getParameterValueMap(false, false));
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/web.jsp"%>
<script type="text/javascript">
$dswork.callback = function(){if($dswork.result.code == 1){
	location.href = "getDsCmsSite.jsp";
}};
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">添加</td>
		<td class="menuTool">
			<a class="save" id="dataFormSave" href="#">保存</a>
			<a class="back" href="getDsCmsSite.jsp?page=${fn:escapeXml(param.page)}">返回</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="dataForm" method="post" action="addDsCmsSite2.jsp">
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">拥有者</td>
		<td class="form_input"><input type="text" name="own" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">站点名称</td>
		<td class="form_input"><input type="text" name="name" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">目录名称</td>
		<td class="form_input"><input type="text" name="folder" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">链接</td>
		<td class="form_input"><input type="text" name="url" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">图片</td>
		<td class="form_input"><input type="text" name="img" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">网站模板</td>
		<td class="form_input"><input type="text" name="viewsite" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">移动版网站模板</td>
		<td class="form_input"><input type="text" name="mviewsite" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">开启日志(0否,1是)</td>
		<td class="form_input"><input type="text" name="enablelog" maxlength="10" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">开启移动版(0否,1是)</td>
		<td class="form_input"><input type="text" name="enablemobile" maxlength="10" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">meta关键词</td>
		<td class="form_input"><input type="text" name="metakeywords" maxlength="300" value="" /></td>
	</tr>
	<tr>
		<td class="form_title">meta描述</td>
		<td class="form_input"><input type="text" name="metadescription" maxlength="300" value="" /></td>
	</tr>
</table>
</form>
</body>
</html>
