<%@page language="java" contentType="text/html;charset=UTF-8" import="dswork.web.*,
common.auth.*"%><%
String path = request.getContextPath();
Auth model = AuthUtil.getLoginUser(request);
String url = "login.html";
AuthUtil.setLoginUserInfo(request, null);
response.sendRedirect(url);
%>