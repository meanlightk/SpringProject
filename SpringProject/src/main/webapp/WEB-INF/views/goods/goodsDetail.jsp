<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"
/>
<link rel="stylesheet" type="text/css" href="../resources/css/reviewlist.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk">

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- CSS only -->
<style>
.swiper-wrapper{
	display: -webkit-inline-box;
}
input, select, textarea, body, code{
	font-family: 'Roboto', 'Noto Sans KR', 'sans-serif';
}
body{
	position: absolute;
	display: block;
	min-width: 100%;
}
body, code{
	fort: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
	color: #353535;
	background: #fff;
}
html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legent, input, textarea, p, blockquote, th, td, img{
	margin: 0;
	padding: 0;
}
.layer {
	display: none;
}

/* css초기화 끝 */
.option_section {
	float: left;
	color: #777;
	font-weight: 400;
}

/* 상품문의 */
.board_list th {
	padding: 14px 0;
	background: url(/css/images/ico_board_th_bar.gif) no-repeat 0 center
		#f5f5f5;
	font-size: 14px;
	color: #666;
	font-weight: 400;
	text-align: center;
}

.board_list {
	width: 60%;
	margin-top: 0px;
	background: #fff;
	font-size: 15px;
	line-height: 18px;
}

.board_list2 {
	width: 60%;
	margin-top: 0px;
	background: #fff;
	font-size: 15px;
	line-height: 18px;
}

.board_list2 .tit {
	background: #fff;
	font-size: 15px;
}

.board_list2 .tit td {
	position: relative;
	padding: 20px 0;
	box-sizing: border-box;
	border-top: 1px solid #f2f2f2;
}

.td {
	position: relative;
	box-sizing: border-box;
	border-top: 1px solid #f2f2f2;
	margin-left: 100px;
}
.align_left {
	text-align: left !important;
}
.board_list2 td.align_left {
	padding: 16px 110px;
}

.board_list td {
	padding: 16px 0;
	text-align: center;
	border-bottom: 1px solid #e0e0e0;
	font-size: 14px;
	color: #444;
	vertical-align: top;
}

p.a {
	cursor: pointer;
}

/* 리뷰리스트 */
::selection {
	background: #888;
	/* color: #fff; */
	text-shadow: none;
}

.xans-product-additional div.board {
	margin: 0 auto;
	padding: 27px 0 40px;
	max-width: 1220px;
	color: #353535;
	line-height: 18px;
}

.ec-base-table.typeList table {
	border-top: 1px solid #e5e5e5;
}

.ec-base-table table {
	position: relative;
	margin: 10px 0 0;
	border: 1px solid #e5e5e5;
	border-top: 0;
	border-left: 0;
	border-right: 0;
	/* color: #fff; */
	line-height: 1.5;
}

.ec-base-table table:before {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	content: "";
	width: 100%;
	height: 1px;
	background: #e5e5e5;
}

.displaynone {
	display: none !important;
}

.ec-base-table thead th {
	padding: 12px 0;
	border-bottom: 1px solid #e5e5e5;
	color: #353535;
	vertical-align: middle;
	font-size: 12px;
	font-weight: 500;
	background: #f9f9f9;
}

.xans-product-additional div.board {
	margin: 0 auto;
	padding: 27px 0 40px;
	max-width: 1220px;
	color: #353535;
	line-height: 18px;
}

.ec-base-table th:first-child {
	border-left: 0;
}

th {
	text-align: center;
}

.td1 {
	text-align: center;
	color: #777;
	padding: 12px 0;
}

.td2 {
	color: #777;
	padding: 12px 0;
}

.desc {
	padding: 0 0 20px;
	color: #777;
	font-size: 12px;
	text-align: center;
}

.d {
	width: 100%;
	heiht: 100%;
}

body {
	/*  font-family: Verdana, Arial; */
	position: absolute;
	font-family: 0.75em Verdana, Dotum;
	color: #353535;
}

a {
	text-decoration: none;
	color: #666;
}

h1 {
	text-align: center;
	padding: 50px 0;
	font-weight: normal;
	font-size: 2em;
	letter-spacing: 10px;
}

.total_price {
    color: #666;
    font-size: 14px;
     padding: 20px 0 8px; 
    text-align: right;
    box-sizing: border-box;
}

.total_cartAdd {
    color: #666;
    font-size: 14px;

    box-sizing: border-box;
}

.totals-value {
    font-size: 30px;
    color: #333;
    font-style: normal;
    font-weight: bold;
    padding-left: 12px;
    text-align: right;
}


.selected_option {
    position: relative;
    margin-top: -1px;
    padding: 20px 22px;
    border: 1px solid #e9e9e9;
    color: #333;
    font-size: 14px;
    line-height: 20px;
    overflow: hidden;
}

.product .remove-product {
    border: 0;
    padding: 4px 8px;
    background-color: #c66;
    color: #fff;
    font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
    font-size: 12px;
    border-radius: 3px;
}

p {
	padding-top:5px;
}
#sale_bg{
	font-weight: 700;
	font-size: 14px;
	width: 87px;
	height: 24px;
	line-height: 25px;
	color: #fff;
	background: #f2a5c2;
	text-align: center;
	border-radius: 20px;
	padding: 0 0 10px;
}
.xans-product-additional {
	margin: 0 auto;
}
.pdt 80 {
	padding-top: 80px !important;
}
.cboth{
	clear: both;
}
.cboth:after{
	content: " ";
	display: block;
	clear: both;
}
.detail_tab{
	max-width: 1720px;
	margin: 0 auto 50px;
	border-bottom: 1px solid #ececec;
}
.title_detail{
	display: block;
	position: relative;
	bottom: -1px;
	max-width: 1480px;
	padding: 20px 0 0 0;
	margin: 0 auto;
	text-align: center;
	font-size: 0;
	background-color: #fff;
}
ul{
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}
.title_detail .tab_open{
	border-bottom: 2px solid #f3bbbd;
}
.title_detail li{
	display: inline-block;
	width: 25%;
	height: 60px;
	border-left: 0;
	box-sizing: border-box;
}
div{
	display: block;
}
li{
	display: inline-block;
	list-style: none;
	text-align: -webkit-match-parent;
}

.title_detail li a {
	text-decoration: none;
	display: block;
	height: 60px;
	color: #888;
	font-size: 17px;
	font-weight: 500;
	text-align: center;
	line-height: 60px;
}
#wrap{
	position: relative;
	width: 100%;
	min-width: 1280px;
	margin: 0 auto;
	min-height: 550px;
}
#container{
	padding: 0;
	position: relative;
	width: 100%;
	min-width: 1280px;
	zoom: 1;
	margin: 0 auto;
}
#container #contents{
	max-width: 1450px;
	margin: 0 auto;
	padding: 0 5%;
	float: none;
}
#contents{
	width: auto;
}
.xans-product-additional{
	margin: 0 auto;
}
.detail_tab {
	max-width: 1720px;
	margin: 0 auto 50px;
	border-bottom: 1px solid #ececec;
}
.title_detail {
	display: block;
	position: relative;
	bottom: -1px;
	max-width: 1720px;
	padding: 20px 0 0 0;
	margin: 0 auto;
	text-align: center;
	font-size: 0;
	background-color: #fff;
}
.cboth{
	clear: both;
	*zoom: 1;
}
.title_detail .tab_open{
	border-bottom: 2px solid #f3bbbd;
}
.title_detail li {
	display: inline-block;
	width: 25%;
	height: 60px;
	border-bottom: 1px solid #e9e9e9;
	border-left: 0;
	box-sizing: border-box;
}
li{
	list-style:none;
}
.title_detail li.tab_open a, .title_detail li a:hover {
    color: #f3bbbd;
} 

a{
	blr: expression(this.onFocus=this.blur());
	color: #000;
	text-decoration: none;
}
a:-webkit-any-link{
	color: webkit-link;
	cursor: pointer;
	text-decoration: underline;
}
.detail_tab li {
    display: inline-block;
}
#totalProducts{
	margin-top: 30px;
	margin: 21px 0 0;
}
#totalProducts table{
	margin: 0;
	border: 0;
	font-size: 12px;
}
caption{
	display: none;
	text-align: -webkit-center;
}
table{
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	text-indent: initial;
	font-size: 12px;
	margin: 10px 0 0;
}
colgroup{
	display: table-column-group;
}
.displaynone{
	display: none !important;
}
tbody{
	vertical-align: middle;
}
tr{
	display: table-row;
}
td{
	display: table-cell;
}
#totalProducts tbody tr:first-child td{
	border-top: 1px solid #9a9ba0;
}
#totalProducts tbody tr td:first-child{
	padding-left: 4px;
}
#totalProducts tbody td{
	padding: 9px 0;
	border-top: 1px solid #ebebeb;
	color: #353535;
	line-height: 18px;
	vertical-align: middle;
	word-wrap: break-word;
	word-break: break-all;
}
#totalProducts table .right, .totalPrice .total{
	color: #222 !important;
}
#totalProducts table .right{
	padding-right: 9px;
	font-weight: bold;
	text-align: right;
}
#totalProducts tbody td .quantity{
	display: inline-block;
	position: relative;
	width: 50px;
	vertical-align: top;
}
#totalProducts tbody.option_products tr td .quantity input, #totalProducts tbody.add_products tr td .quantity input{
	height: 21px;
	line-height: 21px;
}
#totalProducts tbody td .quantity input {
	width: 22px;
	height: 23px;
	padding: 0 2px 0 3px;
	line-height: 23px;
	border: 1px solid #d4d8d9;
	border-radius:3px 0 0 3px;
}
input{
	font-style: ;
	font-variant-ligatures: ;
	font-variant-caps: ;
	font-variant-numeric: ;
	font-variant-alternates: ;
	font-rendering: auto;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	appearance: auto;
	-webkit-rtl-ordering: logical;
	cursor: text;
}
input, textarea, label{
	display: inline-block;
	outline: none;
	border: none;
}
input[type=text]{
	hieght: 18px;
	line-height: 20px;
	padding: 2px 4px;
	border: 1px solid #d5d5d5;
	color: #353535;
	font-size: 12px;
}
input, select, textarea {
	vertical-align: middle;
}
input:not([type="range"]):not([type="color"]){
	writing-mode: horizontal-tb !important;
}
input:not([type="file" i], [type="image" i], [type="checkbox" i], [type="radio" i]){

}

#totalProducts tbody td p{
	padding: 0 10px 0 0;
	font-weight: bold;
	line-height: 21px;
}
#totalProducts tbody td p.product span{
	font-weight: normal;
	color: #757575;
	line-height: 18px;
}
p{
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}
td{
	border: 0;
}
#totalProducts tbody td img{
	vertical-align: middle;
}
#option_box1_up{
	vertical-align: middle;
}
img {
	overflow-clip-margin: content-box;
	overflow: clip;
	border: none;
	vertical-align: top;
}
/* #totalProducts tbody.option_products tr td .quantity .down, #totalProducts tbody.add_products tr td .quantity .down{
	bottom: 0;
	top: auto;
} */
#totalProducts tbody td .quantity .up{
	position: absolute;
	left: 22px;
	top:  -5px;
}
#totalProducts tbody td .quantity .down{
	position: absolute;
	left: 22px;
	top: 5px;
}
#totalProducts tbody td img {
	vertical-align: middle; 
}
.imgArea {
	display: inline-block;
	position: relative;
	width: 570px;
	margin: 0 auto;
	text-align: center;
	float: left;
}
.imgArea .listImg{
	width: 100%;
	margin: 6px auto 0;
}
 .imgArea .listImg{
	overflow: hidden;
	margin: 30px auto 0;
}
 .imgArea > div {
	display: block;
}
 .imgArea .listImg ul{
	min-width: 400px;
	height: 77px;
	margin: 0 0 0 2px;
	font-size: 0;
	line-height: 0;
}
 .imgArea .listImg li{
	float: left;
	margin: 0 10px 0 0;
	display: inline-block;
	margin: 0 1px;
	font-size: 12px;
	line-height: 14px;
	vertical-align: top;
}
 .imgArea .listImg li img{
	width: 100px;
	height: auto;
	border: 0px solid #d9d9d9;
	cursor: pointer;
}
 .imgArea .listImg .prev{
	left: 0;
	background-position: 0 0;
}
 .imgArea .listImg button{
	position: absolute;
	top: 0;
	width: 30px;
	height: 100px;
	font-size: 0;
	line-height: 0;
	color: transparent;
	outline: none;
	background-size: cover;
	background: url("") no-repeat;
}
button{
	appearance: auto;
	overflow: visible;
	padding: 0;
	margin: 0;
	border: 0;
	cursor: pointer;
	text-rendering: auto;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	text-align: center;
	align-items: flex-start;
	box-sizing: border-box;
}
.imgArea .listImg .next{
	background-position: -39px 0;
}
.imgArea .listImage .next{
	right: 0;
}
.detailArea:after{
	content: "";
	display: block;
	clear: both;
}
@media screen and (max-width: 1599px)
.xans-product-detail .imgArea {
	width: 615px;
}

.tab-content {
	display:none;
}

.current.current{
	display:block;
}


</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
<body style="overflow: visible;">
	<br>
	<br>
	<div style="width:100%; position:relative; left:calc(50% - 600px); height:600px; display:inline">

		<div class="detailArea">
			<div class="xans-element- xans-product xans-product-image imgArea">
				<div style="width:500;">
					<table border="0">
						<tr>
							<td><img src="/upload/main/${goods.imagepath}" width="500" height="500" /></td>
						</tr>
					</table>
					<div id="test-swiper" class="swiper-container xans-element- xans-product xans-product-addimage listImg cboth" style="position: relative; margin-top: 10px; height: 134px;">
						<ul class="swiper-wrapper">
							<li class="swiper-slide">
								<div style="float: left;">
									<img src="./../../../resources/img/product1.png" class="ThumbImage" alt>
									<img src="./../../../resources/img/product2.png" class="ThumbImage" alt>
									<img src="./../../../resources/img/product3.png" class="ThumbImage" alt>
									<img src="./../../../resources/img/product4.png" class="ThumbImage" alt>
									<img src="./../../../resources/img/product5.png" class="ThumbImage" alt>
								</div>							
							</li>
  						    <li class="swiper-slide">
								<div style="float: left;">
									<img src="./../../../resources/img/product6.png" class="ThumbImage" alt>
									<img src="./../../../resources/img/product7.png" class="ThumbImage" alt>
								</div>
						    </li>
						</ul>
						<!--  <div class="swiper-wrapper">
							<div class="swiper-slide" style="justify: center;">
								<div class="container" style="float: left; max-width: 200px;">
									<img src="/upload/main/${goods.imagepath}" style="width:100px;" class="ThumbImage" alt>
								</div>
								<div class="container" style="float: left; max-width: 200px;">
									<img src="/upload/main/${goods.imagepath}" style="width:100px;" class="ThumbImage" alt>
								</div>
								<div class="container" style="float: left; max-width: 200px;">
									<img src="/upload/main/${goods.imagepath}" style="width:100px;" class="ThumbImage" alt>
								</div>
								<div class="container" style="float: left; max-width: 200px;">
									<img src="/upload/main/${goods.imagepath}" style="width:100px;" class="ThumbImage" alt>
								</div>

							</div>
						</div>-->
<!--  						<ul style="position: absolute; left: 0px; top: 0px; width: 660px; display: inline-block; padding-inline-start: 0px;">
							<li class="xans-record-">
								<img src="/upload/main/${goods.imagepath}" style="width:100px;" class="ThumbImage" alt>
							</li>
							<li class="xans-record-">
								<img src="./../../../resources/img/product1.png" class="ThumbImage" alt>
							</li>
							<li class="xans-record-" >
								<img src="./../../../resources/img/product2.png" class="ThumbImage" alt>
							</li>
							<li class="xans-record-">
								<img src="./../../../resources/img/product3.png" class="ThumbImage" alt>
							</li>
							<li class="xans-record-">
								<img src="./../../../resources/img/product4.png" class="ThumbImage" alt>
							</li>
							<li class="xans-record-">
								<img src="./../../../resources/img/product5.png" class="ThumbImage" alt>
							</li>
							<li class="xans-record-">
								<img src="./../../../resources/img/product6.png" class="ThumbImage" alt>
							</li>
							<li class="xans-record-">
								<img src="./../../../resources/img/product7.png" class="ThumbImage" alt>
							</li>
						</ul>
						-->
						<button type="button" class="prev" style="display: none;">이전</button>
						<button type="button" class="next"></button>				
					</div>
				</div>
			</div>
				<div style="float:left; margin-left:30px; width:682;">
						<table border="0">
			 
							<tr>
								<td>
									<div id="sale_bg" style="display: block;">
										<span class="sale_text">23%</span>
										SALE
									</div>
								</td>
							</tr>
			
							<tr>
								<td id="pname"><font size="5"
									style="box-sizing: border-box; position: relative;"><h2>${goods.pname}</h2></font></td>
							</tr>
									
							<tr>
								<td><hr style="border-top: 1px solid #bbb;" width=670px>
								<td>
							</tr>
						
			
			<%-- 				<tr>
								<td><font size="3">${ColorSize}color</font></td>
							</tr> --%>
			
							<tr>
								<td></td>
							</tr>
			
							<tr style="display: inline-block; flex:left;">
								<td id="sellPrice" width="200px"
									style="font-weight: 600px; font-Size: 18px; line-height: 42px;">
									판매가격 
								</td>
								<td id="test">
									<fmt:formatNumber value="${goods.sellPrice}" pattern="#,###" />원
								</td>
			
							</tr>
							
							<tr>
								<td id="discountPrice" 
									style="font-weight: 600px; font-Size: 24px; line-height: 42px; color: red;">
									할인가격 <fmt:formatNumber value="${goods.discountPrice}" pattern="#,###" />원
								</td>
								<!-- <td>3만원 이상 구매시 할인가격 구매 가능</td> -->
							</tr>
						</table>
			
			<!-- 			<table>
							<tr>
								<td><hr style="border-top: 1px solid #bbb;" width=670px>
								<td>
							</tr>
						</table> -->
			
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
			 			<table>
							<tr>
								<td><hr style="border-top: 1px solid #bbb;" width=670px>
								<td>
							</tr>
						</table>
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
					<div id="totalProducts">
						<table border="1" summary>
							<caption>상품 목록</caption>
							<colgroup>
								<col style="width:284px;">
								<col style="width:80px;">
								<col style="width:110px;">
							</colgroup>
							<thead>
								<tr class="displaynone">
									<th scope="col">상품명</th>
									<th scope="col">상품수</th>
									<th scope="col">가격</th>
								</tr>
							</thead>
			
							<tbody class="option_products">
								<tr class="option_product" data-option-index="1" target-key="238">
									<td>
										<input type="hidden" class="option_box_id" id="option_box1_id" value="#" name="item_code[]" data-item-add-option data-item-reserved="N" data-option-id="00PF"
										data-option-index="1">
										<p class="product">
											[밀크터치] 글로시 젤리오 립틴트
											<br>
											<span>체리베어</span>
										</p>
									</td>
									<td>
										<span class="quantity" style="width:65px;">
											<input type="text" id="option_box1_quantity" name="quantity_opt[]" class="quantity_opt eProductQuantityClass" value="1" product-no="59" style="border:1;"/>
			 								<a href="#none" class="up eProductQuantityUpClass" data-target="option_box1_up">
												<img src="./../../../resources/img/up.png" id="option_box1_up" class="option_box_up" alt="수량증가">
											</a>
											<a href="#none" class="down eProductQuantityDownClass" data-target="option_box1_down">
												<img src="./../../../resources/img/down.png" id="option_box1_down" class="option_box_down" alt="수량감소">
											</a> 
										</span>
			 							<a href="#none" class="delete">
											<img src="./../../../resources/img/x.png" alt="삭제" id="option_box1_del" class="option_box_del">
										</a> 
									</td>
									<td class="right">
										<span id="option_box1_price">
											<input type="hidden" class="option_box_price" value="9900" product-no="59"
											item_code="P00000JE00PF">
											<span class="ec-front-product-item-price" code="P000000JE00PF" product-no="59">
												9,900원
											</span>
										</span>
									</td>
								</tr>
							</tbody>
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
				</div> 
			
		</div>


		<div style="clear: both;"></div>

	<br><br><br><br><br>
	<div id="wrap">
		<div id="container">
			<div id="contents">
				<div class="xans-element- xans-product xans-product-additional">
					<div id="detail" class="cboth pdt80">
					</div>
					<div class="detail_tab">
						<ul class="cboth title_detail">
							<li class="tab_open">
								<a href="#datail" data-tab="1">상품상세정보</a>
							</li>
							<li>
								<a href="#review" data-tab="2" class="crema-product-reviews-count crema-applied" data-product-code="634" data-format="리뷰 ({{{count}}})">리뷰 (11,997)</a>
 							</li>
 							<li>
 								<a href="#guide" data-tab="3">구매유의사항</a>
 							</li>
 							<li>
 								<a href="#qna" data-tab="4">상품 Q&A</a>
 							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide" style="justify: center;">
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p style="padding-top: 0; padding-bottom:5px; color: black; white-space:nowrap; overflow: hidden; text-overflow:ellipsis; font-size:12px; margin:0;">제목</p>
								<p id="choo" style="display: inline-block; margin:0; padding:0; display: flex; justify-content: space-between;">
									<span style="float: left; max-width: 55px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; font-size: 11px; line-height: 16px;">아이디</span>
									<span style="float: right; display:block; margin: 0; color:#767676; font-size: 11px; line-height: 16px;">날짜</span>
								</p>
							</div>
						</div>
						<br>
					</div>
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p class="card-text">제목</p>
								<p class="card-text">아이디</p>
							</div>
						</div>
						<br>
					</div>
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p class="card-text">제목</p>
								<p class="card-text">아이디</p>
							</div>
						</div>
						<br>
					</div>
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p class="card-text">제목</p>
								<p class="card-text">아이디</p>
							</div>
						</div>
						<br>
					</div>
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p class="card-text">제목</p>
								<p class="card-text">아이디</p>
							</div>
						</div>
						<br>
					</div>
				</div>
				<div class="swiper-slide">
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p class="card-text">제목</p>
								<p class="card-text">아이디</p>
							</div>
						</div>
						<br>
					</div>
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p class="card-text">제목</p>
								<p class="card-text">아이디</p>
							</div>
						</div>
						<br>
					</div>
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p class="card-text">제목</p>
								<p class="card-text">아이디</p>
							</div>
						</div>
						<br>
					</div>
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p class="card-text">제목</p>
								<p class="card-text">아이디</p>
							</div>
						</div>
						<br>
					</div>
					 <div class="container" style="float: left; max-width: 200px;">
						<div class="card" style="width: 200px">
							<img class="card-img-top" src="./../../../resources/img/up.png" alt="Card image"
								style="width: 200px; height: 200px;">
							<div> <!-- class="card-body" -->
								<p class="card-text">제목</p>
								<p class="card-text">아이디</p>
							</div>
						</div>
						<br>
					</div>
				</div>
			</div>
		<br>
		<br>
		<div class="swiper-pagination"></div>
			
		</div>
		<br>
		<br><br><br><br>
 
		<div class="tab-content current" id="myTabContent1" align="center" style="">
			<!-- 상세정보 -->
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">${goods.content}</div>
		</div>
		<div class="tab-content" id="myTabContent2" align="center">
			<!-- 리뷰 -->
			<jsp:include page="../review/list.jsp"></jsp:include>
		</div>
		<div class="tab-content" id="myTabContent3" align="center">	
			<!-- -->
		</div>
		<div class="tab-content" id="myTabContent4" align="center">
			<!-- 클레임 or Qna -->
			<jsp:include page="../claim/customclaim.jsp"></jsp:include>
		</div>	
	</div> 

	
<!--</div>-->


	<br>
	<br>
	<script>
		$(document).ready(function(){
			  
			$('ul.title_detail li a').click(function(){
			  	var tab_id = $(this).attr('data-tab');
	
			    $('ul.title_detail li').removeClass('tab_open');
			    $('.tab-content').removeClass('current');
	
			    $(this).parent().addClass('tab_open');
			    $("#myTabContent"+tab_id).addClass('current');
			})
			
		    var swiper = new Swiper("#test-swiper", {
		        spaceBetween: 1,    // 슬라이드 사이 여백

		        slidesPerView : 'auto', // 한 슬라이드에 보여줄 갯수
		        autoplay: {     //자동슬라이드 (false-비활성화)
		          delay: 30000000, // 시간 설정
		          disableOnInteraction: false, // false-스와이프 후 자동 재생
		        },

		        loop : false,   // 슬라이드 반복 여부
		        loopAdditionalSlides : 1,

		 		// 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상 수정
		        pagination: { // 호출(pager) 여부
		          el: ".swiper-pagination", //버튼을 담을 태그 설정
		          clickable: true, // 버튼 클릭 여부
		        },
		        navigation: {   // 버튼
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      });

	
		})
	
	// 매개 변수로 사용시 swiper가 초기화 될 때 동작합니다.
	    var swiper = new Swiper(".swiper", {
        spaceBetween: 30,    // 슬라이드 사이 여백

        slidesPerView : 'auto', // 한 슬라이드에 보여줄 갯수
        centeredSlides: true,    //센터모드
        autoplay: {     //자동슬라이드 (false-비활성화)
          delay: 30000000, // 시간 설정
          disableOnInteraction: false, // false-스와이프 후 자동 재생
        },

        loop : false,   // 슬라이드 반복 여부

        loopAdditionalSlides : 1,

 		// 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상 수정
        pagination: { // 호출(pager) 여부
          el: ".swiper-pagination", //버튼을 담을 태그 설정
          clickable: true, // 버튼 클릭 여부
        },
        navigation: {   // 버튼
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
	</script>
	
</body>
</html>