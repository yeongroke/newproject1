<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN 화면</title>
		<%-- 부트스트랩 --%>
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<%-- js --%>
		<script src="/vendor/jquery/jquery.min.js"></script>
		<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">

	<%-- <jsp:include page="../member/login"></jsp:include> --%>

	<input type="button" onclick ="location.href='../member/login'" value="로그인하기"/>
	<input type="button" onclick ="location.href='../member/join'" value="회원가입하기"/>
	<input type="button" onclick ="location.href='../member/board'" value="게시판가기"/>

</div>
</body>
</html>