/**
 * 站点Dao
 */
package dswork.cms.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import dswork.cms.model.DsCmsSite;
import dswork.core.db.BaseDao;
import dswork.core.db.MyBatisDao;

@Repository
@SuppressWarnings("all")
public class DsCmsSiteDao extends MyBatisDao//BaseDao<DsCmsSite, Long>
{
	@Override
	public Class getEntityClass()
	{
		return DsCmsSiteDao.class;
	}
	
	public DsCmsSite get(Long id)
	{
		return (DsCmsSite)executeSelect("select", id);
	}

	public List<DsCmsSite> queryList(List<String> ownList)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ownList", ownList);
		return queryList("query", map);
	}
}
