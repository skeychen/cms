<%@page pageEncoding="UTF-8" import="dswork.spring.BeanFactory,java.util.Map,java.util.HashMap"%><%
	dswork.web.MyRequest req = new dswork.web.MyRequest(request);
	long siteid = 106L;
	long categoryid = req.getLong("categoryid");
	String isedit = req.getString("isedit");
	boolean test = isedit.equals("true");
	common.cms.DsCmsDao dao;
	if(test)
	{
		dao = (common.cms.DsCmsDao)BeanFactory.getBean("dsCmsPreviewDao");
	}
	else
	{
		dao = (common.cms.DsCmsDao)BeanFactory.getBean("dsCmsDao");
	}
	response.addHeader("Access-Control-Allow-Origin", "*");
	response.setContentType("application/json;charset=UTF-8");
	Map<String,Object> data = new HashMap<String,Object>();
	//日期
	String pbegin1 = req.getString("pbegin");
	if(pbegin1 != null && pbegin1.length() > 0)
	{
		pbegin1 = pbegin1 + "000000";
	}
	else
	{
		pbegin1 = "0";
	}
	Long pbegin = Long.parseLong(pbegin1);
	
	String pend1 = req.getString("pend");
	if(pend1 != null && pend1.length() > 0)
	{
		pend1 = pend1 + "000000";
		if(pbegin == 0)
		{
			pend1 = "0";
		}
	}
	else
	{
		pend1 = "0";
	}
	Long pend = Long.parseLong(pend1);
	//城市
	String ptype = req.getString("ptype");
	//关键字
	String keyvalue = req.getString("keyvalue");
	int currentPage = req.getInt("page");//当前页
	int pagesize = req.getInt("pagesize");//一页数据显示大小
	dswork.core.page.Page<common.cms.model.ViewArticle> pageModel = dao.queryArticlePage(siteid, currentPage, pagesize, String.valueOf(categoryid), true, false, false, ptype, pbegin, pend, keyvalue);
	data.put("rows", pageModel.getResult());
	data.put("size", pageModel.getTotalsize());
	data.put("page", pageModel.getPage());
	data.put("pagesize", pageModel.getPagesize());
	out.print(common.cms.GsonUtil.toJson(data));
%>