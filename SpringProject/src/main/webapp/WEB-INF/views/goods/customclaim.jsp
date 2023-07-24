<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="/resources/css/claim.css">
<div class="claims">
	<c:choose>
		<c:when test="${claimlist == null}">
			<span>등록된 글이 없습니다.</span>
		</c:when>
		<c:when test="${claimlist != null }">
			<c:forEach var="item" items="${claimlist }" varStatus="articleNum">
				<c:if test="${item.level == 1 && item.goods_no == cgno}">
					<div class="claim">
						<em class="claim__label">클레임</em>
						<div class="claim__wrap">
							<strong class="claim__author"></strong>
							<div class="claim__selected-option">상품명+종류</div>
						</div>
						<div class="claim__content">
							${item.content }
						</div>
						<div class="claim__time">
							<fmt:formatDate pattern="yy/MM/dd HH:mm" value="${item.regidate}"/>
						</div>
					</div>
				</c:if>
				<c:if test="${item.level == 2 && item.goods_no == cgno }">
					<div class="claim__reply">
						<em class="claim__reply__label">처리중</em>
						<div class="claim__reply__wrap">
							<strong class="claim__reply__author">회사명</strong>
							<div class="claim__reply__selected-option"></div>
						</div>
						<div class="claim__reply__content">
							${item.content }
						</div>
						<div class="claim__reply__time">
							<fmt:formatDate pattern="yy/MM/dd HH:mm" value="${item.regidate}"/>
						</div>
					</div>
				</c:if>
			</c:forEach>	
		</c:when>
	</c:choose>
</div>

<!-- pagination -->
<div class="w3-center">
	<c:if test="${tot4 != null }">
		<ul class="w3-pagination">
			<c:choose>
				<c:when test="${tot4 > 100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<c:if test="${section > 1 && page==1 }">
							<li><a href="#">&laquo;</a></li>
						</c:if>
						<li><a href="#">${(section-1)*10 +page }</a></li>
						<c:if test="${page == 10 }">
							<li><a href="#">&raquo;</a></li>
						</c:if>
					</c:forEach>
					
				</c:when>
				<c:when test="${tot4==100 }">
					<c:forEach var="page" begin="1" end="10" step="1">
						<li><a href="#">${page }</a></li>
					</c:forEach>
				</c:when>
				
				<c:when test="${tot4<100 && tot4>10 }">
					<c:forEach var="page" begin="1" end="${tot/10 + 1 }" step="1">
						<c:choose>
							<c:when test="${page==pageNum }">
								<li><a class="w3-green" href="#">${page }</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#">${page }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
				<c:when test="${tot4<=10 }">
				</c:when>
			</c:choose>
		</ul>
	</c:if>
</div>