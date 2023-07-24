<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<
<style>
.gKYVxm {
	width: 1200px;
	border-radius: 12px;
	box-shadow: rgba(0, 0, 0, 0.08) 0px 2px 4px 0px, rgba(0, 0, 0, 0.16) 0px
		0px 1px 0px;
	background-color: rgb(255, 255, 255);
	margin-bottom: 20px;
	padding: 24px 24px 16px;
}

.kcHmyx {
	height: 28px;
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
}

.kSZYgn {
	display: inline-block;
	width: 50%;
	height: 28px;
	font-size: 20px;
	font-weight: bold;
	font-stretch: normal;
	font-style: normal;
	line-height: 1.4;
	letter-spacing: -0.5px;
	color: rgb(17, 17, 17);
}

.kThsCL {
	text-align: right;
	font-size: 16px;
	font-weight: normal;
	font-stretch: normal;
	font-style: normal;
	line-height: 1.5;
	letter-spacing: -0.5px;
	color: rgb(52, 106, 255);
	display: inline-flex;
	vertical-align: middle;
	position: relative;
	width: auto;
	-webkit-box-pack: end;
	justify-content: flex-end;
}

.gSIruC {
	height: 16px;
	line-height: 1;
	margin: auto;
	font-family: 나눔고딕, nanumgothic, 돋움, dotum, sans-serif;
}

.card {
	border-radius: 8px;
	border: 1px solid rgb(238, 238, 238);
	background-color: rgb(255, 255, 255);
	margin-top: 16px;
}

.tablerow {
	height: 100%;
	padding: 20px;
	vertical-align: top;
}

.gbTJl {
	width: 200px;
	height: 100%;
	text-align: center;
	border-left: 1px solid rgb(238, 238, 238);
}

.bCQoer {
	display: flex;
	flex-flow: column wrap;
	height: 100%;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: justify;
	justify-content: space-between;
	padding: 20px;
}

.fUUUKW {
	display: inline-flex;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	padding-left: 12px;
	padding-right: 12px;
	user-select: none;
	cursor: pointer;
	text-decoration: none;
	outline: none;
	appearance: none;
	height: 2.25rem;
	width: 100%;
	border-radius: 4px;
	color: rgb(52, 106, 255);
	background-color: rgb(255, 255, 255);
	border: 1px solid rgb(52, 106, 255);
	-webkit-tap-highlight-color: rgba(52, 106, 255, 0.1);
	font-size: 0.875rem;
}

.iiEWkt {
	min-height: 2.25rem;
	font-size: 0.875rem;
	width: 160px;
	margin: 5px 0px;
}

.gcWEbw {
	margin-top: 10px;
}

.bQVZKC {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    margin-bottom: 4px;
}

.krPkOP {
    -webkit-box-pack: start;
    justify-content: flex-start;
    -webkit-box-align: center;
    align-items: center;
    width: 100%;
    display: flex;
    line-height: 1.5;
}

.SWzAJ {
    position: relative;
    display: inline-flex;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    align-items: center;
    width: 4px;
    height: 1em;
    vertical-align: middle;
    margin-left: 6px;
    margin-right: 6px;
}
.dhoCVo {
    font-size: 1.25rem;
}
.sCrFk {
    font-size: 1rem;
    font-weight: normal;
    color: rgb(0, 140, 0);
}

</style>



<body class="animsition">
	<!-- Product -->
	<section class="bg0 p-t-23 p-b-140">
		<div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5">주문 내역</h3>
			</div>

			<div class="flex-w flex-sb-m p-b-52">
				<div class="sc-fimazj-0 gKYVxm">
					<div class="sc-abukv2-0 kcHmyx">
						<div class="sc-abukv2-1 kSZYgn">2023. 7. 19 주문</div>
						<div class="sc-abukv2-2 kThsCL">
							<span class="sc-abukv2-3 gSIruC">주문 상세보기</span>
							<svg width="16" height="16" focusable="false" viewBox="0 0 16 16"
								aria-hidden="true" role="presentation"
								style="fill: #346aff; vertical-align: middle; height: 100%">
							<path fill="#346aff" fill-rule="nonzero"
									d="M11.057 8L5.53 13.529c-.26.26-.26.682 0 .942.26.26.682.26.942 0l6-6c.26-.26.26-.682 0-.942l-6-6c-.26-.26-.682-.26-.942 0-.26.26-.26.682 0 .942L11.057 8z"></path></svg>
						</div>
					</div>
					<div class="card">
						<table>
							<colgroup>
								<col width="1000">
								<col width="">
							</colgroup>
							<tbody>
								<tr>
									<td class="tablerow">
										<div class="bQVZKC">
											<div class="krPkOP">
												<span font-weight="bold" color="#111111" style="font-size: 1.25rem" class="sc-755zt3-0 hullgd">배송완료</span>
												<span size="4" class="sc-13xhsmd-0 SWzAJ">
													<span size="4" class="sc-13xhsmd-1 kMeFyN"></span>
												</span>
												<span font-weight="normal" color="#008C00" class="sc-755zt3-0 sc-lcvccu-0 sCrFk dhoCVo">7/20(목) 도착</span>
											</div>
											<div class="sc-ki5ja7-2 grCKyH">
												<button size="28" class="sc-izcbvi-0 bScTTg">
													<div class="sc-izcbvi-1 JHhgQ"></div>
													<div class="sc-izcbvi-1 JHhgQ"></div>
													<div class="sc-izcbvi-1 JHhgQ"></div>
												</button>
											</div>
										</div>
										<div class="sc-fe2r96-0 hmCrGF"></div>
										<div class="sc-1jiyjbz-0 dGiGeF">
											<div class="sc-gnmni8-9 kCcQTc">
												<div class="sc-g8964r-0 oRzGt"></div>
												<div class="sc-9cwg9-1 gLgexz">
													<div class="sc-9cwg9-2 cNiGzR">
														<div class="sc-9cwg9-3 eEDOvs">
															<a class="sc-1uwk3m0-0 kdlGbA sc-9cwg9-0 gujsmv"
																href="/ssr/sdp/link?vendorItemId=84602760559&amp;imagePath=https%3A%2F%2Fthumbnail7.coupangcdn.com%2Fthumbnails%2Fremote%2F96x96ex%2Fimage%2Fvendor_inventory%2F08df%2F38171b8a9b6f5257801ffa3fb8c5ffe757acfaad47627205edf0f48d78cd.jpg&amp;sourceType=MyCoupang_my_orders_list_product_image"
																target="_blank"><img loading="lazy" width="64"
																height="64"
																src="https://thumbnail7.coupangcdn.com/thumbnails/remote/96x96ex/image/vendor_inventory/08df/38171b8a9b6f5257801ffa3fb8c5ffe757acfaad47627205edf0f48d78cd.jpg"
																alt="오하이 전면 3D 풀커버 TPU 지문방지 + 무광택 필름 + 부착 가이드툴, 갤럭시S23, 3매입"></a>
														</div>
														<div class="sc-9cwg9-5 bmwSdh">
															<div class="sc-9cwg9-6 jBCCpd">
																<a class="sc-gnmni8-10 yma-DD"></a><a
																	href="/ssr/sdp/link?vendorItemId=84602760559&amp;imagePath=https%3A%2F%2Fthumbnail7.coupangcdn.com%2Fthumbnails%2Fremote%2F96x96ex%2Fimage%2Fvendor_inventory%2F08df%2F38171b8a9b6f5257801ffa3fb8c5ffe757acfaad47627205edf0f48d78cd.jpg&amp;sourceType=MyCoupang_my_orders_list_product_title"
																	target="_blank"
																	class="sc-gnmni8-10 sc-8q24ha-0 yma-DD hPjYZj"><img
																	class="sc-hwnw7b-0 lcdxpx" loading="lazy" height="16"
																	src="https://image10.coupangcdn.com/image/coupang/rds/logo/iphone_3x/logoRocketMerchantLargeV3R3@3x.png"
																	alt="ROCKET_MERCHANT_V2_DEPRECATED"><span
																	color="#111111"
																	class="sc-755zt3-1 sc-8q24ha-1 inmgHC ifMZxv">오하이
																		전면 3D 풀커버 TPU 지문방지 + 무광택 필름 + 부착 가이드툴, 갤럭시S23, 3매입</span></a>
																		<a class="sc-gnmni8-10 yma-DD"></a>
																		<a class="sc-gnmni8-10 sc-8q24ha-5 yma-DD iDQVMP">
																	<div class="sc-8q24ha-3 gFbjJh">
																		<div class="sc-uaa4l4-0 jxRaeI">
																			<span font-weight="normal" class="sc-755zt3-0 kftgZM">15,900
																				원</span><span class="sc-13xhsmd-0 kYtEGM"><span
																				class="sc-13xhsmd-1 joIhoV"></span></span><span
																				class="sc-755zt3-0 jtWNEg">1 개</span>
																		</div>
																	</div>
																	<div class="sc-8q24ha-4 cUFnye">
																		<button class="sc-1k9quwu-0 iCTfhh sc-xuyxga-0 bZaQeF">장바구니
																			담기</button>
																		<div class="sc-xuyxga-1 hxalxw"></div>
																	</div></a>
																<div class="sc-fxyxvg-0 igPkOG"></div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div></td>
									<td class="sc-gnmni8-6 gbTJl"><div
											class="sc-gnmni8-7 bCQoer">
											<button class="sc-1k9quwu-0 fUUUKW sc-4d0nwb-0 iiEWkt">배송조회</button>
											<button class="sc-1k9quwu-0 fTrGbC sc-gnmni8-8 kiiuoA">리뷰
												작성하기</button>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="sc-h20x0n-0 gcWEbw"></div>
				</div>

				<!-- Load more -->
				<div class="flex-c-m flex-w w-full p-t-45">
					<a href="#"
						class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
						Load More </a>
				</div>
			</div>
	</section>

	<div class="container"></div>
	</div>
</body>
