package dswork.cms.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;

import dswork.authown.AuthOwn;
import dswork.authown.AuthOwnUtil;
import dswork.cms.dao.DsCmsPermissionDao;
import dswork.cms.model.DsCmsCategory;
import dswork.cms.model.DsCmsPermission;
import dswork.cms.model.DsCmsSite;
import dswork.mvc.BaseController;
import dswork.spring.BeanFactory;

public class DsCmsBaseController extends BaseController
{
	private static Map<Long, Map<Long, Map<String, Set<String>>>> siteMap = new HashMap<Long, Map<Long, Map<String, Set<String>>>>();
	private static Map<Long, String> ownMap = new HashMap<Long, String>();

	static
	{
		refresh();
	}

	public static void refresh()
	{
		Map<Long, Map<Long, Map<String, Set<String>>>> map = new HashMap<Long, Map<Long, Map<String, Set<String>>>>();
		DsCmsPermissionDao dao = (DsCmsPermissionDao) BeanFactory.getBean(DsCmsPermissionDao.class);
		List<DsCmsSite> siteList = dao.queryListSite();
		for(DsCmsSite site : siteList)
		{
			ownMap.put(site.getId(), site.getOwn());
//			List<DsCmsCategory> categoryList = dao.queryListCategory(site.getId());
			List<DsCmsPermission> permissionList = dao.queryList(site.getId());
			Map<Long, Map<String, Set<String>>> map1 = new HashMap<Long, Map<String, Set<String>>>();
			for(DsCmsPermission permission : permissionList)
			{
				refreshMap2(map1, Arrays.asList(permission.getCanEditall().split(",")), "editall", permission);
				refreshMap2(map1, Arrays.asList(permission.getCanEditown().split(",")), "editown", permission);
				refreshMap2(map1, Arrays.asList(permission.getCanPublish().split(",")), "publish", permission);
				refreshMap2(map1, Arrays.asList(permission.getCanAudit().split(",")), "audit", permission);
			}
			if(map1.size() > 0)
			{
				map.put(site.getId(), map1);
			}
		}
		siteMap = map;
	}

	private static void refreshMap2(Map<Long, Map<String, Set<String>>> map1, List<String> idList, String key, DsCmsPermission permission)
	{
		for(String id : idList)
		{
			try
			{
				Long _id = Long.parseLong(id);
				Map<String, Set<String>> map2 = map1.get(_id);
				if(map2 == null)
				{
					map2 = new HashMap<String, Set<String>>();
					map1.put(_id, map2);
				}
				Set<String> set = map2.get(key);
				if(set == null)
				{
					set = new HashSet<String>();
					map2.put(key, set);
				}
				set.add(permission.getAccount());
			}
			catch(NumberFormatException e)
			{
			}
		}
	}

	public static Map<Long, Map<String, Set<String>>> getSitePermission(long siteid)
	{
		return siteMap.get(siteid);
	}

	public static boolean categoryNotNeedAudit(long siteid, long categoryid)
	{
		if(!checkOwn(siteid))
		{
			return false;
		}
		return siteMap.get(siteid) == null
			|| siteMap.get(siteid).get(categoryid) == null
			|| siteMap.get(siteid).get(categoryid).get("audit") == null;
	}

	public static boolean checkEditall(long siteid, long categoryid)
	{
		if(!checkOwn(siteid))
		{
			return false;
		}
		return siteMap.get(siteid) == null
			||(siteMap.get(siteid).get(categoryid) != null
			&& siteMap.get(siteid).get(categoryid).get("editall") != null
			&& siteMap.get(siteid).get(categoryid).get("editall").contains(getAccount()));
	}

	public static boolean checkEditown(long siteid, long categoryid)
	{
		if(!checkOwn(siteid))
		{
			return false;
		}
		return siteMap.get(siteid) != null
			&& siteMap.get(siteid).get(categoryid) != null
			&& siteMap.get(siteid).get(categoryid).get("editown") != null
			&& siteMap.get(siteid).get(categoryid).get("editown").contains(getAccount());
	}

	public static boolean checkEdit(long siteid, long categoryid)
	{
		if(!checkOwn(siteid))
		{
			return false;
		}
		return checkEditown(siteid, categoryid)
			|| checkEditall(siteid, categoryid);
	}

	public static boolean checkAudit(long siteid, long categoryid)
	{
		if(!checkOwn(siteid))
		{
			return false;
		}
		return siteMap.get(siteid) != null
			&& siteMap.get(siteid).get(categoryid) != null
			&& siteMap.get(siteid).get(categoryid).get("audit") != null
			&& siteMap.get(siteid).get(categoryid).get("audit").contains(getAccount());
	}

	public static boolean checkPublish(long siteid, long categoryid)
	{
		if(!checkOwn(siteid))
		{
			return false;
		}
		return siteMap.get(siteid) == null
			||(siteMap.get(siteid).get(categoryid) != null
			&& siteMap.get(siteid).get(categoryid).get("publish") != null
			&& siteMap.get(siteid).get(categoryid).get("publish").contains(getAccount()));
	}

	public static boolean checkOwn(long siteid)
	{
		return getOwnList().contains(ownMap.get(siteid));
	}

	private static void categorySettingList(DsCmsCategory m, List<DsCmsCategory> list)
	{
		int size = m.getList().size();
		for(int i = 0; i < size; i++)
		{
			DsCmsCategory n = m.getList().get(i);
			n.setLabel(m.getLabel());
			if(m.getLabel().endsWith("├"))
			{
				n.setLabel(m.getLabel().substring(0, m.getLabel().length() - 2) + "│");
			}
			else if(m.getLabel().endsWith("└"))
			{
				n.setLabel(m.getLabel().substring(0, m.getLabel().length() - 2) + "　");
			}
			n.setLabel(n.getLabel() + "&nbsp;&nbsp;");
			n.setLabel(n.getLabel() + (i == size - 1 ? "└" : "├"));
			list.add(n);
			categorySettingList(n, list);
		}
	}

	/**
	 * 对关系完成的栏目进行树形排序
	 * @param list 关系完整的栏目list
	 * @return List&gt;DsCmsCategory&lt;
	 */
	public static List<DsCmsCategory> categorySettingList(List<DsCmsCategory> list)
	{
		List<DsCmsCategory> _list = new ArrayList<DsCmsCategory>();// 按顺序放入
		for(int i = 0; i < list.size(); i++)
		{
			DsCmsCategory m = list.get(i);
			m.setLabel("");
			_list.add(m);
			categorySettingList(m, _list);
		}
		return _list;
	}

	/**
	 * 对关系完成的栏目进行树形排序
	 * @param list 关系完整的栏目list
	 * @return List&gt;DsCmsCategory&lt;
	 */
	public static List<DsCmsCategory> categorySetting(List<DsCmsCategory> list)
	{
		Map<Long, DsCmsCategory> map = new HashMap<Long, DsCmsCategory>();
		for(DsCmsCategory m : list)
		{
			map.put(m.getId(), m);
		}
		List<DsCmsCategory> _list = new ArrayList<DsCmsCategory>();
		for(DsCmsCategory m : list)
		{
			if(m.getPid() > 0)
			{
				if(map.get(m.getPid()) != null)
				{
					map.get(m.getPid()).add(m);// 放入节点对应的父节点
				}
			}
			else if(m.getPid() == 0)
			{
				_list.add(m);// 只把根节点放入list
			}
		}
		return categorySettingList(_list);
	}

	/**
	 * 对关系完成的栏目进行树形排序
	 * @param list 关系完整的栏目list
	 * @param controller DsCmsBaseController
	 * @return List&gt;DsCmsCategory&lt;
	 */
	public static List<DsCmsCategory> categoryAccess(List<DsCmsCategory> list, DsCmsBaseController controller)
	{
		Map<Long, DsCmsCategory> map = new HashMap<Long, DsCmsCategory>();
		List<DsCmsCategory> _list = new ArrayList<DsCmsCategory>();
		for(DsCmsCategory c : list)
		{
			if(controller.checkCategory(c))
			{
				c.setEnable(true);
				_list.add(c);
			}
			else
			{
				map.put(c.getId(), c);
			}
		}
		List<DsCmsCategory> __list = new ArrayList<DsCmsCategory>();
		for(DsCmsCategory c : _list)
		{
			__list.add(c);
			DsCmsCategory p = null;
			while(c.getPid() != 0 && (p = map.get(c.getPid())) != null)
			{
				__list.add(p);
				map.remove(p.getId());
				c = p;
			}
		}
		return categorySetting(__list);
	}


	/**
	 * 对关系完成的栏目进行树形排序
	 * @param clist 关系完整的栏目list
	 * @param exclude 是否包括外链
	 * @param excludeId 需要排除的栏目
	 * @return List&gt;DsCmsCategory&lt;
	 */
	public static List<DsCmsCategory> queryCategory(List<DsCmsCategory> clist, boolean exclude, long excludeId)
	{
		Map<Long, DsCmsCategory> map = new HashMap<Long, DsCmsCategory>();
		for(DsCmsCategory m : clist)
		{
			map.put(m.getId(), m);
		}
		List<DsCmsCategory> tlist = new ArrayList<DsCmsCategory>();
		for(DsCmsCategory m : clist)
		{
			if(m.getId() != excludeId)
			{
				if(m.getPid() > 0)
				{
					try
					{
						if(m.getScope() == 0 || exclude)
						{
							map.get(m.getPid()).add(m);// 放入其余节点对应的父节点
						}
					}
					catch(Exception e)// 找不到对应的父栏目
					{
					}
				}
				else if(m.getPid() == 0)
				{
					if(m.getScope() == 0 || exclude)
					{
						tlist.add(m);// 只把根节点放入list
					}
				}
			}
		}
		if(excludeId > 0)
		{
			try
			{
				map.get(excludeId).clearList();
			}
			catch(Exception e)
			{
				e.printStackTrace();// 找不到对应的栏目
			}
		}
		List<DsCmsCategory> list = categorySettingList(tlist);
		return list;
	}

	private static final ThreadLocal<String> id = new ThreadLocal<String>();
	private static final ThreadLocal<String> own = new ThreadLocal<String>();
	private static final ThreadLocal<List<String>> ownList = new ThreadLocal<List<String>>();
	private static final ThreadLocal<String> account = new ThreadLocal<String>();
	private static final ThreadLocal<String> name = new ThreadLocal<String>();

	@ModelAttribute
	public void DsCmsInitialization(HttpServletRequest request, HttpServletResponse response)
	{
		AuthOwn m = AuthOwnUtil.getUser(request);
		id.set(m.getId());
		List<String> owns = new ArrayList<String>();
		String[] arr = String.valueOf(m.getOwn()).split(",", -1);
		for(String str : arr)
		{
			str = str.trim();
			if(str.length() > 0)
			{
				if(!owns.contains(str))
				{
					owns.add(str);
				}
			}
		}
		StringBuilder sb = new StringBuilder();
		if(owns.size() > 0)
		{
			sb.append(owns.get(0));
			for(int i = 1; i < owns.size(); i++)
			{
				sb.append(",").append(owns.get(i));
			}
		}
		own.set(sb.toString());
		ownList.set(owns);
		account.set(m.getAccount());
		name.set(m.getName());
	}

	public boolean checkCategory(DsCmsCategory category)
	{
		return false;
	}

	protected static String getId()
	{
		return id.get();
	}

	protected static String getAccount()
	{
		return account.get();
	}

	protected static String getName()
	{
		return name.get();
	}

	protected static List<String> getOwnList()
	{
		return ownList.get();
	}
	
	protected String getPathRoot()
	{
		return session().getServletContext().getRealPath("/") + "/";
	}

	protected String getPathHtml()
	{
		return session().getServletContext().getRealPath("/html") + "/";
	}
}
