<%@page language="java" pageEncoding="UTF-8" import="java.util.*,dswork.web.MyRequest,dswork.core.util.*,
dswork.cms.service.DsCmsSiteService"%><%
MyRequest req = new MyRequest(request);
try
{
	((DsCmsSiteService)dswork.spring.BeanFactory.getBean("dsCmsSiteService")).deleteBatch(CollectionUtil.toLongArray(req.getLongArray("keyIndex", 0)));
	out.print(1);
}
catch (Exception e)
{
	e.printStackTrace();
	out.print("0:" + e.getMessage());
}
%>