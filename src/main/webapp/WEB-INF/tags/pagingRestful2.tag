<%@ tag language="java" body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pagingAttribute" rtexprvalue="true" required="true" type="java.lang.Object" %>
<%@ attribute name="target" required="false" type="java.lang.String" %>
<div class="paging">
	<c:if test="${pagingAttribute.hasPrevPage}">
		<c:choose>
			<c:when test="${pagingAttribute.nowPage + pagingAttribute.navSize > pagingAttribute.totalPage}">
				<a target="${target}" class="arrow prev" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.totalPage}"><span>◀</span></a>
			</c:when>
			<c:otherwise>
				<a target="${target}" class="arrow prev" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.nowPage + pagingAttribute.navSize}"><span>◀</span></a>
			</c:otherwise>
		</c:choose>
	</c:if>
	<span class="pageNum">
	<c:set var="pageNum" value="${pagingAttribute.startPage}"/>
	<c:forEach var="page" begin="${pagingAttribute.endPage}" end="${pagingAttribute.startPage}">
		<c:if test="${pageNum == pagingAttribute.nowPage}">
			<a class="emphasis" target="${target}" href="${pagingAttribute.pagingUrl}/page/${pageNum}">${pageNum}</a>
		</c:if>
		<c:if test="${pageNum != pagingAttribute.nowPage}">
			<a target="${target}" href="${pagingAttribute.pagingUrl}/page/${pageNum}">${pageNum}</a>
		</c:if>
		<c:set var="pageNum" value="${pageNum - 1}"/>
	</c:forEach>
	</span>
	<c:if test="${pagingAttribute.hasNextPage}">
		<c:choose>
			<c:when test="${pagingAttribute.nowPage - pagingAttribute.navSize < 1}">
				<a target="${target}" class="arrow next" href="${pagingAttribute.pagingUrl}/page/1"><span>▶</span></a>
			</c:when>
			<c:otherwise>
				<a target="${target}" class="arrow next" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.nowPage - pagingAttribute.navSize}"><span>▶</span></a>
			</c:otherwise>
		</c:choose>
	</c:if>	
</div>




<%-- 
<div id="pagingNav">
	<c:if test="${pagingAttribute.nowPage < pagingAttribute.totalPage && pagingAttribute.hasPrevPage == true}">
		<a target="${target}" class="arrow" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.totalPage}">&nbsp;${pagingAttribute.totalPage}...&nbsp; </a>
	</c:if>
	<c:if test="${pagingAttribute.hasPrevPage}">
		<c:choose>
			<c:when test="${pagingAttribute.nowPage + pagingAttribute.navSize > pagingAttribute.totalPage}">
				<a target="${target}" class="btn_arrow prev_on" id="prevPage" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.totalPage}"><span><span>&lt;</span></span></a>
			</c:when>
			<c:otherwise>
				<a target="${target}" class="btn_arrow prev_on" id="prevPage" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.nowPage + pagingAttribute.navSize}"><span><span>&lt;</span></span></a>
			</c:otherwise>
		</c:choose>
	</c:if>
	<c:set var="pageNum" value="${pagingAttribute.startPage}"/>
	<c:forEach var="page" begin="${pagingAttribute.endPage}" end="${pagingAttribute.startPage}">
		<c:if test="${pageNum == pagingAttribute.nowPage}">
			<em class="em_color_bg"><span class="txt_hide">현재페이지&nbsp;</span><span>${pageNum}</span></em>
		</c:if>
		<c:if test="${pageNum != pagingAttribute.nowPage}">
			<a target="${target}" href="${pagingAttribute.pagingUrl}/page/${pageNum}"><span>${pageNum}</span></a>
		</c:if>
		<c:set var="pageNum" value="${pageNum - 1}"/>
	</c:forEach>
	<c:if test="${pagingAttribute.hasNextPage}">
		<c:choose>
			<c:when test="${pagingAttribute.nowPage - pagingAttribute.navSize < 1}">
				<a target="${target}" id="nextPage" class="btn_arrow next_on" href="${pagingAttribute.pagingUrl}/page/1"><span><span>&gt;</span></span></a>
			</c:when>
			<c:otherwise>
				<a target="${target}" id="nextPage" class="btn_arrow next_on" href="${pagingAttribute.pagingUrl}/page/${pagingAttribute.nowPage - pagingAttribute.navSize}"><span><span>&gt;</span></span></a>
			</c:otherwise>
		</c:choose>
	</c:if>	
	<c:if test="${1 < pagingAttribute.nowPage && pagingAttribute.hasNextPage == true}">
		<a target="${target}" class="arrow" href="${pagingAttribute.pagingUrl}/page/1">&nbsp;...1&nbsp;</a>
	</c:if>
</div>
	 --%>



