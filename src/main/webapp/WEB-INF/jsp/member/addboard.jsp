<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 추가</title>
</head>
		<%-- 부트스트랩 --%>
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<%-- js --%>
		<script src="/vendor/jquery/jquery.min.js"></script>
		<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
<script>
	function submitbo(){
		var titleval = $("#title").val();
		var noteval = $("#note").val();
		if(titleval != "" && noteval != ""){
			$.ajax({
				type : "POST",
				data : {
					"title" : titleval,
					"note" : noteval
				},
				url : "addboard.do" ,
				success : function(data){
					swal({
	                    title : "등록성공",
	                    text: "등록되었슴돠",
	                    icon: "success",
	                    button:"게시글로 이동"
	                }).then((willDelete) => { 
	                     location.href="../member/board";
	                  });
				}
			})
		}else{
			swal({
	            title : "게시글 조건이 맞지않습니다.",
	            text: "입력하신 정보를 다시 확인해보셈.",
	            icon: "warning"
	        })
		}
	}
</script>
<div class="container mainbody">
	<div class="row">
		<div class="boardata col-lg-9">
			<div class="board_body">
				<input type="text" name="title" id="title" placeholder="게시글 제목 입력" maxlength="30">
				<input type="text" name="note" id="note" placeholder="게시글 내용 입력">
				<input type="button" onClick="submitbo()" value=등록하기 >
			</div>
		</div>
	</div>
</div>
</body>
</html>