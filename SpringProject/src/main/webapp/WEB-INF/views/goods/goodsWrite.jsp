<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">


<!DOCTYPE html>
<html>
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>상품등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
<head>

</head>
<style>
@CHARSET "UTF-8";

a:link, a:visited {text-decoration: none; color: #656565;}

.board_list {width:100%;border-top:2px solid #252525;border-bottom:1px solid #ccc}
.board_list thead th:first-child{background-image:none}
.board_list thead th {border-bottom:1px solid #ccc;padding:12px 0 13px 0;color:#3b3a3a;vertical-align:middle}
.board_list tbody td {border-top:1px solid #ccc;padding:10px 0;text-align:center;vertical-align:middle}
.board_list tbody tr:first-child td {border:none}
.board_list tbody td.title {text-align:left; padding-left:20px}
.board_list tbody td a {display:inline-block}

.board_view {width:50%;border-top:2px solid #252525;border-bottom:1px solid #ccc}
.board_view tbody th {text-align:left;background:#f7f7f7;color:#3b3a3a}
.board_view tbody th.list_tit {font-size:13px;color:#000;letter-spacing:0.1px}
.board_view tbody .no_line_b th, .board_view tbody .no_line_b td {border-bottom:none}
.board_view tbody th, .board_view tbody td {padding:15px 0 16px 16px;border-bottom:1px solid #ccc}
.board_view tbody td.view_text {border-top:1px solid #ccc; border-bottom:1px solid #ccc;padding:45px 18px 45px 18px}
.board_view tbody th.th_file {padding:0 0 0 15px; vertical-align:middle}

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

.pad_5 {padding: 5px;}
.wdp_90 {width:90%}
.btn {border-radius:3px;padding:5px 11px;color:#fff !important; display:inline-block; background-color:#6b9ab8; border:1px solid #56819d;vertical-align:middle}
</style>
<body>

<br><br>
<div align="center">
<h2>${title}</h2>
</div>

<br><br>
<div align="center">
<form name="frm" id="frm" enctype="multipart/form-data" method="post">
		<table align="center" border="0">
				
				<tr>
					<th>상품이름 </th>
					<td>
						<input type="text" id="pname" name="pname" placeholder="상품이름입력" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_NAME}"</c:if>>
					</td>
				</tr>
				
				
				<tr>
					<th>상품내용 </th>
					<td>
						<textarea rows="30" cols="100" id="content" name="content">
						<c:if test="${type eq 'modify'}">${map.GOODS_CONTENT}</c:if>
						</textarea>
					</td>
				</tr>

				<tr>
					<th>카테고리 </th>
					<td>
						<select name="category" id="category">
							<option value="skincare">skincare</option>
							<option value="base">base</option>
							<option value="eye">eye</option>
							<option value="lip">lip</option>
							<option value="cheek">cheek</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>상품원가 </th>
					<td>
						<input type="text" name="originalPrice" id="originalPrice" placeholder="상품원가" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_ORIGIN_PRICE}"</c:if>> 
					</td>
				</tr>
				
				<tr>
					<th>상품할인가 </th>
					<td>
						<input type="text" name="discountPrice" id="discountPrice" placeholder="상품할인가" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_SALE_PRICE}"</c:if>>
					</td>
				</tr>
				
				<tr>
					<th>상품판매가 </th>
					<td>
						<input type="text" name="sellPrice" id="sellPrice" placeholder="상품판매가" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_SELL_PRICE}"</c:if>>
					</td>
				</tr>
				
				<tr>
					<th>피부타입 </th>
					<td>
						<input type="checkbox" name="skintype" id="skintype" value="dry" style="padding:10px;"> 건성
						<input type="checkbox" name="skintype" id="skintype" value="middle" style="padding:10px;"> 복합성
						<input type="checkbox" name="skintype" id="skintype" value="oily" style="padding:10px;"> 지성
						<!-- <input type="hidden" name="GOODS_PICK" id="GOODS_PICK" value=""> -->
					</td>
				</tr>
				
				<tr>
					<th>상품사이즈 </th>
					<td>
						<input type="checkbox" name="SIZE" value="FREE" style="padding:10px;"> FREE
						<input type="checkbox" name="SIZE" value="S" style="padding:10px;"> S
						<input type="checkbox" name="SIZE" value="M" style="padding:10px;"> M
						<input type="checkbox" name="SIZE" value="L" style="padding:10px;"> L
						<input type="checkbox" name="SIZE" value="XL" style="padding:10px;"> XL
						<input type="hidden" name="GOODS_ATT_SIZE" id="GOODS_ATT_SIZE" value="">
					</td>
				</tr>
				

				
				<tr>
					<th>상품수량 </th>
					<td>
					<input type="text" name="GOODS_ATT_AMOUNT" id="GOODS_ATT_AMOUNT" placeholder="상품수량" size="40" 
					style="padding:10px;" value=<c:if test="${type eq 'modify'}">${map.GOODS_ATT_AMOUNT}</c:if>>
					</td>
				</tr>
				<input type="hidden" id="IDX" name="IDX" value="${map.GOODS_NO}">
		</table>
		
		<div class="image">
			<div class="image-wrap">
				<p>메인이미지</p>
				<br> <input type="file" name="uploadFile" id="mainImage" enc="multipart-formdata">
			</div>
	
			<div id="previewContainer" style="width: 30%;">
			</div>
			
		</div>
	
	<br>	
	<div align="center">
	<c:if test="${type eq 'write'}"><a href="#this" class="btn" id="write" onClick="fn_chk()">작성하기</a></c:if>
	<c:if test="${type eq 'modify'}"><a href="#this" class="btn" id="update" onClick="fn_chk()">수정하기</a></c:if>
	<a href="#this" class="btn" id="list">목록으로</a>
	</div>
</form>

</div>
<!-- commandForm  -->
<form id="commonForm" name="commonForm"></form>

<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
function submitData(){
	var pname = $("#pnameReal").val();
	var price = $("#priceReal").val();
	var stock = $('#stockReal').val();
	var category = $('.category').val();
	var skintype = $('.skintype').val();
	var uploadBtn = $("#uploadBtn");
	
	console.log(pname);
	console.log(price);
	console.log(stock);
	console.log(category);
	console.log(skintype);

	if (join()){
		$.ajax({
			url:"/registerGoods",		// servlet 
			type: "post",
			dataType: 'json',
			data: {"price" : price, "pname": pname, "stock": stock, "skintype": skintype, "category": category, "gno": gno},
			beforeSend: function(xhr) { //XMLHttpRequest (XHR)은 AJAX 요청을 생성하는 JavaScript API이다. XHR의 메서드로 브라우저와 서버간의 네트워크 요청을 전송할 수 있다.
				xhr.setRequestHeader(header, token); //csrf 전송하지 않으면 아예 ajax가 되지 않는 문제가 생김.
			},
			success:function(data){
				console.log("성공" + data);
				console.log(data);
				loadImage(data); 
				location.href = '/registerGoods2'
			},
			error:function(){
				alert("error");
			}
		});
	}	
}


$(function(){
	CKEDITOR.replace('GOODS_CONTENT',{
        width:'120%',
        height:'400px',
		filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do'
			
	});
	
	
	const mainImageInput = document.querySelector("#mainImage");
	const previewContainer = document.getElementById("previewContainer");
	
	
	mainImageInput.addEventListener("change", (event) => {
        const file = event.target.files[0];
        
        if (file) {
            // FileReader 인스턴스 생성
            const reader = new FileReader();
			alert("성공");
            // 파일 읽기 성공 시 미리보기 생성
            reader.onload = (e) => {
                const imagePreview = document.createElement("img");
                alert("성공");
                imagePreview.src = e.target.result;
                imagePreview.style.maxWidth = "200px"; // 미리보기 이미지 크기 제한 (선택사항)
                previewContainer.innerHTML = ""; // 기존 미리보기 제거
                previewContainer.appendChild(imagePreview);
            };

            // 파일 읽기 시작
            reader.readAsDataURL(file);
        }
    });	
	
	
	
});

	var gfv_count = 1;

// $(document).ready(function() 함수 또는 코드가 호출 또는 실행되는 시점을
// 스케쥴링할 수 있게 해준다. 그 시점은 바로 문서객체모델이라고 하는 DOM
// (Document Object Model)이 모두 로딩되었을 때인데 이렇게
// $(document).ready(function() 안에 위치한 코드를 DOM이 모두 준비된 이후에 
// 실행되게끔 해준다.
$(document).ready(function() {

	$("#list").on("click", function(e){//목록으로 버튼
		//html 에서 a 태그나 submit 태그는 고유의 동작이 있다. 
		//페이지를 이동시킨다거나 form 안에 있는 input 등을 전송한다던가 
		//그러한 동작이 있는데 e.preventDefault 는 그 동작을 중단시킨다.
		e.preventDefault(); 
		fn_openBoardList();	
	});

	$("#write").on("click", function(e){ //작성하기 버튼
		e.preventDefault();
		fn_insertBoard();
	});

	$("#update").on("click", function(e){ //수정하기 버튼
		e.preventDefault();
		fn_updateGoods();	
	});

	
	
});


function fn_openBoardList() {

	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");//이동할 url
	comSubmit.submit(); //전송
	
}

function fn_updateGoods(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/shop/goodsModify.do' />");
	comSubmit.submit();
}

function fn_insertBoard() { // 유효성체크

	var comSubmit = new ComSubmit("frm"); // 객체생성
	comSubmit.setUrl("<c:url value='/shop/goodsWrite.do' />"); // url설정

    // 게시글 제목 필요
    if(!$("#GOODS_NAME").val()){
        alert("제목를 입력해주세요.");
        $("#GOODS_NAME").focus();
        return false;
    }
	 	// 게시글 내용 필요
    if(CKEDITOR.instances.GOODS_CONTENT.getData() =='' 
            || CKEDITOR.instances.GOODS_CONTENT.getData().length ==0){
        alert("내용을 입력해주세요.");
        $("#GOODS_CONTENT").focus();
        return false;
    }
	 	
 	// 상품원가 
    if(!$("#GOODS_ORIGIN_PRICE").val()){
        alert("상품원가를 입력해주세요.");
        $("#GOODS_ORIGIN_PRICE").focus();
        return false;
    }
 	// 할인가
    if(!$("#GOODS_SALE_PRICE").val()){
        alert("상품할인가를 입력해주세요.");
        $("#GOODS_SALE_PRICE").focus();
        return false;
    }
 	// 판매가
    if(!$("#GOODS_SELL_PRICE").val()){
        alert("판매가를 입력해주세요.");
        $("#GOODS_SELL_PRICE").focus();
        return false;
    }
/*   	// PICK
     if(!$("#GOODS_PICK").val()){
        alert("PICK을 선택해주세요.");
        return false;
    }
 	// 사이즈
    if(!$("#GOODS_ATT_SIZE").val()){
        alert("상품사이즈를 선택해주세요.");
        return false;
    }  */ 
	 // 컬러
    if(!$("#GOODS_ATT_COLOR").val()){
        alert("상품컬러를 입력해주세요.");
        $("#GOODS_ATT_COLOR").focus();
        return false;
    }
	 // 상품 수량
    if(!$("#GOODS_ATT_AMOUNT").val()){
        alert("상품수량을 입력해주세요.");
        $("#GOODS_ATT_AMOUNT").focus();
        return false;
    }


	comSubmit.submit();
	
}

function fn_chk() {
	
	
	var obj = $("[name=PICK]");
	var chkArray = new Array(); //배열 선언

	$('input:checkbox[name=PICK]:checked').each(function() { //체크된 값을 가져옴
		chkArray.push(this.value);
	});
	$('#GOODS_PICK').val(chkArray);

	//alert($('#GOODS_PICK').val());

	
	var obj1 = $("[name=SIZE]");
	var chkArray1 = new Array(); //배열 선언

	$('input:checkbox[name=SIZE]:checked').each(function() { //체크된 값을 가져옴
		chkArray1.push(this.value);
	});
	$('#GOODS_ATT_SIZE').val(chkArray1);

	//alert($('#GOODS_ATT_SIZE').val());
		
}

function showImage(fileCallPath){
	//alert(fileCallPath);
	
	$(".bigPictureWrapper").css("display", "flex").show();
	
	$(".bigPicture")
	.html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>")
	.animate({width: '100%', height: '100%'}, 1000);
}

$(".bigPictureWrapper").on("click", function(e){
	$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
	setTimeout(() => {
		$(this).hide();	
	},1000);
})

function loadImage(Data){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		// Add File Data to formData
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		console.log('냐냐냐냐');
		console.log(Data);
		formData.append("gno", Data.gno);
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			beforeSend: function(xhr) { //XMLHttpRequest (XHR)은 AJAX 요청을 생성하는 JavaScript API이다. XHR의 메서드로 브라우저와 서버간의 네트워크 요청을 전송할 수 있다.
				xhr.setRequestHeader(header, token); //csrf 전송하지 않으면 아예 ajax가 되지 않는 문제가 생김.
			},
			success: function(result){
				//console.log(result);
				//console.log(formData);
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
			}
		});  //$.ajax
	}; 

</script>

</body>
</html>


