/**
 * 站点Service
 */
package dswork.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dswork.cms.dao.DsCmsSiteDao;
import dswork.cms.model.DsCmsSite;
import dswork.core.db.EntityDao;
import dswork.core.db.BaseService;

@Service
@SuppressWarnings("all")
public class DsCmsSiteService// extends BaseService<DsCmsSite, Long>
{
	@Autowired
	private DsCmsSiteDao dao;

//	@Override
//	protected EntityDao getEntityDao()
//	{
//		return dao;
//	}
	
//	public int save(DsCmsSite po)
//	{
//		return dao.save(po);
//	}
	
	public DsCmsSite get(Long id)
	{
		return dao.get(id);
	}

	public List<DsCmsSite> queryListSite(List<String> ownList)
	{
		return dao.queryList(ownList);
	}
}
