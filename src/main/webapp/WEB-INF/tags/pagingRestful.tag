<%@ tag language="java" body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pagingAttribute" rtexprvalue="true" required="true" type="java.lang.Object" %>
<%@ attribute name="target" required="false" type="java.lang.String" %>
<ul class="pagination">
	<c:if test="${pagingAttribute.nowPage < pagingAttribute.totalPage && pagingAttribute.hasPrevPage == true}">
		<li><a target="${target}" class="arrow" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.totalPage}">&nbsp;${pagingAttribute.totalPage}...&nbsp; </a></li>
	</c:if>
	<c:if test="${pagingAttribute.hasPrevPage}">
		<c:choose>
			<c:when test="${pagingAttribute.nowPage + pagingAttribute.navSize > pagingAttribute.totalPage}">
				<li><a target="${target}" class="arrow" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.totalPage}">&nbsp;◀&nbsp;</a></li>
			</c:when>
			<c:otherwise>
				<li><a target="${target}" class="arrow" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.nowPage + pagingAttribute.navSize}">&nbsp;◀&nbsp;</a></li>
			</c:otherwise>
		</c:choose>
	</c:if>
		<c:set var="pageNum" value="${pagingAttribute.startPage}"/>
		<c:forEach var="page" begin="${pagingAttribute.endPage}" end="${pagingAttribute.startPage}">
			<c:if test="${pageNum == pagingAttribute.nowPage}">
				<li><a target="${target}" style="font-style: italic; font-weight: bold;" class="emphasis" href="${pagingAttribute.pagingUrl}/page/${pageNum}">&nbsp;${pageNum}&nbsp;</a></li>
			</c:if>
			<c:if test="${pageNum != pagingAttribute.nowPage}">
				<li><a target="${target}" href="${pagingAttribute.pagingUrl}/page/${pageNum}">&nbsp;${pageNum}&nbsp;</a></li>
			</c:if>
			<c:set var="pageNum" value="${pageNum - 1}"/>
		</c:forEach>
	<c:if test="${pagingAttribute.hasNextPage}">
		<c:choose>
			<c:when test="${pagingAttribute.nowPage - pagingAttribute.navSize < 1}">
				<li><a target="${target}" class="arrow" href="${pagingAttribute.pagingUrl}/page/1">&nbsp;▶&nbsp;</a></li>
			</c:when>
			<c:otherwise>
				<li><a target="${target}" class="arrow" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.nowPage - pagingAttribute.navSize}">&nbsp;▶&nbsp;</a></li>
			</c:otherwise>
		</c:choose>
	</c:if>	
	<c:if test="${1 < pagingAttribute.nowPage && pagingAttribute.hasNextPage == true}">
		<li><a target="${target}" class="arrow" href="${pagingAttribute.pagingUrl}/page/1">&nbsp;...1&nbsp;</a></li>
	</c:if>
</ul>