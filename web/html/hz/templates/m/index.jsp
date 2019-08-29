﻿<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%common.cms.CmsFactory cms = (common.cms.CmsFactory)request.getAttribute("cms");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0,minimal-ui"/>
<title>${site.name}</title>
<link rel="stylesheet" type="text/css" href="${ctx}/f/res/themes/web.css"/>
</head>
<body>
<%@include file="include/header.jsp"%>

<div style="margin:10px auto;text-align:center;width:400px;border:1px solid #000;">
</div>

<%@include file="include/footer.jsp"%>
</body>
</html>
