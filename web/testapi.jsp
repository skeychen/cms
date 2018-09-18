<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,minimal-ui"/>
<title></title>
</head>
<body>
<%=dswork.sso.AuthFactory.getOrg("1").getName() %>
<br />


<%=common.cms.GsonUtil.toJson(dswork.sso.AuthFactory.getUser(dswork.sso.WebFilter.getAccount(request.getSession()))) %>
<br />


<br />
</body>
</html>