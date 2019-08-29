<%@page language="java" pageEncoding="UTF-8"%>
<%--
<c:if test="${category.id != 10}">
<c:if test="${category.parent == category}">
	<c:set var="xpid" value="${category.id}" scope="request" />
	<c:set var="xname" value="${category.name}" scope="request" />
</c:if>
<c:if test="${category.parent != category}">
	<c:set var="xpid" value="${category.parent.id}" scope="request" />
	<c:set var="xname" value="${category.parent.name}" scope="request" />
</c:if>
<div class="title vus-text-center vus-color--white vus-fs-20">${xname}</div>
<ul class="vus-hidden vus-text-center">
	<%cms.putCategory("list", true, request.getAttribute("xpid"));%>
	<c:forEach items="${list}"  var="d">
		<li class="item vus-bg--gray-white vus-fs-16 vus-mt-1">
			<a href="${d.url}" class="${d.id==category.id?'active':''} vus-pt-12 vus-pb-12 vus-pl-20 vus-pr-20 vus-relative vus-anim-all">${d.name}</a>
		</li>
	</c:forEach>
</ul>
</c:if>
--%>

<c:if test="${category.id != 10}">
<c:if test="${category.parent == category}">
	<c:set var="xpid" value="${category.id}" scope="request" />
	<c:set var="xname" value="${category.name}" scope="request" />
</c:if>
<c:if test="${category.parent != category}">
	<c:set var="xpid" value="${category.parent.id}" scope="request" />
	<c:set var="xname" value="${category.parent.name}" scope="request" />
</c:if>
<c:if test="${category.parent.parent != category.parent}">
	<c:set var="xpid" value="${category.parent.parent.id}" scope="request" />
	<c:set var="xname" value="${category.parent.parent.name}" scope="request" />
</c:if>
<div class="title vus-text-center vus-color--white vus-fs-20">${xname}</div>
<ul class="vus-hidden vus-text-center">
	<%cms.putCategory("list", true, request.getAttribute("xpid"));%>
	<c:forEach items="${list}"  var="d">
		<li class="item vus-bg--gray-white vus-fs-16 vus-mt-1">
			<c:if test="${d.list==null || fn:length(d.list)==0}">
				<a ${d.scope==2?' target="_blank"':''}<c:if test="${d.list==null || fn:length(d.list)==0}"> href="${d.url}"</c:if> class="${d.id==category.id?'active':''} vus-pt-12 vus-pb-12 vus-pl-20 vus-pr-20 vus-relative vus-anim-all">${d.name}</a>
			</c:if>
			<c:if test="${d.list!=null && fn:length(d.list)>0}">
				<a class="up vus-cursor-pointer vus-pt-12 vus-pb-12 vus-pl-20 vus-pr-20 vus-relative vus-anim-all js-menu-parent">${d.name}</a>
			</c:if>
			<ul class="vus-bg--gray-smoke vus-text-center js-menu-child">
				<c:forEach items="${d.list}" var="dd">
					<li class="vus-border-top-1 vus-border--light">
						<a ${dd.scope==2?' target="_blank"':''}<c:if test="${dd.list==null || fn:length(dd.list)==0}"> href="${dd.url}"</c:if> class="${dd.id==category.id?'active':''} vus-pt-12 vus-pb-12 vus-pl-20 vus-pr-20 vus-relative vus-anim-all">${dd.name}</a>
					</li>
				</c:forEach>
			</ul>
		</li>
	</c:forEach>
</ul>
</c:if>
<%----%>
