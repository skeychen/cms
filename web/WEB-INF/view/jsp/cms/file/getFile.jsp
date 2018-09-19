<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/get.jsp" %>
<style type="text/css">
tr.x td{text-align:left;padding-left:3px;}
</style>
</head> 
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">文件列表</td>
		<td class="menuTool">
			<a class="graph" href="uploadFile1.htm?siteid=${siteid}&path=${path}">附件上传</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<table border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr class="list_title">
		<td style="width:40%;">文件名称</td>
		<td>引用地址</td>
		<td>修改日期</td>
	</tr>
<c:forEach items="${list}" var="d">
	<tr class="x">
		<td>${fn:escapeXml(d.name)}</td>
		<td>${fn:escapeXml(d.root)}${fn:escapeXml(d.path)}</td>
		<td>${fn:escapeXml(d.lasttime)}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>
