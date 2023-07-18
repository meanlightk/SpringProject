<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Cart와 중복된 부분이 있음 -->
<body class="animsition">


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04"> Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> Shoping Cart </span>
		</div>
	</div>


	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2"></th>
									<th class="column-3">Price</th>
									<th class="column-4">Quantity</th>
									<th class="column-5">Total</th>
								</tr>

								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="../resources/images/item-cart-04.jpg" alt="IMG">
										</div>
									</td>
									<td class="column-2">Fresh Strawberries</td>
									<td class="column-3">$ 36.00</td>
									<td class="column-4">
										<div class="wrap-num-product flex-w m-l-auto m-r-0">
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product"
												type="number" name="num-product1" value="1">

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>
									</td>
									<td class="column-5">$ 36.00</td>
								</tr>

								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="../resources/images/item-cart-05.jpg" alt="IMG">
										</div>
									</td>
									<td class="column-2">Lightweight Jacket</td>
									<td class="column-3">$ 16.00</td>
									<td class="column-4">
										<div class="wrap-num-product flex-w m-l-auto m-r-0">
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product"
												type="number" name="num-product2" value="1">

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>
									</td>
									<td class="column-5">$ 16.00</td>
								</tr>
							</table>
						</div>

						<div
							class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<input
									class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
									type="text" name="coupon" placeholder="Coupon Code">

								<div
									class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
									Apply coupon</div>
							</div>

							<div
								class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
								Update Cart</div>
						</div>
					</div>
				</div>

				<!--===================== 결제창 시작 ================== -->

				<!-- 결제창 시작 -->

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div
						class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">주문 & 결제</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2"> 상품 금액: </span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2"> 50,000원 </span> <br> <br>
								<span>+ 배송비: 3,500원</span>
							</div>
						</div>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2"> 배송 정보: </span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<p class="stext-111 cl6 p-t-2">
									<span>성명</span> <input type="text"
										style="border: 1px solid #e6e6e6" id="sample3_address"
										placeholder="성명을 입력해주세요"><br> <span>전화번호</span>
								<form name="userPhoneNumber">
									<input type='tel' style="border: 1px solid #e6e6e6"
										maxlength="13" id="sample3_address" placeholder="전화번호를 입력해주세요" />
								</form>
								<br>
								<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
									<p class="stext-111 cl6 p-t-2">
										<span>배송 메세지</span> <br> <select id="delivery-message">
											<option value="1">직접 받을게요</option>
											<option value="2">부재 시 문 앞에 놔주세요</option>
											<option value="3">배송 전 미리 연락 주세요</option>
											<option value="4">배송 후 연락 남겨주세요</option>
											<option value="5">경비실에 맡겨주세요</option>
										</select>
									</p>
									<br>

									<div class="address" st>
										<!-- 주소 입력 창 -->
										<input type="text" style="border: 1px solid #e6e6e6"
											id="sample3_postcode" placeholder="우편번호"> <input
											type="button" style="border: 1px solid #e6e6e6"
											onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" style="border: 1px solid #e6e6e6"
											id="sample3_address" placeholder="주소"><br> <input
											type="text" style="border: 1px solid #e6e6e6"
											id="sample3_detailAddress" placeholder="상세주소"> <input
											type="text" style="border: 1px solid #e6e6e6"
											id="sample3_extraAddress" placeholder="참고항목">

										<div id="wrap"
											style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
											<img
												src="//t1.daumcdn.net/postcode/resource/images/close.png"
												id="btnFoldWrap"
												style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
												onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>

										<script
											src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
											// 우편번호 찾기 찾기 화면을 넣을 element
											var element_wrap = document
													.getElementById('wrap');

											function foldDaumPostcode() {
												// iframe을 넣은 element를 안보이게 한다.
												element_wrap.style.display = 'none';
											}

											function sample3_execDaumPostcode() {
												// 현재 scroll 위치를 저장해놓는다.
												var currentScroll = Math
														.max(
																document.body.scrollTop,
																document.documentElement.scrollTop);
												new daum.Postcode(
														{
															oncomplete : function(
																	data) {
																// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

																// 각 주소의 노출 규칙에 따라 주소를 조합한다.
																// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																var addr = ''; // 주소 변수
																var extraAddr = ''; // 참고항목 변수

																//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
																if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																	addr = data.roadAddress;
																} else { // 사용자가 지번 주소를 선택했을 경우(J)
																	addr = data.jibunAddress;
																}

																// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
																if (data.userSelectedType === 'R') {
																	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																	// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																	if (data.bname !== ''
																			&& /[동|로|가]$/g
																					.test(data.bname)) {
																		extraAddr += data.bname;
																	}
																	// 건물명이 있고, 공동주택일 경우 추가한다.
																	if (data.buildingName !== ''
																			&& data.apartment === 'Y') {
																		extraAddr += (extraAddr !== '' ? ', '
																				+ data.buildingName
																				: data.buildingName);
																	}
																	// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																	if (extraAddr !== '') {
																		extraAddr = ' ('
																				+ extraAddr
																				+ ')';
																	}
																	// 조합된 참고항목을 해당 필드에 넣는다.
																	document
																			.getElementById("sample3_extraAddress").value = extraAddr;

																} else {
																	document
																			.getElementById("sample3_extraAddress").value = '';
																}

																// 우편번호와 주소 정보를 해당 필드에 넣는다.
																document
																		.getElementById('sample3_postcode').value = data.zonecode;
																document
																		.getElementById("sample3_address").value = addr;
																// 커서를 상세주소 필드로 이동한다.
																document
																		.getElementById(
																				"sample3_detailAddress")
																		.focus();

																// iframe을 넣은 element를 안보이게 한다.
																// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
																element_wrap.style.display = 'none';

																// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
																document.body.scrollTop = currentScroll;
															},
															// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
															onresize : function(
																	size) {
																element_wrap.style.height = size.height
																		+ 'px';
															},
															width : '100%',
															height : '100%'
														}).embed(element_wrap);

												// iframe을 넣은 element를 보이게 한다.
												element_wrap.style.display = 'block';
											}
										</script>
										<br>
										<div>
											<div class="single-payment">
												<div class="input-group">
													<input type="radio" id="radio4" name="payment"> <label
														for="radio4">무통장 입금</label>
												</div>
												<br>
											</div>
											<div class="single-payment">
												<div class="input-group">
													<input type="radio" id="radio4" name="payment"> <label
														for="radio4">계좌이체</label>
												</div>
											</div>
											<br>
											<div class="single-payment">
												<div class="input-group">
													<input type="radio" id="radio6" name="payment" checked>
													<label for="radio6">카드결제</label>
												</div>
											</div>
										</div>
										<br>
									</div>
									<br>
								</div>
							</div>
						</div>
					</div>

					<div class="flex-w flex-t p-t-27 p-b-33">
						<div class="size-208">
							<span class="mtext-101 cl2"> 총 금액: </span>
						</div>

						<div class="size-209 p-t-1">
							<span class="mtext-110 cl2"> 53,500원 </span>
						</div>
					</div>

					<button
						class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
						결제하기</button>
				</div>
			</div>
		</div>
	</form>

	<!-- 결제창 끝 -->