<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%><%
dswork.authown.AuthOwn auth = dswork.authown.AuthOwnUtil.getUser(request);
if(auth != null){
%><%=auth.getOwn()%><%
}
else{
	%>拿不到<%=dswork.sso.WebFilter.getAccount(request.getSession())%><%
}
%>