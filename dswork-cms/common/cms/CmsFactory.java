/**
 * CMSService
 */
package common.cms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import common.cms.model.ViewArticle;
import common.cms.model.ViewArticleNav;
import common.cms.model.ViewArticleSet;
import common.cms.model.ViewCategory;
import common.cms.model.ViewSite;
import common.cms.model.ViewSpecial;
import dswork.core.page.Page;

public class CmsFactory
{
	protected static Long toLong(Object v)
	{
		try
		{
			return Long.parseLong(String.valueOf(v));
		}
		catch(Exception e)
		{
			return 0L;
		}
	}
	protected DsCmsDao dao;
	protected ViewSite site;
	protected HttpServletRequest request;
	protected boolean isedit = false;
	protected boolean mobile = false;
	protected List<ViewSpecial> specialList = new ArrayList<ViewSpecial>();
	protected Map<String, ViewSpecial> specialMap = new HashMap<String, ViewSpecial>();
	protected List<ViewCategory> categoryList = new ArrayList<ViewCategory>();
	protected Map<String, ViewCategory> categoryMap = new HashMap<String, ViewCategory>();

	public CmsFactory()
	{
	}

	public CmsFactory(long siteid, boolean mobile, boolean isedit)
	{
		this.mobile = mobile;
		this.isedit = isedit;
		this.site = getDao().getSite(siteid);
		if(this.site != null)
		{
			List<ViewSpecial> slist = getDao().querySpecialList(siteid);
			for(ViewSpecial v : slist)
			{
				specialMap.put(String.valueOf(v.getId()), v);
				if(mobile)
				{
					v.setUrl("/m" + v.getUrl());
				}
			}
			specialList = slist;
			List<ViewCategory> clist = getDao().queryCategoryList(siteid);
			for(ViewCategory v : clist)
			{
				if(mobile)
				{
					if(v.getScope() != 2 || (v.getScope() == 2 && v.getUrl().startsWith("/a/")))
					{
						v.setUrl("/m" + v.getUrl());
					}
				}
				if(v.getPid() == null)
				{
					v.setPid(0L);
					v.setParent(v);// 顶层节点的父节点为节点自己
				}
				categoryList.add(v);
				categoryMap.put(String.valueOf(v.getId()), v);
			}
			for(int i = 0; i < categoryList.size(); i++)
			{
				ViewCategory v = categoryList.get(i);
				String pid = String.valueOf(v.getPid());
				if(!pid.equals("0") && categoryMap.get(pid) != null)
				{
					ViewCategory _v = categoryMap.get(pid);
					v.setParent(_v);// 上级
					_v.addList(v);// 下级
				}
			}
		}
	}

	protected DsCmsDao getDao()
	{
		if(dao == null)
		{
			if(isedit)
			{
				dao = (DsCmsDao) dswork.spring.BeanFactory.getBean("dsCmsPreviewDao");
			}
			else
			{
				dao = (DsCmsDao) dswork.spring.BeanFactory.getBean("dsCmsDao");
			}
		}
		return dao;
	}

	public void setRequest(HttpServletRequest request)
	{
		this.request = request;
	}

	public ViewSite getSite()
	{
		return site;
	}

	public ViewArticle get(String pageid)
	{
		ViewArticle m;
		if(this.mobile)
		{
			m = getDao().getArticle(site.getId(), toLong(pageid));
			if(m.getScope() != 2 || (m.getScope() == 2 && m.getUrl().startsWith("/a/")))
			{
				m.setUrl("/m" + m.getUrl());
			}
		}
		else
		{
			m = getDao().getArticle(site.getId(), toLong(pageid));
		}
		return m;
	}

	public ViewCategory getCategory(Object categoryid)
	{
		return categoryMap.get(String.valueOf(categoryid));
	}

	public ViewSpecial getSpecial(String specialid)
	{
		return specialMap.get(String.valueOf(specialid));
	}

	/**
	 * 查询指定栏目下的子栏目(包括所有递归子栏目)
	 * @param categoryid 父栏目，查询根栏目为空
	 * @return List&lt;Map&lt;String, Object&gt;&gt;
	 */
	public List<ViewCategory> queryCategory(Object categoryid)
	{
		String pid = String.valueOf(toLong(categoryid));
		if(pid.equals("0"))
		{
			return categoryList;
		}
		ViewCategory p = categoryMap.get(pid);
		if(p == null)
		{
			p = new ViewCategory();
		}
		return p.getList();
	}

	public List<ViewSpecial> querySpecial()
	{
		return specialList;
	}

	public List<ViewArticle> queryList(int page, int pagesize, boolean onlyImageTop, boolean onlyPageTop, boolean isDesc, Object... categoryids)
	{
		return doQueryList(page, pagesize, isDesc, onlyImageTop, onlyPageTop, null, categoryids);
	}

	public ViewArticleSet queryPage(int page, int pagesize, boolean isDesc, String keyvalue, Object... categoryids)
	{
		return doQueryPage(page, pagesize, isDesc, false, false, keyvalue, categoryids);
	}

	private List<ViewArticle> doQueryList(int page, int pagesize, boolean isDesc, boolean onlyImageTop, boolean onlyPageTop, String keyvalue, Object... categoryids)
	{
		StringBuilder idArray = new StringBuilder();
		if(categoryids.length > 0)
		{
			idArray.append("0");
			for(int i = 0; i < categoryids.length; i++)
			{
				idArray.append(",").append(toLong(categoryids[i]));
			}
		}
		Page<ViewArticle> pageModel = getDao().queryArticlePage(site.getId(), page, pagesize, idArray.toString(), isDesc, onlyImageTop, onlyPageTop, keyvalue);
		if(this.mobile)
		{
			for(ViewArticle va : pageModel.getResult())
			{
				if(va.getScope() != 2 || (va.getScope() == 2 && va.getUrl().startsWith("/a/")))
				{
					va.setUrl("/m" + va.getUrl());
				}
			}
		}
		return pageModel.getResult();
	}

	private ViewArticleSet doQueryPage(int page, int pagesize, boolean isDesc, boolean onlyImageTop, boolean onlyPageTop, String keyvalue, Object... categoryids)
	{
		StringBuilder idArray = new StringBuilder();
		if(categoryids.length > 0)
		{
			idArray.append("0");
			for(int i = 0; i < categoryids.length; i++)
			{
				idArray.append(",").append(toLong(categoryids[i]));
			}
		}
		ViewArticleSet set = new ViewArticleSet();
		try
		{
			Page<ViewArticle> pageModel = getDao().queryArticlePage(site.getId(), page, pagesize, idArray.toString(), isDesc, onlyImageTop, onlyPageTop, keyvalue);
			set.setStatus(1);// success
			set.setMsg("success");
			set.setSize(pageModel.getTotalsize());
			set.setPage(pageModel.getPage());
			set.setPagesize(pageModel.getPagesize());
			set.setTotalpage(pageModel.getTotalpage());
			if(this.mobile)
			{
				for(ViewArticle va : pageModel.getResult())
				{
					if(va.getScope() != 2 || (va.getScope() == 2 && va.getUrl().startsWith("/a/")))
					{
						va.setUrl("/m" + va.getUrl());
					}
				}
			}
			set.addRowsAll(pageModel.getResult());
		}
		catch(Exception e)
		{
			set.setStatus(0);
			set.setMsg("error");
		}
		return set;
	}

	public void put(String name, boolean listOrPage, int page, int pagesize, boolean isDesc, boolean onlyImageTop, boolean onlyPageTop, String keyvalue, Object... categoryids)
	{
		if(listOrPage)
		{
			request.setAttribute(name, doQueryList(page, pagesize, isDesc, onlyImageTop, onlyPageTop, keyvalue, categoryids));
		}
		else
		{
			request.setAttribute(name, doQueryPage(page, pagesize, isDesc, onlyImageTop, onlyPageTop, keyvalue, categoryids));
		}
	}

	public void putCategory(String name, boolean listOrOne, Object categoryid)
	{
		if(listOrOne)
		{
			request.setAttribute(name, queryCategory(categoryid));
		}
		else
		{
			request.setAttribute(name, getCategory(categoryid));
		}
	}

	/**
	 * 获取变量
	 * @param key 键
	 * @return Object
	 */
	public Object value(String key)
	{
		return request.getAttribute(key);
	}

	/**
	 * 设置变量至页面
	 * @param key 键
	 * @param val 值
	 */
	public void value(String key, String val)
	{
		request.setAttribute(key, val);
	}

	public ViewArticleNav queryPage(int page, int pagesize, boolean onlyImageTop, boolean onlyPageTop, boolean isDesc, String url, Object categoryid)
	{
		if(page <= 0)
		{
			page = 1;
		}
		if(pagesize <= 0)
		{
			pagesize = 25;
		}
		StringBuilder idArray = new StringBuilder();
		idArray.append(toLong(categoryid));
		Page<ViewArticle> pageModel = getDao().queryArticlePage(site.getId(), page, pagesize, idArray.toString(), isDesc, onlyImageTop, onlyPageTop, null);
		if(this.mobile)
		{
			for(ViewArticle va : pageModel.getResult())
			{
				if(va.getScope() != 2 || (va.getScope() == 2 && va.getUrl().startsWith("/a/")))
				{
					va.setUrl("/m" + va.getUrl());
				}
			}
		}
		ViewArticleNav nav = new ViewArticleNav();
		page = pageModel.getPage();// 更新当前页
		nav.getDatapage().setPage(page);
		nav.getDatapage().setPagesize(pagesize);
		nav.getDatapage().setFirst(1);
		nav.getDatapage().setFirsturl(url);
		int tmp = initpage(page - 1, pageModel.getTotalpage());
		nav.getDatapage().setPrev(tmp);
		nav.getDatapage().setPrevurl(tmp == 1 ? url : (url.replaceAll("\\.html", "_" + tmp + ".html")));
		tmp = initpage(page + 1, pageModel.getTotalpage());
		nav.getDatapage().setNext(tmp);
		nav.getDatapage().setNexturl(tmp == 1 ? url : (url.replaceAll("\\.html", "_" + tmp + ".html")));
		tmp = pageModel.getTotalpage();
		nav.getDatapage().setLast(tmp);
		nav.getDatapage().setLasturl(tmp == 1 ? url : (url.replaceAll("\\.html", "_" + tmp + ".html")));
		nav.setDatauri(url.replaceAll("\\.html", ""));
		nav.addListAll(pageModel.getResult());
		StringBuilder sb = new StringBuilder();
		int viewpage = 3, temppage = 1;// 左右显示个数
		sb.append("<a");
		if(page == 1)
		{
			sb.append(" class=\"selected\"");
		}
		else
		{
			sb.append(" href=\"").append(value("ctx")).append(url).append("\"");
		}
		sb.append(">1</a>");
		temppage = page - viewpage - 1;
		if(temppage > 1)
		{
			String u = url.replaceAll("\\.html", "_" + temppage + ".html");
			sb.append("<a href=\"").append(value("ctx")).append(u).append("\">...</a>");
		}
		for(int i = page - viewpage; i <= page + viewpage && i < pageModel.getTotalpage(); i++)
		{
			if(i > 1)
			{
				String u = (i == 1 ? url : (url.replaceAll("\\.html", "_" + i + ".html")));
				sb.append("<a");
				if(page == i)
				{
					sb.append(" class=\"selected\"");
				}
				else
				{
					sb.append(" href=\"").append(value("ctx")).append(u).append("\"");
				}
				sb.append(">").append(i).append("</a>");
			}
		}
		temppage = page + viewpage + 1;
		if(temppage < pageModel.getTotalpage())
		{
			String u = url.replaceAll("\\.html", "_" + temppage + ".html");
			sb.append("<a href=\"").append(value("ctx")).append(u).append("\">...</a>");
		}
		if(pageModel.getTotalpage() != 1)
		{
			String u = url.replaceAll("\\.html", "_" + pageModel.getTotalpage() + ".html");
			sb.append("<a");
			if(page == pageModel.getTotalpage())
			{
				sb.append(" class=\"selected\"");
			}
			else
			{
				sb.append(" href=\"").append(value("ctx")).append(u).append("\"");
			}
			sb.append(">").append(pageModel.getTotalpage()).append("</a>");
		}
		nav.setDatapageview(sb.toString());// 翻页字符串
		return nav;
	}

	protected int initpage(int page, int total)
	{
		if(page <= 0)
		{
			page = 1;
		}
		if(page > total)
		{
			page = total;
		}
		return page;
	}

	public boolean isIsedit()
	{
		return isedit;
	}

	public void setIsedit(boolean isedit)
	{
		this.isedit = isedit;
	}

	public boolean isMobile()
	{
		return mobile;
	}

	public void setMobile(boolean mobile)
	{
		this.mobile = mobile;
	}
}
