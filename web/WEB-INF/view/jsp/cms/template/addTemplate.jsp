<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/web.jsp"%>
<script type="text/javascript">
window.parent.setTextChange(false);// 第一次进来时，重置父页面修改状态的标记信息
$dswork.callback = function(){if($dswork.result.code == 1){
	window.parent.location.reload();
}};
function onChangeListen(){
	window.parent.setTextChange(true);
}
</script>
<style type="text/css">
	
</style>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">添加模板</td>
		<td class="menuTool">
			<a class="save" href="#" id="dataFormSave">保存</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="dataForm" method="post" action="addTemplate2.htm">
<table id="dataTable" border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr>
		<td class="form_title">模板位置</td>
		<td class="form_input">${path}</td>
	</tr>
	<tr>
		<td class="form_title">模板名称</td>
		<td class="form_input"><input type="text" name="filename" maxlength="100" style="width:400px;" datatype="Char" value="" /></td>
	</tr>
</table>
<input type="hidden" name="path" value="${path}"/>
<input type="hidden" name="siteid" value="${siteid}"/>
</form>
</body>
</html>
