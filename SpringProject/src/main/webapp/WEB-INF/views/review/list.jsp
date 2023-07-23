<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="/resources/css/reviewlist.css">

    
    
    
	<div align="center">
		<ul class="nav nav-tabs" id="myTab" role="tablist" style="width: 60%">
			<li class="nav-item" role="presentation" style="width: 25%" ><a
				 id="home-tab"  href="#home3"
				role="tab" aria-controls="home3" aria-selected="false" onClick="fnMove(1)">상세정보</a>
			</li>
			<li class="nav-item" role="presentation" style="width: 25%" id="f4"><a
				class="nav-link active" id="contact-tab" data-toggle="tab"
				href="#re3" role="tab" aria-controls="re3" aria-selected="true" onClick="fnMove(4)">상품평</a>
			</li>
		</ul>
		<!-- 상품평 -->
		<div class="review">
			<nav><h1>상품리뷰</h1></nav>
			<p class="desc">상품의 사용후기를 적어주세요.</p>
			<ul>
				<c:forEach var="item" items="${reviewList}">							
					<li>
		            	<div>
		                	<h5 class="rating star4">상품명</h5>
		                    <span>${item.memId} ${item.regiDateStr}</span>
		                </div>
						<h3></h3>
		                ${item.content}
		            </li>
	          </c:forEach>
			</ul>
		</div> 	
		
		<div id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		<div style="margin-left: 1050px">
			<button type="button" class="btn btn-secondary btn-sm"
				onclick="fn_Review('/review/form.do',${gno})">WRITE</button>
		</div>
			
	
	</div>

			
	
	
	
		
	<script>	
		 function fn_Review(url,data){
			var form = document.createElement("form");
			form.setAttribute("method", "get");
			form.setAttribute("action", url);
		    var parentNOInput = document.createElement("input");
		    parentNOInput.setAttribute("type","hidden");
		    parentNOInput.setAttribute("value",data);
		    parentNOInput.setAttribute("name","gno");

		    form.appendChild(parentNOInput);
		 	document.body.appendChild(form);
		    
		 	console.log(form);
		 	
			form.submit();
		 }
	</script>
	
    