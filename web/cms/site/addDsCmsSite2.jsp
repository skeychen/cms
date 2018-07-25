<%@page language="java" pageEncoding="UTF-8" import="java.util.*,dswork.web.MyRequest,dswork.core.util.*,
dswork.cms.model.DsCmsSite,
dswork.cms.service.DsCmsSiteService"%><%
try
{
	DsCmsSite po = new DsCmsSite();
	MyRequest req = new MyRequest(request);
	req.getFillObject(po);
	((DsCmsSiteService)dswork.spring.BeanFactory.getBean("dsCmsSiteService")).update(po);
	out.print(1);
}
catch (Exception e)
{
	e.printStackTrace();
	out.print("0:" + e.getMessage());
}
%>