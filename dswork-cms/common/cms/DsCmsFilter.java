package common.cms;

import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import common.cms.model.ViewSpecial;

@WebFilter(filterName="dsCmsFilter", urlPatterns="/pvctx/*")
public class DsCmsFilter implements Filter
{
	private String pvctx  = "/pvctx/";
	private String pvf    = "/f/";
	private String pva    = "/a/";
	private String pvm    = "/m/";
	private String pvurl  = "/cmsbuild/buildHTML.chtml";
	
	@Override
	public void init(FilterConfig config)
	{
		System.out.println("DsCmsFilter Initialization");
	}

	@Override
	public void destroy(){}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	{
		HttpServletRequest req  = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequestWrapper requestWrapper  = new HttpServletRequestWrapper(req);
		HttpServletResponseWrapper responseWraper = new HttpServletResponseWrapper(res);
		try
		{
			String myURI = req.getRequestURI().replace(req.getContextPath(), ""); // /pvctx/siteid/* , /pvctx/siteid/m/*
			boolean mobile = false;
			boolean isedit = false;
			if(myURI.startsWith(pvctx))
			{
				myURI = myURI.replace(pvctx, "");
				String siteid = myURI.substring(0, myURI.indexOf("/"));
				String rURI   = myURI.replace(siteid, ""); // /f/* , /a/* , /m/f/* , /m/a/* , /isedit/f/* , /isedit/a/* , /m/isedit/f/* , /m/isedit/a/*
				String qs     = req.getQueryString();
				String vURI   = req.getContextPath() + pvurl + "?";
				if(rURI.startsWith(pvm))// 移动版
				{
					rURI = rURI.replace(pvm, "/");
					vURI += "&mobile=true";
					mobile = true;
				}
				if(siteid.startsWith("_"))// 采编的预览
				{
					siteid = siteid.replace("_", "");
					vURI += "&isedit=true&siteid=" + siteid;
					isedit = true;
				}
				else
				{
					vURI += "&view=true&siteid=" + siteid;
				}
				if(rURI.startsWith(pvf))
				{
					res.sendRedirect(rURI + (qs != null ? "?" + qs : ""));
					return;
				}
				else if(rURI.startsWith(pva))
				{
					String[] arr        = rURI.replace(pva, "").replace(".html", "").split("/");
					String   categoryid = "";
					String   pageid     = "";
					String   page       = "";
					if(arr.length == 2)
					{
						categoryid = arr[0];
						pageid     = arr[1];
						if(pageid.indexOf("_") > 0)
						{
							page = pageid.split("_")[1];
						}
					}
					if(pageid.matches("^\\d+$"))
					{
						vURI += "&categoryid=" + categoryid + "&pageid=" + pageid;
					}
					else
					{
						vURI += "&categoryid=" + categoryid + (!"".equals(page) ? "&page=" + page : "");
					}
					res.sendRedirect(vURI + (qs != null ? qs : ""));
					return;
				}
				else
				{
					if(rURI.indexOf(".html") > 0)
					{
						CmsFactory cms = new CmsFactory(Long.parseLong(siteid), mobile, isedit);
						List<ViewSpecial> specialList = cms.querySpecial();
						if(specialList.size() > 0)
						{
							for (ViewSpecial vs : specialList)
							{
								if(rURI.equals(vs.getUrl()) || (mobile && rURI.equals(vs.getUrl().replace(pvm, "/"))))
								{
									vURI += "&specialid=" + vs.getId();
									res.sendRedirect(vURI + (qs != null ? qs : ""));
									return;
								}
							}
						}
						else
						{
							res.sendRedirect(rURI + (qs != null ? "?" + qs : ""));
							return;
						}
					}
					else
					{
						res.sendRedirect(rURI + (qs != null ? "?" + qs : ""));
						return;
					}
				}
			}
			chain.doFilter(requestWrapper, responseWraper);
		}
		catch (Exception e)
		{
			return;
		}
	}
}