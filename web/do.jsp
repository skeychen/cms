<%@page language="java" contentType="text/html;charset=UTF-8" %><%
String path = request.getContextPath();
dswork.authown.AuthOwnUtil.logout(request, response);
dswork.authown.AuthOwnUtil.login(request, response, "100000000", "admin", "系统管理", "adminadmin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>功能模块化系统，仅使用临时菜单，详细框架页面不在此包含</title>
<style type="text/css">
*{word-wrap:break-word;}
html,body,div{margin:0;padding:0;}
html,body{*position:static;height:100%;border:0;line-height:1.6;}
html{font-family:sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;}
body,a{font-family:"Microsoft Yahei","Hiragino Sans GB","Helvetica Neue",Helvetica,tahoma,arial,Verdana,sans-serif,"\5B8B\4F53";font-size:12px;color:#182a2d;-webkit-font-smoothing:antialiased;-moz-font-smoothing:antialiased;}
html{overflow:-moz-scrollbars-vertical;}
a{outline:none;text-decoration:none;cursor:pointer;text-decoration:none;}
a:link,a:visited,a:active{color:#182a2d;outline:none;}
a:hover{outline:none;color:#182a2d;text-decoration:none;}
a:focus{outline:none;}
a:hover,a:active{outline:none;}:focus{outline:none;}

label,a,a:link,a:visited,a:active{display:inline-block;font-size:14px;padding:3px 8px;line-height:1.4;}
label{border:solid 1px #bce8f1;color:#31708f;background-color:#d9edf7;}
a,a:link,a:visited,a:active{border:solid 1px #0f9ae0;color:#fff;background-color:#3bb4f2;}
a:hover {background-color:#0f9ae0;}
.level1 {margin:8px 0 0 8px;}
.level2 {margin:2px 0 0 38px;}
.level3 {margin:2px 0 0 68px;}
.level4 {margin:2px 0 0 98px;}
</style>
<script type="text/javascript">
var treedata = [
	{id:900, name:"CMS", img:"", imgOpen:"", url:"", items:[
		 {id:910,name:"栏目管理", img:"", imgOpen:"", url:'/cms/category/getCategory.htm', items:[]}
		,{id:920,name:"专题管理", img:"", imgOpen:"", url:'/cms/special/getSpecial.htm', items:[]}
		,{id:930,name:"内容管理", img:"", imgOpen:"", url:"", items:[
	   		 {id:931,name:'信息采编', img:"", imgOpen:"", url:'/cms/edit/getCategoryTree.htm', items:[]}
			,{id:932,name:'信息审核', img:"", imgOpen:"", url:'/cms/audit/getCategoryTree.htm', items:[]}
			,{id:933,name:'信息发布', img:"", imgOpen:"", url:'/cms/publish/getCategoryTree.htm', items:[]}
		]}
		,{id:940,name:"模板编辑", img:"", imgOpen:"", url:'/cms/template/getTemplateTree.htm', items:[]}
		,{id:950,name:"附件管理", img:"", imgOpen:"", url:'/cms/file/getFileTree.htm', items:[]}
		,{id:960,name:"栏目回收站", img:"", imgOpen:"", url:'/cms/category/getRecycledCategory.htm', items:[]}
		,{id:970,name:"权限管理", img:"", imgOpen:"", url:"", items:[
			 {id:971,name:'授权管理(SSO)', img:"", imgOpen:"", url:'/cms/permission/getUser.jsp', items:[]}
			,{id:972,name:'授权管理', img:"", imgOpen:"", url:'/cms/permission/getUser.htm', items:[]}
			,{id:973,name:'授权情况', img:"", imgOpen:"", url:'/cms/permission/getCategory.htm', items:[]}
		]}
		,{id:990,name:"附加功能", img:"", imgOpen:"", url:'', items:[
			 {id:991,name:'CMS日志', img:"", imgOpen:"", url:'/cms/log/getLog.jsp', items:[]}
			,{id:992,name:'信息总数', img:"", imgOpen:"", url:'/cms/page/main.html', items:[]}
			,{id:993,name:'批量更新', img:"", imgOpen:"", url:'/cms/page/updBatchPage.jsp', items:[]}
		]}
	]}
];
</script>
</head>
<body>
<div style="overflow:hidden;height:100%;width:100%;">
<div style="overflow:hidden;float:right;height:100%;width:85%;">
	<iframe id="main" name="main" style="height:100%;width:100%;" scrolling="auto" frameborder="0" src="about:blank"></iframe>
</div>
<div style="overflow:auto;float:left;height:100%;width:14.8%;border-right:1px solid #6ea5eb;">
<script type="text/javascript">
for(var i = 0; i < treedata.length; i++){
	var item = treedata[i];
	if(item.url == "" || item.url == "#"){
		document.write("<label class='level1'>" + item.name + "</label><br />");
	}
	else{
		document.write("<a class='level1' target='main' href='<%=path%>" + item.url + "'>" + item.name + "</a><br />");
	}
	for(var j = 0; j < item.items.length; j++){
		var m = item.items[j];
		if(m.url == "" || m.url == "#"){
			document.write("<label class='level2'>" + m.name + "</label><br />");
		}
		else{
			document.write("<a class='level2' target='main' href='<%=path%>" + m.url + "'>" + m.name + "</a><br />");
		}
		
		for(var k = 0; k < m.items.length; k++){
			var mm = m.items[k];
			if(mm.url == "" || mm.url == "#"){
				document.write("<label class='level3'>" + mm.name + "</label><br />");
			}
			else{
				document.write("<a class='level3' target='main' href='<%=path%>" + mm.url + "'>" + mm.name + "</a><br />");
			}
			for(var l = 0; l < mm.items.length; l++){
				var mmm = mm.items[l];
				document.write("<a class='level4' target='main' href='<%=path%>" + mmm.url + "'>" + mmm.name + "</a><br />");
			}
		}
	}
}
</script>
</div>
</div>
</body>
</html>