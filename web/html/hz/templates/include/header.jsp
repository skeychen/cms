<%@page language="java" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${ctx}/f/res/css/vusui-pc-2.0.1.min.css">
<link rel="stylesheet" href="${ctx}/f/res/css/style.css">
<script src="${ctx}/f/res/js/jquery-1.11.3.min.js"></script>
<script src="${ctx}/f/res/js/swiper/swiper.jquery.min.js"></script>
<script src="${ctx}/f/res/js/layer/layer.js"></script>
<script src="${ctx}/f/res/js/basic.js"></script>
<div class="mg-header vus-bg--white">
	<div class="vus-container vus-relative vus-h-100">
		<div class="logo vus-absolute vus-position-left">
			<a href="index.html" title="广州市会展业公共服务平台"><img src="${ctx}/f/res/image/logo.png" class="vus-img"></a>
		</div>
		<div class="mini vus-absolute vus-position-right vus-position-top">
			<script type="text/javascript" src="/hz-yhxx/portal/user/getuserinfo.jsp"></script>
			<%--
			<!-- 登录前 -->
			<!-- <div class="vus-inline-block">
				你好，请<a class="mg-color-1 vus-cursor-pointer js-login" data-url="login.html">登录</a><span class="vus-pl-10 vus-pr-10 vus-color--gray-silver">|</span><a class="vus-cursor-pointer">注册</a>
			</div> -->
			<!-- 登录后 -->
			<div class="vus-inline-block">
				欢迎你，张三，<a href="#" class="mg-color-1">个人中心</a><span class="vus-pl-10 vus-pr-10 vus-color--gray-silver">|</span><a href="#" class="vus-color--red">退出</a>
			</div>
			--%>
			<div class="vus-inline-block">
				<span class="vus-pl-10 vus-pr-10 vus-color--gray-silver">|</span><a href="${ctx}/a/43/index.html">关于我们</a>
				<span class="vus-pl-10 vus-pr-10 vus-color--gray-silver">|</span><a href="#">English</a>
			</div>
		</div>
		<div class="nav-wrap">
			<nav class="vus-nav-drawer mg">
				<ul class="vus-nav vus-text-center vus-fs-16">
					<li class="item active">
						<a href="${ctx}/index.html" class="link vus-fs-18 vus-fw-600">首页</a>
					</li>
					<li class="item multi">
						<a href="${ctx}/a/7/index.html" class="link arrow vus-fs-18 vus-fw-600">新闻资讯</a>
						<div class="vus-nav-dropdown">
							<ul class="vus-nav">
								<li class="item">
									<a href="${ctx}/a/7/index.html" class="link">广州会展头条</a>
								</li>
								<li class="item">
									<a href="${ctx}/a/8/index.html" class="link">会展综合新闻</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="item">
						<a href="${ctx}/a/10/index.html" class="link vus-fs-18 vus-fw-600">品牌展会</a>
					</li>
					<li class="item multi">
						<a href="${ctx}/a/11/index.html" class="link hold vus-fs-18 vus-fw-600">办展环境</a>
						<div class="vus-nav-dropdown">
							<ul class="vus-nav">
								<%cms.putCategory("bzhjCategoryList",true, 3);%>
								<c:forEach items="${bzhjCategoryList}" var="d"><c:if test="${d.id != 51}"><li class="item">
									<a href="${d.url}" class="link">${d.title}</a>
								</li></c:if></c:forEach>
							</ul>
						</div>
					</li>
					<li class="item multi">
						<a href="${ctx}/a/36/index.html" class="link hold vus-fs-18 vus-fw-600">会展服务</a>
						<div class="vus-nav-dropdown">
							<ul class="vus-nav">
								<%cms.putCategory("hzfwCategoryList",true, 4);%>
								<c:forEach items="${hzfwCategoryList}" var="d"><c:if test="${d.id != 50}"><li class="item">
									<a href="${d.url}" class="link">${d.title}</a>
								</li></c:if></c:forEach>
							</ul>
						</div>
					</li>
					<li class="item multi">
						<a href="${ctx}/a/24/index.html" class="link arrow vus-fs-18 vus-fw-600">会展人才</a>
						<div class="vus-nav-dropdown">
							<ul class="vus-nav">
								<%cms.putCategory("hzrcCategoryList",true, 5);%>
								<c:forEach items="${hzrcCategoryList}" var="d"><li class="item">
									<a href="${d.url}" class="link">${d.title}</a>
								</li></c:forEach>
							</ul>
						</div>
					</li>
				</ul>
			</nav>
			<div class="vus-fr search vus-relative vus-mt-9">
				<input id="vv" type="text" class="vus-input warning default vus-pr-40" placeholder="展会排期、会展指南……">
				<img onclick="var _x=document.getElementById('vv').value;if(_x!=''){location.href='${ctx}/a/529/index.html?v='+encodeURIComponent(encodeURIComponent(_x));}" src="${ctx}/f/res/image/search.png" class="btn vus-img vus-absolute vus-position-right vus-position-top vus-zindex-2 vus-cursor-pointer">
			</div>
		</div>
	</div>
</div>
