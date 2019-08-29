<%@page language="java" pageEncoding="UTF-8"%>
<div class="vus-pt-40 vus-pb-30 vus-clearfix">
	<div class="vus-page vus-text-center">
		<ul class="pages large bordered warning">
			<c:set var="viewpage" value="3" scope="request" />
			<li class="item${datapage.page==1?' disabled':''}">
				<a class="link" href="${datapage.prevurl}">上一页</a>
			</li>
			<li class="item${datapage.page==1?' active':''}">
				<a class="link" href="${datapage.firsturl}">1</a>
			</li>
			<c:if test="${datapage.last > 1}">
				<c:if test="${datapage.page - viewpage > 2}">
				<li class="item">
					<a class="link" href="${datauri}_${datapage.page - viewpage - 1}.html">...</a>
				</li>
				</c:if>
				<c:forEach var="i" begin="2" end="${datapage.last}">
					<c:if test="${i<datapage.last && i >= datapage.page-3 && i <= datapage.page+3}">
					<li class="item${datapage.page == i ? ' active' : ''} ">
						<a class="link" <c:if test="${datapage.page != i}"> href="${datauri}_${i}.html"</c:if>>${i}</a>
					</li>
					</c:if>
				</c:forEach>
				<c:if test="${datapage.page + viewpage + 1 < datapage.last}">
				<li class="item">
					<a class="link" href="${datauri}_${datapage.page + viewpage + 1}.html">...</a>
				</li>
				</c:if>
				<li class="item${datapage.page == datapage.last ? ' active' : ''}">
					<a class="link" <c:if test="${datapage.page != datapage.last}"> href="${datapage.lasturl}"</c:if>>${datapage.last}</a>
				</li>
			</c:if>
			<li class="item${datapage.page==datapage.last?' disabled':''}">
				<a class="link" href="${datapage.nexturl}">下一页</a>
			</li>
		</ul>
	</div>
</div>
