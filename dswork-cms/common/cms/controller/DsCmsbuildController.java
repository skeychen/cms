package common.cms.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import common.cms.CmsFactory;
import common.cms.model.ViewArticle;
import common.cms.model.ViewArticleNav;
import common.cms.model.ViewCategory;
import common.cms.model.ViewSite;
import common.cms.model.ViewSpecial;
import dswork.core.util.TimeUtil;
import dswork.mvc.BaseController;

@Scope("prototype")
@Controller
public class DsCmsbuildController extends BaseController
{
	private static final String CMS_FACTORY_KEY = "CMS_FACTORY_KEY";
	private static final String CMS_FACTORY_KEY_M = "CMS_FACTORY_KEY_M";

	@RequestMapping(
	{
			"/cmsbuild/buildHTML", "/cmsbuild/preview"
	})
	public String buildHTML()
	{
		Long siteid = req.getLong("siteid", -1);
		Long categoryid = req.getLong("categoryid", -1);
		Long pageid = req.getLong("pageid", -1);
		Long specialid = req.getLong("specialid", -1);
		boolean mobile = req.getString("mobile", "false").equals("true");
		boolean view = req.getString("view", "false").equals("true");
		boolean isedit = req.getString("isedit", "false").equals("true");// true是采编的预览
		CmsFactory cms = null;
		if(!view && !isedit)
		{
			if(mobile)
			{
				cms = (CmsFactory) request.getSession().getAttribute(CMS_FACTORY_KEY_M);
				if(cms == null || (cms != null && (siteid != cms.getSite().getId())))
				{
					cms = new CmsFactory(siteid, mobile, false);
					request.getSession().setAttribute(CMS_FACTORY_KEY_M, cms);
				}
			}
			else
			{
				cms = (CmsFactory) request.getSession().getAttribute(CMS_FACTORY_KEY);
				if(cms == null || (cms != null && (siteid != cms.getSite().getId())))
				{
					cms = new CmsFactory(siteid, mobile, false);
					request.getSession().setAttribute(CMS_FACTORY_KEY, cms);
				}
			}
		}
		else
		{
			cms = new CmsFactory(siteid, mobile, isedit);
		}
		cms.setRequest(request);
		put("cms", cms);
		put("year", TimeUtil.getCurrentTime("yyyy"));
		ViewSite s = cms.getSite();
		put("site", s);
		put("mobile", "/m");
		if(view || isedit)
		{
			put("ctx", request.getContextPath() + "/pvctx/" + (isedit ? "_" + s.getId() : s.getId()));
		}
		else
		{
			put("ctx", s.getUrl());
		}
		put("categorylist", cms.queryCategory("0"));// 顶层节点列表
		put("speciallist", cms.querySpecial());
		if(pageid > 0)// 内容页
		{
			ViewArticle p = cms.get(pageid + "");
			ViewCategory c = cms.getCategory(p.getCategoryid() + "");
			put("category", c);
			put("vo", p.getVo());
			put("id", p.getId());
			put("categoryid", p.getCategoryid());
			put("title", p.getTitle());
			put("summary", p.getSummary());
			put("metakeywords", p.getMetakeywords());
			put("metadescription", p.getMetadescription());
			put("releasetime", p.getReleasetime());
			put("releasesource", p.getReleasesource());
			put("releaseuser", p.getReleaseuser());
			put("img", p.getImg());
			put("url", p.getUrl());
			put("content", p.getContent());
			return "/" + s.getFolder() + (mobile ? "/templates/m/" + c.getMpageviewsite() : "/templates/" + c.getPageviewsite());
		}
		if(categoryid > 0)// 栏目页
		{
			int page = req.getInt("page", 1);
			int pagesize = req.getInt("pagesize", 25);
			ViewCategory c = cms.getCategory(categoryid + "");
			if(c.getScope() == 2)
			{
				return null;// 外链
			}
			if(c.getViewsite().length() == 0)
			{
				return null;// 兼容模板为空
			}
			put("categoryparent", cms.getCategory(c.getPid()));// 不再推荐使用
			put("categoryid", categoryid);
			put("category", c);
			put("vo", c.getVo());
			ViewArticleNav nav = cms.queryPage(page, pagesize, false, false, true, c.getUrl(), categoryid);
			put("datalist", nav.getList());
			put("datapageview", nav.getDatapageview());
			put("datauri", nav.getDatauri());
			put("datapage", nav.getDatapage());
			return "/" + s.getFolder() + (mobile ? "/templates/m/" + c.getMviewsite() : "/templates/" + c.getViewsite());
		}
		if(specialid > 0)// 专题页
		{
			ViewSpecial sp = cms.getSpecial(specialid + "");
			return "/" + s.getFolder() + (mobile ? "/templates/m/" + sp.getMviewsite() : "/templates/" + sp.getViewsite());
		}
		return null;
	}
}
