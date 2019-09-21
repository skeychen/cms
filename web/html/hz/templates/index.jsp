<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%common.cms.CmsFactory cms = (common.cms.CmsFactory)request.getAttribute("cms");%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8"/>
<title>${site.name}</title>
</head>
<body>
<%@include file="include/header.jsp"%>

<div class="mg-banner vus-relative">
	<div class="swiper-container swiper-container-banner">
		<ul class="swiper-wrapper">
			<%cms.put("list45", true, 1, 4, true, true, true, 45);%>
			<c:forEach items="${list45}" var="d">
			<li class="swiper-slide">
				<a target="_blank" href="${d.url}" class="mg-bg-cover" style="background-image:url(${d.img})"></a>
			</li>
			</c:forEach>
		</ul>
		<div class="swiper-pagination swiper-pagination-banner"></div>
	</div>
</div>
<link rel="stylesheet" href="${ctx}/f/res/js/swiper/swiper.min.css">
<script>
new Swiper('.swiper-container-banner', {
	pagination: '.swiper-pagination-banner',
	loop: true,
	autoplay: 3000,
	paginationClickable: true
});
</script>


<div class="vus-container vus-relative">



<%cms.put("listGg", true, 1, 3, true, true, true, 49); %>
<div class="mg-notice vus-pt-20">
	<div class="vus-pt-10 vus-pb-10 vus-bg--white vus-h-px-50">
		<div class="title vus-fl vus-pl-20 vus-pr-15">
			<img src="${ctx}/f/res/image/notice.png" class="vus-inline-block vus-align-middle vus-w-px-25">
			<span class="vus-fs-20 vus-color--red vus-inline-block vus-align-middle vus-pl-5">通知公告</span>
		</div>
		<div class="item vus-h-px-30 vus-hidden vus-fl">
		<div class="swiper-container vus-h-px-30 swiper-container-notice">
				<ul class="swiper-wrapper">
					<c:forEach items="${listGg}" var="d">
					<li class="swiper-slide">
						<div class="vus-w-max-75 vus-fl vus-text-ellipsis">
							<a href="${d.url}" class="vus-inline-block vus-fs-18">${d.title}</a>
						</div>
						<span class="vus-inline-block vus-color--gray vus-pl-30">${d.releasedate}</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="more vus-fl vus-text-right vus-pr-20 vus-pt-2">
			<a href="${ctx}/a/49/index.html" class="vus-color--dark">
				<span class="vus-inline-block vus-align-middle">更多</span>
				<img src="${ctx}/f/res/image/more.png" class="vus-inline-block vus-align-middle">
			</a>
		</div>
	</div>
</div>
<script>
new Swiper('.swiper-container-notice', {
	pagination: '.swiper-pagination-notice',
	loop: true,
	autoplay: 5000,
	direction: 'vertical',
	paginationClickable: true
});
</script>



<div class="mg-news vus-pt-20">
	<div class="vus-bg--white vus-clearfix">
		<div class="vus-w-50 vus-fl vus-pl-20 vus-pr-20">
			<div class="mg-title vus-border-bottom-1 vus-hidden">
				<div class="vus-fl vus-h-100">
					<img src="${ctx}/f/res/image/news-1.png" class="vus-inline-block vus-align-middle">
					<span class="vus-inline-block vus-align-middle vus-fs-20 vus-pl-10">广州会展头条</span>
				</div>
				<div class="vus-fr vus-h-100">
					<a href="${ctx}/a/7/index.html" class="vus-color--dark">
						<span class="vus-inline-block vus-align-middle">更多</span>
						<img src="${ctx}/f/res/image/more.png" class="vus-inline-block vus-align-middle">
					</a>
				</div>
			</div>
			<%cms.put("listHztt", true, 1, 4, true, true, true, 7);%>
			<ul class="vus-pt-10 vus-pb-10">
				<c:forEach items="${listHztt}" var="d">
					<li class="vus-pt-10 vus-pb-10 vus-clearfix">
						<div class="vus-w-px-170 vus-h-px-100 vus-bg--gray-smoke vus-hidden vus-fl">
							<a href="${d.url}" class="mg-bg-cover hover vus-anim-all" style="background-image: url(${d.img})"></a>
						</div>
						<div class="list-content vus-fr">
							<h5 class="vus-h5 vus-fs-18 vus-text-ellipsis">
								<a href="${d.url}">${d.title}</a>
							</h5>
							<div class="summary vus-hidden vus-color--gray vus-text-ellipsis line-2">${d.summary}</div>
							<div class="vus-pt-3 vus-color--gray">
								<img src="${ctx}/f/res/image/time.png" class="vus-inline-block vus-align-middle vus-w-px-16 vus-h-px-16">
								<span class="vus-inline-block vus-align-middle">${d.releasedate}</span>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<div class="vus-w-50 vus-fr vus-pl-20 vus-pr-20">
			<div class="mg-title vus-border-bottom-1 vus-hidden">
				<div class="vus-fl vus-h-100">
					<img src="${ctx}/f/res/image/news-2.png" class="vus-inline-block vus-align-middle">
					<span class="vus-inline-block vus-align-middle vus-fs-20 vus-pl-10">会展综合新闻</span>
				</div>
				<div class="vus-fr vus-h-100">
					<a href="${ctx}/a/8/index.html" class="vus-color--dark">
						<span class="vus-inline-block vus-align-middle">更多</span>
						<img src="${ctx}/f/res/image/more.png" class="vus-inline-block vus-align-middle">
					</a>
				</div>
			</div>
			<%cms.put("listHzzh", true, 1, 4, true, true, true, 8);%>
			<div class="vus-pt-20">
				<div class="vus-h-px-200 vus-hidden">
					<div class="swiper-container swiper-container-news vus-h-px-200">
						<ul class="swiper-wrapper">
							<c:forEach items="${listHzzh}" var="d">
								<li class="swiper-slide">
									<a href="${d.url}" class="mg-bg-cover" style="background-image: url(${d.img})"></a>
								</li>
							</c:forEach>
						</ul>
						<div class="swiper-pagination swiper-pagination-news"></div>
					</div>
				</div>
			</div>
			<ul class="vus-pt-10">
				<c:forEach items="${listHzzh}" var="d" varStatus="i">
					<li class="list-item vus-clearfix">
						<i class="vus-w-px-35 vus-pl-5 vus-fs-26 vus-fl vus-fw-600 vus-color--red vus-fs-italic">${i.count}</i>
						<div class="content vus-fl vus-text-ellipsis vus-fs-18">
							<a href="${d.url}">${d.title}</a>
						</div>
						<div class="vus-fr vus-color--gray vus-pr-5">${d.releasedate}</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>



<div class="mg-brand vus-pt-20">
	<div class="vus-bg--white vus-clearfix vus-pl-20 vus-pr-20">
		<div class="mg-title vus-border-bottom-1 vus-hidden">
			<div class="vus-fl vus-h-100">
				<img src="${ctx}/f/res/image/ppzh.png" class="vus-inline-block vus-align-middle">
				<span class="vus-inline-block vus-align-middle vus-fs-20 vus-pl-10">品牌展会</span>
			</div>
			<div class="vus-fr vus-h-100">
				<a href="${ctx}/a/10/index.html" class="vus-color--dark">
					<span class="vus-inline-block vus-align-middle">更多</span>
					<img src="${ctx}/f/res/image/more.png" class="vus-inline-block vus-align-middle">
				</a>
			</div>
		</div>
		<%cms.put("listZhpq", true, 1, 4, true, true, true, 10);%>
		<div class="vus-pt-20 vus-pb-20 vus-clearfix">
			<c:set var="zhpqcount" value="0" scope="request" /><c:forEach items="${listZhpq}" var="d"
			><c:if test="${fn:length(d.img)>0}"
			><c:set var="zhpqcount" value="${zhpqcount+1}" scope="request" /><c:if test="${zhpqcount <= 1}">
			<div class="imgs vus-fl vus-hidden vus-relative vus-bg--gray-smoke mg-up-layer-hover">
				<a class="mg-bg-cover" style="background-image: url(${d.img})"></a>
				<div class="mg-up-layer vus-absolute vus-position-bottom vus-position-left vus-zindex-2 vus-anim-all">
					<div class="vus-img-wrapper">
						<div class="vus-img-container">
							<div class="vus-img-inner vus-pl-10 vus-pr-10">
								<p class="vus-pb-10 vus-text-ellipsis vus-fs-18">${d.title}</p>
								<p class="vus-pb-2 vus-text-ellipsis">地址：${d.releaseuser}</p>
								<p class="vus-pb-2 vus-text-ellipsis">时间：${d.pbegindate} 至 ${d.penddate}</p>
								<div class="vus-pt-15">
									<a href="${d.url}" class="vus-btn small white">查看详情</a>
									<a href="${d.vo.gw}" target="_blank" class="vus-btn small white vus-ml-5">访问官网</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:if></c:if></c:forEach>
			<ul class="list vus-hidden vus-fr">
				<c:forEach items="${listZhpq}" var="d">
				<li class="item vus-pt-10 vus-border-bottom-1 vus-clearfix">
					<h5 class="vus-h5 vus-fs-18 vus-hidden vus-mb-5">
						<img src="${ctx}/f/res/image/arrow.png" class="vus-w-px-10 vus-h-px-10 vus-fl vus-mt-6">
						<div class="tit vus-fl vus-pl-5 vus-text-ellipsis">
							<a href="${d.url}">${d.title}</a>
						</div>
					</h5>
					<p class="vus-color--gray vus-pl-14 vus-text-ellipsis">地址：${d.releaseuser}<span class="vus-pl-10 vus-pr-10">|</span>时间：${d.pbegindate} 至 ${d.penddate}</p>
				</li>
				</c:forEach>
			</ul>
		</div>

		<div class="date-tit vus-relative vus-hidden">
			<img src="${ctx}/f/res/image/hzpq-title.png" class="vus-img-fluid">
			<div class="vus-color--white vus-absolute vus-position-left vus-position-top vus-position-bottom vus-fs-20">
				<div class="vus-pt-30 vus-pl-40">展会排期</div>
			</div>
			<div class="month-wrap vus-absolute vus-position-top vus-position-right">
				<ul class="vus-pt-20 vus-pt-lg-25 vus-clearfix vus-fs-16">
					<li id="month1" onclick="tabs('month',1,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white active vus-mr-10">1月</li>
					<li id="month2" onclick="tabs('month',2,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">2月</li>
					<li id="month3" onclick="tabs('month',3,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">3月</li>
					<li id="month4" onclick="tabs('month',4,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">4月</li>
					<li id="month5" onclick="tabs('month',5,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">5月</li>
					<li id="month6" onclick="tabs('month',6,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">6月</li>
					<li id="month7" onclick="tabs('month',7,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">7月</li>
					<li id="month8" onclick="tabs('month',8,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">8月</li>
					<li id="month9" onclick="tabs('month',9,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">9月</li>
					<li id="month10" onclick="tabs('month',10,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">10月</li>
					<li id="month11" onclick="tabs('month',11,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">11月</li>
					<li id="month12" onclick="tabs('month',12,12)" class="vus-fl vus-radius-large m-item vus-text-center vus-bg--white vus-mr-10">12月</li>
				</ul>
			</div>
			<div class="vus-absolute vus-position-right vus-position-top vus-pt-15 vus-pr-15 vus-fs-16">
				<a href="${ctx}/a/48/index.html" class="vus-color--white underline">更多&gt;&gt;</a>
			</div>
		</div>
		<div style="height:300px;overflow:hidden;">
		<%long year = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);%>
		<%cms.put("listZhpqFull", true, 1, 10000, true, true, true, null, year*10000000000L, year*10000000000L+1231999999L, null, 48);%>
		<c:forEach var="zhpqIndex" begin="1" end="12">
		<ul id="month_${zhpqIndex}" class="date-list vus-pt-5 vus-pb-20 vus-clearfix" style="display:none;"><c:set var="zhpqcount" value="0" scope="request" />
			<c:forEach items="${listZhpqFull}" var="d"
				><c:if test="${fn:startsWith(d.pbegin, year*100+(zhpqIndex<10?'0':'')+zhpqIndex)}"
				><c:set var="zhpqcount" value="${zhpqcount+1}" scope="request" />
				<c:if test="${zhpqcount <= 6}">
				<li class="item vus-w-50">
					<div class="vus-pt-15 vus-pb-15 vus-border-bottom-1 vus-clearfix">
						<div class="vus-w-px-90 vus-h-px-60 vus-bg--gray-smoke vus-fl">
							<div class="vus-img-wrapper">
								<div class="vus-img-container vus-h-px-60">
									<a href="${d.url}"><img src="${d.img}" class="vus-img-inner"/></a>
								</div>
							</div>
						</div>
						<div class="mg-calc-1 vus-fr vus-pl-10">
							<h5 class="vus-h5 vus-fs-18 vus-text-ellipsis"><a href="${d.url}">${d.title}</a></h5>
							<p class="vus-color--gray vus-text-ellipsis">地址：${d.releaseuser}<span class="vus-pl-10 vus-pr-10">|</span>时间：${d.pbegindate} 至 ${d.penddate}</p>
						</div>
					</div>
				</li>
				</c:if
				></c:if
			></c:forEach>
		</ul>
		</c:forEach>
		</div>
	</div>
</div>
<script>
!function(){
	var d = new Date();
	$("#month" + (d.getMonth()+1)).click();
}();
</script>

<div class="mg-exhibition vus-pt-20">
	<div class="vus-bg--white vus-clearfix vus-pl-20 vus-pr-20">
		<div class="mg-title vus-border-bottom-1 vus-hidden">
			<div class="vus-fl vus-h-100">
				<img src="${ctx}/f/res/image/bzhj.png" class="vus-inline-block vus-align-middle">
				<span class="vus-inline-block vus-align-middle vus-fs-20 vus-pl-10">办展环境</span>
			</div>
			<div class="vus-fl vus-pl-20">
				<ul class="mg-tabs vus-fs-16 vus-pt-5 js-tabs">
					<li name="exhibition1" class="item active">政策法规</li>
					<li name="exhibition2" class="item">场馆推荐</li>
					<li name="exhibition3" class="item">合作伙伴</li>
					<li name="exhibition4" class="item">酒店配套</li>
					<li name="exhibition5" class="item">交通出行</li>
					<li name="exhibition6" class="item">旅游文化</li>
				</ul>
			</div>
			<div class="vus-fr vus-h-100">
				<a href="expo-related.html" class="vus-color--dark">
					<span class="vus-inline-block vus-align-middle">更多</span>
					<img src="${ctx}/f/res/image/more.png" class="vus-inline-block vus-align-middle">
				</a>
			</div>
		</div>
		<div class="vus-pt-10 vus-pb-10 vus-hidden">
			<ul id="exhibition1" class="vus-pb-20 vus-clearfix list-1">
				<%cms.put("listBzZcfg", true, 1, 10, true, true, true, 51);%>
				<c:forEach items="${listBzZcfg}" var="d">
				<li class="vus-w-50 item">
					<div class="vus-border-bottom-1 vus-clearfix">
						<div class="mg-calc-1 vus-text-ellipsis vus-fs-18 vus-fl">
							<a href="${d.url}"><span>【${d.ptype}】</span>${d.title}</a>
						</div>
						<span class="vus-fr vus-color--gray">${d.pbegindate}</span>
					</div>
				</li>
				</c:forEach>
			</ul>

			<ul id="exhibition2" class="ul-1 vus-pt-10 vus-clearfix" style="display: none;">
				<%cms.put("listBzZgtj", true, 1, 8, true, true, true, 11);%><%--场馆推荐--%>
				<c:forEach items="${listBzZgtj}" var="d">
				<li class="item vus-mr-20 vus-fl">
					<div class="img vus-hidden vus-bg--gray-smoke vus-relative mg-up-layer-hover">
						<a class="mg-bg-cover" style="background-image:url(${d.img})"></a>
						<div class="mg-up-layer vus-absolute vus-position-bottom vus-position-left vus-zindex-2 vus-anim-all">
							<div class="vus-img-wrapper">
								<div class="vus-img-container">
									<div class="vus-img-inner vus-pl-10 vus-pr-10">
										<p class="vus-pb-2 vus-text-ellipsis">联系方式：${d.vo.lxdh}</p>
										<p class="vus-text-ellipsis">地址：${d.vo.dz}</p>
										<div class="vus-pt-15">
											<a href="${d.url}" class="vus-btn small white">查看详情</a>
											<a href="${d.vo.gw}" target="_blank" class="vus-btn small white vus-ml-5">访问官网</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="vus-fs-16 vus-pt-10 vus-pb-20 vus-text-ellipsis"><a href="expo-related-details-2.html">${d.title}</a></div>
				</li>
				</c:forEach>
			</ul>

			<ul id="exhibition3" class="ul-1 vus-pt-10 vus-clearfix" style="display: none;">
				<%cms.put("listBzHzhb", true, 1, 8, true, true, true, 17, 18, 19, 39, 40, 41);%><%--合作伙伴--%>
				<c:forEach items="${listBzHzhb}" var="d">
				<li class="item vus-mr-20 vus-fl">
					<div class="img vus-hidden vus-bg--gray-smoke vus-relative mg-up-layer-hover">
						<div class="vus-img-wrapper">
							<div class="vus-img-container img">
								<img src="${d.img}" class="vus-img-inner">
							</div>
						</div>
						<div class="mg-up-layer vus-absolute vus-position-bottom vus-position-left vus-zindex-2 vus-anim-all">
							<div class="vus-img-wrapper">
								<div class="vus-img-container">
									<div class="vus-img-inner vus-pl-10 vus-pr-10">
										<p class="vus-pb-2 vus-text-ellipsis">联系方式：${d.vo.lxdh}</p>
										<p class="vus-text-ellipsis">地址：${d.vo.dz}</p>
										<div class="vus-pt-15">
											<a href="${d.url}" class="vus-btn small white">查看详情</a>
											<a href="${d.vo.gw}" target="_blank" class="vus-btn small white vus-ml-5">访问官网</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="vus-fs-16 vus-pt-10 vus-pb-20 vus-text-ellipsis"><a href="expo-related-details-1.html">${d.title}</a></div>
				</li>
				</c:forEach>
			</ul>

			<ul id="exhibition4" class="ul-1 vus-pt-10 vus-clearfix" style="display: none;"><%--min-height:438px;--%>
				<%cms.put("listBzJzpt", true, 1, 8, true, true, true, 13);%><%--酒店配套--%>
				<c:forEach items="${listBzJzpt}" var="d">
				<li class="item vus-mr-20 vus-fl">
					<div class="img vus-hidden vus-bg--gray-smoke vus-relative mg-up-layer-hover">
						<div class="vus-img-wrapper">
							<div class="vus-img-container img">
								<img src="${d.img}" class="vus-img-inner">
							</div>
						</div>
						<div class="mg-up-layer vus-absolute vus-position-bottom vus-position-left vus-zindex-2 vus-anim-all">
							<div class="vus-img-wrapper">
								<div class="vus-img-container">
									<div class="vus-img-inner vus-pl-10 vus-pr-10">
										<p class="vus-pb-2 vus-text-ellipsis">联系方式：${d.vo.lxdh}</p>
										<p class="vus-text-ellipsis">地址：${d.vo.dz}</p>
										<div class="vus-pt-15">
											<a href="${d.url}" class="vus-btn small white">查看详情</a>
											<a href="${d.vo.gw}" target="_blank" class="vus-btn small white vus-ml-5">访问官网</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="vus-fs-16 vus-pt-10 vus-pb-20 vus-text-ellipsis"><a href="expo-related-details-1.html">${d.title}</a></div>
				</li>
				</c:forEach>
			</ul>

			<%--交通出行--%>
			<ul id="exhibition5" class="ul-2 vus-pt-10 vus-pb-10 vus-clearfix" style="display: none;">
				<li class="item vus-mr-20 vus-fl">
					<div class="img vus-w-100 vus-hidden vus-bg--gray-smoke">
						<a href="${ctx}/a/27/index.html" class="mg-bg-cover hover vus-anim-all" style="background-image: url(${ctx}/f/res/image/cx-1.jpg)"></a>
					</div>
				</li>
				<li class="item vus-mr-20 vus-fl">
					<div class="img vus-w-100 vus-hidden vus-bg--gray-smoke">
						<a href="${ctx}/a/28/index.html" class="mg-bg-cover hover vus-anim-all" style="background-image: url(${ctx}/f/res/image/cx-2.jpg)"></a>
					</div>
				</li>
				<li class="item vus-mr-20 vus-fl">
					<div class="img vus-w-100 vus-hidden vus-bg--gray-smoke">
						<a href="${ctx}/a/29/index.html" class="mg-bg-cover hover vus-anim-all" style="background-image: url(${ctx}/f/res/image/cx-3.jpg)"></a>
					</div>
				</li>
				<li class="item vus-mr-20 vus-fl">
					<div class="img vus-w-100 vus-hidden vus-bg--gray-smoke">
						<a href="${ctx}/a/30/index.html" class="mg-bg-cover hover vus-anim-all" style="background-image: url(${ctx}/f/res/image/cx-4.jpg)"></a>
					</div>
				</li>
			</ul>

			<div id="exhibition6" class="vus-pt-10 vus-pb-10 vus-clearfix" style="display: none;">
				<div class="swiper-container swiper-container-travel">
					<ul class="swiper-wrapper">
						<%cms.put("listBzJzpt", true, 1, 24, true, true, true, 31, 32, 33);%><%--旅游文化--%>
						<c:forEach items="${listBzJzpt}" var="d">
						<li class="swiper-slide">
							<div class="vus-mx-auto vus-w-100 travel-img">
								<a href="${d.url}" class="mg-bg-cover" style="background-image: url(${d.img})"></a>
								<h5 class="vus-h5 vus-fs-18 vus-pt-10 vus-text-ellipsis">
									<a href="${d.url}">${d.title}</a>
								</h5>
								<div class="vus-color--gray vus-hidden travel-txt vus-text-ellipsis line-3">
									${d.summary}
								</div>
							</div>
						</li>
						</c:forEach>
					</ul>
					<!-- Add pagination -->
					<div class="swiper-pagination swiper-pagination-travel"></div>
				</div>
			</div>
			<script>
			var updateSwiperTravel = new Swiper('.swiper-container-travel', {
				pagination: '.swiper-pagination-travel',
				paginationClickable: true,
				slidesPerView: 4,
				spaceBetween: 20,
				grabCursor: true,
				observer: true,
				observeParents: true,
			});
			</script>
		</div>
	</div>
</div>



<div class="mg-money vus-pt-20">
	<div class="vus-pt-10 vus-pb-10 vus-bg--white vus-h-px-50">
		<div class="title vus-fl vus-pl-20 vus-pr-15">
			<img src="${ctx}/f/res/image/money.png" class="vus-inline-block vus-align-middle vus-w-px-25">
			<span class="vus-fs-20 vus-color--red vus-inline-block vus-align-middle vus-pl-5">资金申请</span>
		</div>
		<div class="item vus-h-px-30 vus-hidden vus-fl">
			<div class="swiper-container vus-h-px-30 swiper-container-money">
				<ul class="swiper-wrapper">
				<%cms.put("listFwZjsq", true, 1, 3, true, true, true, 50);%>
				<c:forEach items="${listFwZjsq}" var="d">
					<li class="swiper-slide">
						<div class="vus-w-max-75 vus-fl vus-text-ellipsis">
							<a href="${d.url}" class="vus-inline-block vus-fs-18">${d.title}</a>
						</div>
						<span class="vus-inline-block vus-color--gray vus-pl-30">${d.releasedate}</span>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
		<div class="more vus-fl vus-text-right vus-pr-20 vus-pt-2">
			<a href="${ctx}/a/50/index.html" class="vus-color--dark">
				<span class="vus-inline-block vus-align-middle">详情</span>
				<img src="${ctx}/f/res/image/more.png" class="vus-inline-block vus-align-middle">
			</a>
		</div>
	</div>
</div>
<script>
new Swiper('.swiper-container-money', {
	pagination: '.swiper-pagination-money',
	loop: true,
	autoplay: 5000,
	direction: 'vertical',
	paginationClickable: true
});
</script>



<div class="mg-service vus-pt-20">
	<div class="vus-bg--white vus-clearfix vus-pl-20 vus-pr-20">
		<div class="mg-title vus-border-bottom-1 vus-hidden">
			<div class="vus-fl vus-h-100">
				<img src="${ctx}/f/res/image/hzfw.png" class="vus-inline-block vus-align-middle">
				<span class="vus-inline-block vus-align-middle vus-fs-20 vus-pl-10">会展服务</span>
			</div>
			<div class="vus-fr vus-h-100">
				<a href="${ctx}/a/36/index.html" class="vus-color--dark">
					<span class="vus-inline-block vus-align-middle">更多</span>
					<img src="${ctx}/f/res/image/more.png" class="vus-inline-block vus-align-middle">
				</a>
			</div>
		</div>
		<ul class="vus-pt-20 vus-pb-20 vus-clearfix vus-text-center vus-fs-18">
			<c:forEach items="${hzfwCategoryList}" var="d"><c:if test="${d.id != 50}">
			<li class="item vus-fl vus-pt-10 vus-pb-10">
				<a href="${d.url}">
					<img src="${d.img}" class="vus-img vus-mx-auto vus-anim-all">
					<div class="vus-pt-15">${d.title}</div>
				</a>
			</li>
			</c:if></c:forEach>
		</ul>
	</div>
</div>

<!-- 会展人才 -->
<%cms.put("listRcAD", true, 1, 4, true, true, true, 47);%><%--首页会展人才广告--%>
<div class="mg-job vus-pt-20">
	<div class="vus-bg--white vus-clearfix vus-pl-20 vus-pr-20">
		<!-- 标题 -->
		<div class="mg-title vus-border-bottom-1 vus-hidden">
			<div class="vus-fl vus-h-100">
				<img src="${ctx}/f/res/image/hzrc.png" class="vus-inline-block vus-align-middle">
				<span class="vus-inline-block vus-align-middle vus-fs-20 vus-pl-10">会展人才</span>
			</div>
			<div class="vus-fl vus-pl-20">
				<ul class="mg-tabs vus-fs-16 vus-pt-5 js-tabs">
					<li name="job1" class="item active">人才招聘</li>
					<li name="job2" class="item">职场攻略</li>
					<li name="job3" class="item">会展商学院</li>
				</ul>
			</div>
			<div class="vus-fr vus-h-100">
				<a href="${ctx}/a/24/index.html" class="vus-color--dark">
					<span class="vus-inline-block vus-align-middle">更多</span>
					<img src="${ctx}/f/res/image/more.png" class="vus-inline-block vus-align-middle">
				</a>
			</div>
		</div>
		<div class="vus-pt-10 vus-pb-10">
			<!-- 人才招聘 -->
			<div id="job1" class="vus-clearfix">
				<ul class="vus-fl mg-calc-3 vus-pr-30">
					<li class="j-item vus-clearfix vus-pt-15 vus-pb-15">
						<div class="vus-w-px-120 vus-h-px-90 vus-hidden vus-fl vus-bg--gray-smoke">
							<a href="job-details.html" class="mg-bg-cover hover vus-anim-all" style="background-image:url(https://img01.zhaopin.cn/img_button/201907/19/1_094354791043.jpg);"></a>
						</div>
						<div class="mg-calc-2 vus-fr vus-pl-15">
							<div class="vus-clearfix">
								<div class="vus-fw-500 vus-fs-18 vus-w-60 vus-fl vus-hidden">
									<div class="vus-w-max-75 vus-text-ellipsis vus-fl vus-pr-5">
										<a href="job-details.html" class="vus-align-middle">策划专员</a>
									</div>
									<span class="vus-badge vus-align-middle vus-bg--warning">顶</span>
									<span class="vus-badge vus-align-middle">急</span>
								</div>
								<div class="vus-w-40 vus-fr vus-text-right vus-text-ellipsis">
									<span class="vus-align-middle">广东光合作用文化发展有限公司</span>
								</div>
							</div>
							<div class="vus-clearfix">
								<ul class="j-item-1 vus-text-ellipsis vus-w-70 vus-fl">
									<li class="vus-fl vus-relative vus-pr-20 vus-color--orange vus-fs-16">16K</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">广州 - 海珠区</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">1-3年</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">学历不限</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">招1人</li>
								</ul>
								<div class="vus-fr j-item-1">
									民营 <span class="vus-color--gray-silver vus-pl-5 vus-pr-5">|</span>
									50-100人
								</div>
							</div>
							<div class="vus-pt-5 vus-clearfix">
								<span class="vus-tag small light">五险一金</span>
								<span class="vus-tag small light">绩效奖金</span>
								<span class="vus-tag small light">交通补助</span>
								<span class="vus-tag small light">餐补</span>
								<span class="vus-tag small light">福利</span>
								<span class="vus-tag small light">带薪年假</span>
							</div>
						</div>
					</li>
					<li class="j-item vus-clearfix vus-pt-15 vus-pb-15">
						<div class="vus-w-px-120 vus-h-px-90 vus-hidden vus-fl vus-bg--gray-smoke">
							<a href="job-details.html" class="mg-bg-cover hover vus-anim-all" style="background-image:url(https://article.zhaopin.com/marketing/upload/d8553d2c-a445-48bf-8d90-469b162e0c80.jpg);"></a>
						</div>
						<div class="mg-calc-2 vus-fr vus-pl-15">
							<div class="vus-clearfix">
								<div class="vus-fw-500 vus-fs-18 vus-w-60 vus-fl vus-hidden">
									<div class="vus-w-max-75 vus-text-ellipsis vus-fl vus-pr-5">
										<a href="job-details.html" class="vus-align-middle">销售主管</a>
									</div>
									<span class="vus-badge vus-align-middle">急</span>
								</div>
								<div class="vus-w-40 vus-fr vus-text-right vus-text-ellipsis">
									<span class="vus-align-middle">广州军创展览服务有限公司</span>
								</div>
							</div>
							<div class="vus-clearfix">
								<ul class="j-item-1 vus-text-ellipsis vus-w-70 vus-fl">
									<li class="vus-fl vus-relative vus-pr-20 vus-color--orange vus-fs-16">5K-8K</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">广州 - 海珠区</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">1-3年</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">学历不限</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">招1人</li>
								</ul>
								<div class="vus-fr j-item-1">
									民营 <span class="vus-color--gray-silver vus-pl-5 vus-pr-5">|</span>
									50-100人
								</div>
							</div>
							<div class="vus-pt-5 vus-clearfix">
								<span class="vus-tag small light">五险一金</span>
								<span class="vus-tag small light">绩效奖金</span>
								<span class="vus-tag small light">交通补助</span>
								<span class="vus-tag small light">餐补</span>
								<span class="vus-tag small light">福利</span>
								<span class="vus-tag small light">带薪年假</span>
							</div>
						</div>
					</li>
					<li class="j-item vus-clearfix vus-pt-15 vus-pb-15">
						<div class="vus-w-px-120 vus-h-px-90 vus-hidden vus-fl vus-bg--gray-smoke">
							<a href="job-details.html" class="mg-bg-cover hover vus-anim-all" style="background-image:url(image/placeholder.png);"></a>
						</div>
						<div class="mg-calc-2 vus-fr vus-pl-15">
							<div class="vus-clearfix">
								<div class="vus-fw-500 vus-fs-18 vus-w-60 vus-fl vus-hidden">
									<div class="vus-w-max-75 vus-text-ellipsis vus-fl vus-pr-5">
										<a href="job-details.html" class="vus-align-middle">会展策划主管</a>
									</div>
									<span class="vus-badge vus-align-middle">急</span>
								</div>
								<div class="vus-w-40 vus-fr vus-text-right vus-text-ellipsis">
									<span class="vus-align-middle">广州万耀纵横展览有限公司</span>
								</div>
							</div>
							<div class="vus-clearfix">
								<ul class="j-item-1 vus-text-ellipsis vus-w-70 vus-fl">
									<li class="vus-fl vus-relative vus-pr-20 vus-color--orange vus-fs-16">10K-12K</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">广州 - 海珠区</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">1-3年</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">学历不限</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">招1人</li>
								</ul>
								<div class="vus-fr j-item-1">
									民营 <span class="vus-color--gray-silver vus-pl-5 vus-pr-5">|</span>
									50-100人
								</div>
							</div>
							<div class="vus-pt-5 vus-clearfix">
								<span class="vus-tag small light">五险一金</span>
								<span class="vus-tag small light">绩效奖金</span>
								<span class="vus-tag small light">交通补助</span>
								<span class="vus-tag small light">餐补</span>
								<span class="vus-tag small light">福利</span>
								<span class="vus-tag small light">带薪年假</span>
							</div>
						</div>
					</li>
					<li class="j-item vus-clearfix vus-pt-15 vus-pb-15">
						<div class="vus-w-px-120 vus-h-px-90 vus-hidden vus-fl vus-bg--gray-smoke">
							<a href="job-details.html" class="mg-bg-cover hover vus-anim-all" style="background-image:url(image/placeholder.png);"></a>
						</div>
						<div class="mg-calc-2 vus-fr vus-pl-15">
							<div class="vus-clearfix">
								<div class="vus-fw-500 vus-fs-18 vus-w-60 vus-fl vus-hidden">
									<div class="vus-w-max-75 vus-text-ellipsis vus-fl vus-pr-5">
										<a href="job-details.html" class="vus-align-middle">展会业务</a>
									</div>
									<span class="vus-badge vus-align-middle vus-bg--warning">顶</span>
								</div>
								<div class="vus-w-40 vus-fr vus-text-right vus-text-ellipsis">
									<span class="vus-align-middle">广州万耀纵横展览有限公司</span>
								</div>
							</div>
							<div class="vus-clearfix">
								<ul class="j-item-1 vus-text-ellipsis vus-w-70 vus-fl">
									<li class="vus-fl vus-relative vus-pr-20 vus-color--orange vus-fs-16">16K-20K</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">广州 - 海珠区</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">1-3年</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">学历不限</li>
									<li class="vus-fl vus-relative vus-pr-10 vus-pl-10 vus-color--gray">招1人</li>
								</ul>
								<div class="vus-fr j-item-1">
									民营 <span class="vus-color--gray-silver vus-pl-5 vus-pr-5">|</span>
									50-100人
								</div>
							</div>
							<div class="vus-pt-5 vus-clearfix">
								<span class="vus-tag small light">五险一金</span>
								<span class="vus-tag small light">绩效奖金</span>
								<span class="vus-tag small light">交通补助</span>
								<span class="vus-tag small light">餐补</span>
								<span class="vus-tag small light">福利</span>
								<span class="vus-tag small light">带薪年假</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="ad-1 vus-fr vus-hidden vus-pt-10 vus-pb-10">
					<div class="swiper-container swiper-container-job-1 vus-h-100">
						<ul class="swiper-wrapper">
							<c:forEach items="${listRcZcgl}" var="d">
							<li class="swiper-slide">
								<a href="${d.url}" class="mg-bg-cover" style="background-image: url(${d.img})"></a>
							</li>
							</c:forEach>
							<li class="swiper-slide">
								<a class="mg-bg-cover" style="background-image: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563788820842&di=d9acd020ee843cedfc17be663ea72520&imgtype=0&src=http%3A%2F%2Fimg.redocn.com%2Fsheji%2F20180123%2Fchuangyizhaopinhaibao_9164319.jpg)"></a>
							</li>
							<li class="swiper-slide">
								<a class="mg-bg-cover" style="background-image: url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1563861111463&di=ffc2e08c6aad839f80a14b0d142674d2&imgtype=0&src=http%3A%2F%2Fimg.sccnn.com%2Fbimg%2F341%2F11773.jpg)"></a>
							</li>
						</ul>
						<div class="swiper-pagination swiper-pagination-job-1"></div>
					</div>
				</div>
				<script>
				var updateSwiperJob1 = new Swiper('.swiper-container-job-1', {
					pagination: '.swiper-pagination-job-1',
					paginationClickable: true,
					loop: true,
					autoplay: 5000,
					observer: true,
					observeParents: true,
				});
				</script>
			</div>
			<div id="job2" class="vus-clearfix" style="display: none;">
				<ul class="vus-fl mg-calc-3 vus-pr-30">
					<%cms.put("listRcZcgl", true, 1, 4, true, true, true, 25);%><%-- 职场攻略 --%>
					<c:forEach items="${listRcZcgl}" var="d">
					<li class="j-item vus-clearfix vus-pt-15 vus-pb-15">
						<div class="vus-w-px-120 vus-h-px-90 vus-hidden vus-fl vus-bg--gray-smoke">
							<a href="${d.url}" class="mg-bg-cover hover vus-anim-all" style="background-image:url(${d.img});"></a>
						</div>
						<div class="mg-calc-2 vus-fr vus-pl-15">
							<h5 class="vus-h5 vus-fs-18 vus-text-ellipsis">
								<a href="${d.url}">${d.title}</a>
							</h5>
							<div class="vus-color--gray vus-text-ellipsis line-3 summary">
								${d.summary}
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
				<div class="ad-1 vus-fr vus-hidden vus-pt-10 vus-pb-10">
					<div class="swiper-container swiper-container-job-2 vus-h-100">
						<ul class="swiper-wrapper">
							<c:forEach items="${listRcZcgl}" var="d">
							<li class="swiper-slide">
								<a href="${d.url}" class="mg-bg-cover" style="background-image: url(${d.img})"></a>
							</li>
							</c:forEach>
						</ul>
						<div class="swiper-pagination swiper-pagination-job-2"></div>
					</div>
				</div>
				<script>
				var updateSwiperJob2 = new Swiper('.swiper-container-job-2', {
					pagination: '.swiper-pagination-job-2',
					paginationClickable: true,
					loop: true,
					autoplay: 5000,
					observer: true,
					observeParents: true,
				});
				</script>
			</div>
			<div id="job3" class="vus-clearfix" style="display: none;">
				<ul class="vus-fl mg-calc-3 vus-pr-30">
					<%cms.put("listRcHzsxy", true, 1, 4, true, true, true, 26);%><%-- 会展商学院 --%>
					<c:forEach items="${listRcHzsxy}" var="d">
					<li class="j-item vus-clearfix vus-pt-15 vus-pb-15">
						<div class="vus-w-px-120 vus-h-px-90 vus-hidden vus-fl vus-bg--gray-smoke">
							<a href="${d.url}" class="mg-bg-cover hover vus-anim-all" style="background-image:url(${d.img});"></a>
						</div>
						<div class="mg-calc-2 vus-fr vus-pl-15">
							<h5 class="vus-h5 vus-fs-18 vus-text-ellipsis">
								<a href="${d.url}">${d.title}</a>
							</h5>
							<div class="vus-color--gray vus-text-ellipsis line-3 summary">
								${d.summary}
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
				<div class="ad-1 vus-fr vus-hidden vus-pt-10 vus-pb-10">
					<div class="swiper-container swiper-container-job-3 vus-h-100">
						<ul class="swiper-wrapper">
							<c:forEach items="${listRcZcgl}" var="d">
							<li class="swiper-slide">
								<a href="${d.url}" class="mg-bg-cover" style="background-image: url(${d.img})"></a>
							</li>
							</c:forEach>
						</ul>
						<div class="swiper-pagination swiper-pagination-job-3"></div>
					</div>
				</div>
				<script>
				var updateSwiperJob3 = new Swiper('.swiper-container-job-3', {
					pagination: '.swiper-pagination-job-3',
					paginationClickable: true,
					loop: true,
					autoplay: 5000,
					observer: true,
					observeParents: true,
				});
				</script>
			</div>
		</div>
	</div>
</div>






<div class="mg-link vus-pt-20 vus-pb-20">
	<div class="link-tit vus-text-center vus-relative">
		<div class="vus-pl-15 vus-pr-15 vus-inline-block">
			<img src="${ctx}/f/res/image/link.png" class="vus-inline-block vus-align-middle vus-w-px-22">
			<span class="vus-inline-block vus-align-middle vus-fs-20 vus-pl-5">友情链接</span>
		</div>
	</div>
	<div class="vus-hidden vus-relative vus-clearfix vus-pt-20 vus-pb-20">
		<div class="vus-fl link-arrow vus-cursor-pointer swiper-button-prev-link"></div>
		<div class="vus-fl mg-calc-4">
			<div class="swiper-container swiper-container-link">
				<ul class="swiper-wrapper">
					<%cms.put("listLink", true, 1, 100, true, true, true, 6);%>
					<c:forEach items="${listLink}" var="d">
					<li class="swiper-slide vus-bg--white vus-hidden">
						<a href="${d.url}" class="mg-bg-cover hover vus-anim-all" style="background-image: url(${d.img})"></a>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="vus-fr link-arrow right-arrow vus-cursor-pointer swiper-button-next-link"></div>
	</div>
</div>
<script>
new Swiper('.swiper-container-link', {
	slidesPerView: 6,
	spaceBetween: 15,
	nextButton: '.swiper-button-next-link',
	prevButton: '.swiper-button-prev-link',
});
</script>


<%@include file="include/v-tip.jsp"%>


</div>
<%@include file="include/footer.jsp"%>
</body>
</html>
