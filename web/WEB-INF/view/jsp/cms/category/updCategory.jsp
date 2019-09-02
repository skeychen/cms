<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="/commons/include/web.jsp"%>
<script type="text/javascript">
$dswork.deleteRow = function(obj){$(obj).parent().parent().remove();};
$dswork.callback = function(){if($dswork.result.code == 1){
	location.href = "getCategory.htm?siteid=${fn:escapeXml(param.siteid)}";
}};
$(function(){
	$('#scope').change(function(){
		$('#listTable>.choice').remove();
		switch($(this).val()){
		case '0':
			$('#listTable').append($('#scope_0_1').html()).append($('#scope_0').html());
			$("#viewsite").val("${po.viewsite}");
			$("#pageviewsite").val("${po.pageviewsite}");
			$("#mviewsite").val("${po.mviewsite}");
			$("#mpageviewsite").val("${po.mpageviewsite}");
			$("#template_pagesize").show();
			$("#ptype").val("${fn:escapeXml(po.ptype)}");
			$("#pname").val("${fn:escapeXml(po.pname)}");
			$("#mycustom").show();
			break;
		case '1':
			$('#listTable').append($('#scope_0_1').html());
			$("#viewsite").val("${po.viewsite}");
			$("#mviewsite").val("${po.mviewsite}");
			$("#template_pagesize").hide();
			$("#ptype").val("");
			$("#pname").val("");
			$("#mycustom").hide();
			break;
		case '2':
			$('#listTable').append($('#scope_2').html());
			$("#template_pagesize").hide();
			$("#ptype").val("");
			$("#pname").val("");
			$("#mycustom").hide();
			break;
		}
		$("#viewpagesize").val("${po.viewpagesize}");
	});
	$('#scope').change();
});
</script>
<script type="text/template" id="scope_2">
	<tr class="choice">
		<td class="form_title">链接</td>
		<td class="form_input"><input type="text" id="url" name="url" maxlength="100" style="width:400px;" datatype="Require" value="${fn:escapeXml(po.url)}" /></td>
	</tr>
</script>
<script type="text/template" id="scope_0_1">
	<tr class="choice">
		<td class="form_title">链接</td>
		<td class="form_input">/a/${po.id}/index.html</td>
	</tr>
	<tr class="choice">
		<td class="form_title">栏目模板</td>
		<td class="form_input"><select id="viewsite" name="viewsite" style="width:400px;"><option value=""></option>
			<c:forEach items="${templates}" var="v"><c:if test="${not fn:startsWith(v,'page')}"><option value="${v}">${fn:replace(v,'.jsp','')}</option></c:if></c:forEach>
		</select></td>
	</tr>
<c:if test="${enablemobile}">
	<tr class="choice">
		<td class="form_title">移动版栏目模板</td>
		<td class="form_input"><select id="mviewsite" name="mviewsite" style="width:400px;"><option value=""></option>
			<c:forEach items="${mtemplates}" var="v"><c:if test="${not fn:startsWith(v,'page')}"><option value="${v}">${fn:replace(v,'.jsp','')}</option></c:if></c:forEach>
		</select></td>
	</tr>
</c:if>
</script>
<script type="text/template" id="scope_0">
	<tr class="choice">
		<td class="form_title">内容模板</td>
		<td class="form_input"><select id="pageviewsite" name="pageviewsite" style="width:400px;"><option value=""></option>
			<c:forEach items="${templates}" var="v"><c:if test="${fn:startsWith(v,'page')}"><option value="${v}">${fn:replace(v,'.jsp','')}</option></c:if></c:forEach>
		</select></td>
	</tr>
<c:if test="${enablemobile}">
	<tr class="choice">
		<td class="form_title">移动版内容模板</td>
		<td class="form_input"><select id="mpageviewsite" name="mpageviewsite" style="width:400px;"><option value=""></option>
			<c:forEach items="${mtemplates}" var="v"><c:if test="${fn:startsWith(v,'page')}"><option value="${v}">${fn:replace(v,'.jsp','')}</option></c:if></c:forEach>
		</select></td>
	</tr>
</c:if>
</script>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0" class="listLogo">
	<tr>
		<td class="title">修改</td>
		<td class="menuTool">
			<a class="save" id="dataFormSave" href="#">保存</a>
			<a class="back" href="getCategory.htm?siteid=${fn:escapeXml(param.siteid)}">返回</a>
		</td>
	</tr>
</table>
<div class="line"></div>
<form id="dataForm" method="post" action="updCategory2.htm">
<table border="0" cellspacing="1" cellpadding="0" class="listTable" id="listTable">
	<tr>
		<td class="form_title">上级栏目</td>
		<td class="form_input"><select id="pid" name="pid" v="${po.pid}"><option value="0">≡顶级栏目≡</option>
		<c:forEach items="${list}" var="d">
			<option value="${d.id}">${d.label}${fn:escapeXml(d.name)}&nbsp;[${d.scope==0?'列表':d.scope==1?'单页':'外链'}]</option>
		</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td class="form_title">栏目名称</td>
		<td class="form_input"><input type="text" name="name" maxlength="100" datatype="Require" value="${fn:escapeXml(po.name)}" /></td>
	</tr>
	<tr>
		<td class="form_title">类型</td>
		<td class="form_input">
			<select id="scope" name="scope" v="${po.scope}" style="width:100px;">
				<option value="0">列表</option>
				<option value="1">单页</option>
				<option value="2">外链</option>
			</select>
		</td>
	</tr>
	<tbody id="template_pagesize">
	<tr>
		<td class="form_title">每页条数</td>
		<td class="form_input"><input type="number" id="viewpagesize" name="viewpagesize" min="1" max="99999" step="1" datatype="Range" style="width:50px;" value="${po.viewpagesize}" /></td>
	</tr>
	</tbody>
	<tbody id="mycustom">
	<tr>
		<td class="form_title">定义分类</td>
		<td class="form_input">分类名称 <input type="text" id="ptype" name="ptype" maxlength="10" datatype="!RequireTrim" value="${fn:escapeXml(po.ptype)}" /></td>
	</tr>
	<tr>
		<td class="form_title">分类选项</td>
		<td class="form_input">
			分类名称不为空时可填写，换行或空格分隔多个选项<br/>
			<textarea id="ptypeitem" name="ptypeitem" style="width:400px;height:60px;">${fn:escapeXml(po.ptypeitem)}</textarea>
		</td>
	</tr>
	<tr>
		<td class="form_title">定义日期</td>
		<td class="form_input">日期名称 <span><input type="text" id="pname" name="pname" maxlength="10" datatype="!RequireTrim" value="${fn:escapeXml(po.pname)}" /></span>
			&nbsp;格式
			<select id="pformat" name="pformat" style="width:100px;" v="${fn:escapeXml(po.pformat)}">
				<option value="yyyyMMdd000000">yyyyMMdd</option>
				<option value="yyyyMMddHHmmss">yyyyMMddHHmmss</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="form_title">特殊说明</td>
		<td class="form_input"><input type="text" name="pmemo" maxlength="100" style="width:400px;" datatype="!Require" value="${fn:escapeXml(po.pmemo)}" /></td>
	</tr>
	</tbody>
</table>
<div class="line"></div>
<table id="contactTable" border="0" cellspacing="1" cellpadding="0" class="listTable">
	<tr class="list_title">
		<td style="width:35%;">变量名</td>
		<td style="width:35%;">名称</td>
		<td style="width:10%;">类型</td>
		<td class="menuTool"><a class="insert" onclick="$('#contactTable>tbody').append($('#cloneTable').html());" href="#">添加项</a></td>
	</tr>
<c:forEach items="${columns}" var="d">
	<tr class="list">
		<td><input type="text" name="ctitle" datatype="Char" value="${fn:escapeXml(d.ctitle)}" /></td>
		<td><input type="text" name="cname" value="${fn:escapeXml(d.cname)}" /></td>
		<td><select name="cdatatype" v="${fn:escapeXml(d.cdatatype)}">
			<option value="">无校验</option>
			<option value="Char">Char</option>
			<option value="Chinese">Chinese</option>
			<option value="Email">Email</option>
			<option value="IdCard">IdCard</option>
			<option value="UserCard">UserCard</option>
			<option value="UnitCode">UnitCode</option>
			<option value="OrgCode">OrgCode</option>
			<option value="Mobile">Mobile</option>
			<option value="Money">Money</option>
			<option value="Numeral">Numeral</option>
			<option value="Phone">Phone</option>
			<option value="Require">Require</option>
			<option value="RequireCompact">RequireCompact</option>
			<option value="RequireTrim">RequireTrim</option>
			<option value="Url">Url</option>
			<option value="Zip">Zip</option>
			<option value="Number">Number</option>
			<option value="NumberPlus">NumberPlus</option>
			<option value="NumberMinus">NumberMinus</option>
			<option value="Integer">Integer</option>
			<option value="IntegerPlus">IntegerPlus</option>
			<option value="IntegerMinus">IntegerMinus</option>
			<option value="Filename">Filename</option>
			<option value="Password">Password</option></select></td>
		<td><input type="button" class="delete" onclick="$dswork.deleteRow(this)" /></td>
	</tr>
</c:forEach>
</table>
<script type="text/template" id="cloneTable">
	<tr class="list">
		<td><input type="text" name="ctitle" datatype="Char" value="" /></td>
		<td><input type="text" name="cname" value="" /></td>
		<td><select name="cdatatype">
			<option value="">无校验</option>
			<option value="Char">Char</option>
			<option value="Chinese">Chinese</option>
			<option value="Email">Email</option>
			<option value="IdCard">IdCard</option>
			<option value="UserCard">UserCard</option>
			<option value="UnitCode">UnitCode</option>
			<option value="OrgCode">OrgCode</option>
			<option value="Mobile">Mobile</option>
			<option value="Money">Money</option>
			<option value="Numeral">Numeral</option>
			<option value="Phone">Phone</option>
			<option value="Require">Require</option>
			<option value="RequireCompact">RequireCompact</option>
			<option value="RequireTrim">RequireTrim</option>
			<option value="Url">Url</option>
			<option value="Zip">Zip</option>
			<option value="Number">Number</option>
			<option value="NumberPlus">NumberPlus</option>
			<option value="NumberMinus">NumberMinus</option>
			<option value="Integer">Integer</option>
			<option value="IntegerPlus">IntegerPlus</option>
			<option value="IntegerMinus">IntegerMinus</option>
			<option value="Filename">Filename</option>
			<option value="Password">Password</option>
		</select></td>
		<td><input type="button" class="delete" onclick="$dswork.deleteRow(this)" /></td>
	</tr>
</script>
<input type="hidden" name="id" value="${po.id}" />
</form>
</body>
</html>
