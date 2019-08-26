/**
 * CMSDao
 */
package common.cms;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import common.cms.model.ViewCategory;
import common.cms.model.ViewArticle;
import common.cms.model.ViewSite;
import common.cms.model.ViewSpecial;
import dswork.core.db.MyBatisDao;
import dswork.core.page.Page;
import dswork.core.page.PageRequest;
import dswork.core.util.TimeUtil;

@Repository
@SuppressWarnings("all")
public class DsCmsDao extends MyBatisDao
{
	@Override
	public Class getEntityClass()
	{
		return DsCmsDao.class;
	}

	public ViewSite getSite(Long siteid)
	{
		return (ViewSite)executeSelect("getSite", siteid);
	}

	public ViewCategory getCategory(Long siteid, Long categoryid)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("siteid", siteid);
		map.put("id", categoryid);
		return (ViewCategory)executeSelect("getCategory", map);
	}

	public ViewArticle getArticle(Long siteid, Long pageid)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("siteid", siteid);
		map.put("id", pageid);
		return (ViewArticle)executeSelect("get", map);
	}

	public Page<ViewArticle> queryArticlePage(Long siteid, int currentPage, int pageSize, String idArray, Boolean isDesc, boolean onlyImageTop, boolean onlyPageTop, String ptype, long pbegin, long pend, String keyvalue)
	{
		if(currentPage <= 0){currentPage = 1;}
		if(pageSize <= 0){pageSize = 25;}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("siteid", siteid);
		map.put("idArray", idArray);
		map.put("order", isDesc==null||isDesc?" desc ":"");
		map.put("imgtop", onlyImageTop?"1":"");
		map.put("pagetop", onlyPageTop?"1":"");
		map.put("releasetime", TimeUtil.getCurrentTime());
		map.put("status", "8");// 已发布
		map.put("ptype", ptype);
		map.put("pbegin", pbegin);
		map.put("pend", pend);
		map.put("keyvalue", keyvalue);
		PageRequest rq = new PageRequest(currentPage, pageSize, map);
		return queryPage("query", rq, "queryCount", rq);
	}

	public List<ViewCategory> queryCategoryList(Long siteid)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("siteid", siteid);
		return queryList("queryCategory", map);
	}

	public ViewSpecial getSpecial(Long siteid, Long specialid)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("siteid", siteid);
		map.put("id", specialid);
		return (ViewSpecial)executeSelect("getSpecial", map);
	}
	
	public List<ViewSpecial> querySpecialList(Long siteid)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("siteid", siteid);
		return queryList("querySpecialList", map);
	}
}