<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous">
</script>
	<!-- CSS only -->
	<link rel="stylesheet" type="text/css" href="../resources/css/reviewlist.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width:100%; position:relative; left:calc(50% - 600px); height:600px; display:inline">
		
		<div style="float:left; width:500;">
			<table border="0">
				<tr>
					<td><img src="/upload/main/${goods.imagepath}" width="500"
						height="500" /></td>
				</tr>
			</table>
		</div>

		<div style="float:left; margin-left:30px; width:682;">
			<table border="0">
 
<%-- 				<tr>
					<td><c:set var="PICK" value="${fn:split(list.GOODS_PICK,',')}" />
						<c:forEach var="PICK1" items="${PICK}" varStatus="g">
							<c:if test="${g.count == 1 }">
								<span
									style="background-color: #ff80bf; line-height: 27px; border-radius: 10px;"><font
									color="#ffffff" size="2">&nbsp;${PICK1}&nbsp;</font></span>
							</c:if>
							<c:if test="${g.count == 2 }">
								<span
									style="background-color: #d456dc; line-height: 27px; border-radius: 10px;"><font
									color="#ffffff" size="2">&nbsp;${PICK1}&nbsp;</font></span>
							</c:if>
							<c:if test="${g.count == 3 }">
								<span
									style="background-color: #33b7ff; line-height: 27px; border-radius: 10px;"><font
									color="#ffffff" size="2">&nbsp;${PICK1}&nbsp;</font></span>
							</c:if>
						</c:forEach></td>
				</tr> --%>

				<tr>
					<td id="pname"><font size="5"
						style="box-sizing: border-box; position: relative;">${goods.pname}</font></td>
				</tr>

<%-- 				<tr>
					<td><font size="3">${ColorSize}color</font></td>
				</tr> --%>

				<tr>
					<td></td>
				</tr>

				<tr>
					<td id="sellPrice" 
						style="font-weight: 600px; font-Size: 24px; line-height: 42px;">
						판매가격 <fmt:formatNumber value="${goods.sellPrice}" pattern="#,###" />원
					</td>
				</tr>
				
				<tr>
					<td id="discountPrice" 
						style="font-weight: 600px; font-Size: 18px; line-height: 42px; color: red;">
						할인가격 <fmt:formatNumber value="${goods.discountPrice}" pattern="#,###" />원
					</td>
					<td>3만원 이상 구매시 할인가격 구매 가능</td>
				</tr>
			</table>

			<table>
				<tr>
					<td><hr style="border-top: 1px solid #bbb;" width=670px>
					<td>
				</tr>
			</table>

			<br>

			<table>
				<tr class="option_section">
					<td width="340px"><font size="3">배송비</font></td>
					<td><font size="3">선불 3,000원(50,000원 이상 무료배송)</font></td>
				</tr>
			</table>

			<table>
				<tr class="option_section">
					<td width="537px"><font size="3">배송종류</font></td>
					<td><font size="3">&nbsp;국내배송</font></td>
				</tr>
			</table>

			<br>
			<br>

			<div id="item_option">
				<table>
					<tr>
						<td><select name="option" id="option"
							class='org.zerock.domain.Goods'
							style="width: 600px; height: 30px;">
								<option value="">==(필수)옵션: 세부 사항 선택 ==</option>
								<c:forEach var="option_each" items="${goods.option_list_split}"
									varStatus="index">
									<option name="option" value="${option_each}">${option_each}</option>
								</c:forEach>
						</select></td>
					</tr>
				</table>
			</div>

			<form id="frm" name="frm" method="post">

				<div>
					<table style="border:1px;" id="dynamicTable">
						<thead>
						</thead>

						<tbody id="dynamicTbody">

						</tbody>
						
					</table>
				</div>

			</form>
			
			<div class="totals-item totals-item-total" style="float:left; margin-left:400px;">
	      		<label class="total_price">총상품금액</label>&nbsp;&nbsp;
	     		 <div class="total_price" style="float:right;">원</div>
	      		<div class="totals-value" id="cart-total" style="float:right;">0</div>
	   	    </div>
			<br><br>
			
			<table>
				<tr>
					<td><hr style="border-top: 1px solid #bbb;" width=670px>
					<td>
				</tr>
			</table>

			<button style="width: 124px; height: 58px;"
				class="btn btn-outline-danger" id="insertLike"
				onclick="fn_InsertLike()">
				<font size="5px">♥</font>
			</button>
			<button style="width: 270px; height: 58px;"
				class="btn btn-outline-danger" id="insertBasket"
				onclick="fn_InsertBasket()">장바구니</button>
			<button style="width: 270px; height: 58px;"
				class="btn btn-outline-danger" id="goodsOrder"
				onclick="fn_GoodsOrder()">구매하기</button>
			<br>

			<!-- <button id="update" onclick="fn_update()">수정하기</button> -->		
		</div>
		<div id="review" style="width:60%">
			<jsp:include page="../review/list.jsp"></jsp:include>
		</div>
	</div>



</body>
</html>