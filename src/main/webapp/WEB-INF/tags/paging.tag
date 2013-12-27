<%@ tag language="java" body-content="empty" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="pagingAttribute" rtexprvalue="true" required="true" type="java.lang.Object"%>
<%@ attribute name="target" required="false" type="java.lang.String"%>
<%@ taglib prefix="el" uri="/WEB-INF/tags/tagLibrary.tld"%>
<c:set value="<%=request%>" var="request" />

<%--
클라이언트ip <%=request.getRemoteAddr()%><br>
요청URI <%=request.getRequestURI()%><br>
컨텍스트경로 <%=request.getContextPath()%><br>
서버이름 <%=request.getServerName()%><br>
서버포트 <%=request.getServerPort()%><br>
<br>
requested URL: <%=request.getRequestURL()%><br>
requested Info: <%=request.getRequestURI()%><br>
Info: <%=request.getParameterNames().toString()%><br>
Info: <%=request.getParameterNames()%><br>

${el:makeParameter(<c:set value="<%=request%>" />)}

<%
	Enumeration<?> enumParam = request.getParameterNames();
	String name = "&";
	while (enumParam.hasMoreElements())
	{
		name = (String) enumParam.nextElement();
		out.print(name + "=" + request.getParameter(name) + "?");
	}
%>

${el:makeParameter(request)}
 --%>



<div class="pagination">
<ul>
	<li class="disabled">
	<c:choose>
		<c:when test="${pagingAttribute.hasPreviousBlock}">
			<a class="arrow prev" href="${el:makePageParameter(request)}${pagingAttribute.blockStartPage - 1}"><span>◀</span></a>
		</c:when>
		<c:otherwise>
			<span style="color: gray;">◀</span>
		</c:otherwise>
	</c:choose>
	</li>
		<c:forEach var="page" begin="${pagingAttribute.blockStartPage}" end="${pagingAttribute.blockEndPage}">
			<c:if test="${page == pagingAttribute.nowPage}">
			<li class="active">
				<a style="font-weight: bold;" href="${el:makePageParameter(request)}${page}">${page}</a>
				</li>
			</c:if>
			<c:if test="${page != pagingAttribute.nowPage}">
			<li class="disabled">
				<a href="${el:makePageParameter(request)}${page}">${page}</a>
				</li>
			</c:if>
		</c:forEach>
	<li class="disabled">
	<c:choose>
		<c:when test="${pagingAttribute.hasNextBlock}">
			<a class="arrow next" href="${el:makePageParameter(request)}${pagingAttribute.blockEndPage + 1}"><span>▶</span></a>
		</c:when>
		<c:otherwise>
			<span style="color: gray;">▶</span>
		</c:otherwise>
	</c:choose>
	</li>
</ul>
</div>
