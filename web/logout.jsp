<%@page language="java" contentType="text/html;charset=UTF-8"%><%
dswork.authown.AuthOwnUtil.logout(request, response);
String url = "login.html";
response.sendRedirect(url);
%>