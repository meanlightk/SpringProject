<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="../resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<div align="center">
	<form name="frm" id="frm" enctype="multipart/form-data" method="post">
		<table align="center" border="0">
				<%-- 
				<tr>
					<th>상품이름 </th>
					<td>
						<input type="text" id="pname" name="pname" placeholder="상품이름입력" size="40" 
						style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_NAME}"</c:if>>
					</td>
				</tr>
				 --%>
				
				<tr>
					<th>상품내용 </th>
					<td>
						<textarea rows="30" cols="100" id="content" name="content">
						<c:if test="${type eq 'modify'}">${map.GOODS_CONTENT}</c:if>
						</textarea>
					</td>
				</tr>

				<tr>
					<th>종류</th>
					<td>
						<select name="#">
							<option value="1">교환</option>
							<option value="2">환불</option>
						</select>
					</td>
				</tr>

				<tr>
					<th>교환/환불 사유</th>
					<td>
						<select name="status">
							<option value="1">단순변심</option>
							<option value="2">제품하자</option>
							<option value="3">사이즈</option>
							<option value="4">오배송</option>
							<option value="5">기타</option>
						</select>
					</td>
				</tr>
				<input type="hidden" id="gno" name="gno" value="${gno}">
		</table>
		
		<div class="image">
			<div class="image-wrap">
				<p>메인이미지</p>
				<br> <input type="file" name="uploadFile" id="image" >
			</div>
	
			<div id="previewContainer" style="width: 30%;">
		</div>
	
	<br>	
	<div align="center">
	<c:if test="${type eq 'write'}"><a href="#this" class="btn" id="write" onClick="fn_chk()">작성하기</a></c:if>
	<c:if test="${type eq 'modify'}"><a href="#this" class="btn" id="update" onClick="fn_chk()">수정하기</a></c:if>
	<a href="#this" class="btn" id="list">목록으로</a>
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

</div>
</body>
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

function submitData(){
	var status = $('.status').val();
	var uploadBtn = $("#uploadBtn");
	
	console.log(status);

	if (join()){
		$.ajax({
			url:"/registerGoods",		// servlet 
			type: "post",
			dataType: 'json',
			data: {"status": status},
			beforeSend: function(xhr) { //XMLHttpRequest (XHR)은 AJAX 요청을 생성하는 JavaScript API이다. XHR의 메서드로 브라우저와 서버간의 네트워크 요청을 전송할 수 있다.
				xhr.setRequestHeader(header, token); //csrf 전송하지 않으면 아예 ajax가 되지 않는 문제가 생김.
			},
			success:function(data){
				console.log("성공" + data);
				console.log(data);
				loadImage(data); 
				location.href = '/test3'
			},
			error:function(){
				alert("error");
			}
		});
	}	
/*	
	$.ajax({
			url: '/registerGoods',
			processData: false,
			contentType: false,  //이것때문에 오류. contentType: "application/json",파일보낼 때 이렇게 씀
			data: {"price": price},
			type: 'post',
			dataType: 'json',
			beforeSend: function(xhr) { //XMLHttpRequest (XHR)은 AJAX 요청을 생성하는 JavaScript API이다. XHR의 메서드로 브라우저와 서버간의 네트워크 요청을 전송할 수 있다.
				xhr.setRequestHeader(header, token); //csrf 전송하지 않으면 아예 ajax가 되지 않는 문제가 생김.
			},
			success: function(result){
				console.log(result);
				alert('upload');
				
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
			},
			error: function(error){
				console.log(error);
			}
		});*/
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

	function loadSubImage(Data){
		var formData = new FormData();
		var inputFile = $("input[name='uploadSubFile']");
		var files = inputFile[0].files;

		// Add File Data to formData
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
	
		formData.append("gno", Data.gno);
		console.log(formData);
		console.log(files);


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
//				console.log(result);
//				console.log(formData);
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
			}
		});  //$.ajax
	}; 
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;  //5MB
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert('파일 사이즈 초과');
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	
	function join() {
		
		const name = document.querySelector("#pnameReal");
		const price =document.querySelector("#priceReal");
		const stock = document.querySelector("#stockReal");
		const main = document.querySelector("#mainImage");
		const sub = document.querySelector("#subImages");
		
		
		if (!name.value) {
			alert("상품명을 입력해주세요.");
			name.focus();
			return false;
		}
		if (!price.value || price < 0) {
			alert("가격을 입력해주세요.");
			price.focus();
			return false;
		}
		if (!stock.value) {
			alert("재고를 입력해주세요.");
			stock.focus();
			return false;
		}


		if (!main.value) {
			alert("메인 이미지를 삽입해 주세요.");
			return false;
		}

		if (!sub.value) {
			alert("서브 이미지를 삽입해주세요.");
			return false;
		}
		return true;
		
	}
$(document).ready(function(){

	

	const mainImageInput = document.querySelector("#mainImage");
	const previewContainer = document.getElementById("previewContainer");
	
	
	mainImageInput.addEventListener("change", (event) => {
        const file = event.target.files[0];
        
        if (file) {
            // FileReader 인스턴스 생성
            const reader = new FileReader();

            // 파일 읽기 성공 시 미리보기 생성
            reader.onload = (e) => {
                const imagePreview = document.createElement("img");
                imagePreview.src = e.target.result;
                imagePreview.style.maxWidth = "200px"; // 미리보기 이미지 크기 제한 (선택사항)
                previewContainer.innerHTML = ""; // 기존 미리보기 제거
                previewContainer.appendChild(imagePreview);
            };

            // 파일 읽기 시작
            reader.readAsDataURL(file);
        }
    });
	

	
	var cloneObj = $(".uploadDiv").clone();
	
/* 	$('#uploadBtn').on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		// Add File Data to formData
		for(var i = 0; i < files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
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
				console.log(result);
				alert('upload');
				
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
			}
		});  //$.ajax
	}); 
	*/
	var uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr){
		
		var str = "";
		
		$(uploadResultArr).each(
				function(i, obj){
					
					if(!obj.image){
						
						var fileCallPath = encodeURIComponent( obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
						
						var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						
						str += "<li><div><a href='/download?fileName=" + fileCallPath + "'>" + "<img src='/resources/img/attach.png'>" + obj.fileName + "</a>"
								+ "<span data-file=\'" + fileCallPath + "\' data-type='file'> x </span>"
								+ "</div></li>";
					}else{
						//str += "<li>" + obj.fileName + "</li>";
						
						var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						
						var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
						
						originPath = originPath.replace(new RegExp(/\\/g),"/");
						
						str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\">" + 
						"<img src='display?fileName=" + fileCallPath + "'></a>"
								+ "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span>" + "</li>";
					}
		});
			
		uploadResult.append(str);
	}
	
	$(".uploadResult").on("click", "span", function(e){
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		console.log(targetFile);
		
		$.ajax({
			
			url: '/deleteFile',
			data: {fileName: targetFile, type: type},
			dataType: 'text',
			type: 'POST',
			success: function(result){
				alert(result);
			}
		});  //$.ajax
	});
	
});  
</script>
</html>