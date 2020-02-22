<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
	<div>
		<h1>우리 엉아아아!!</h1>
	</div>
	<div>
		<input type="button" onclick ="location.href='../member/join'" value="회원가입하기"/>
		<input type="button" onclick ="location.href='../member/board'" value="게시판가기"/>
		<c:choose>
			<c:when test="${sessionScope.loginuser eq null}">
				<input type="button" onclick ="location.href='../member/login'" value="로그인하기"/>
			</c:when>
			<c:otherwise>
				<label>사용자 : ${sessionScope.loginuser.name}</label>
			</c:otherwise>
		</c:choose>
		<input type ="button" onclick="logout()" value ="로그아웃"/>
	</div>	
</div>

<script>
function logout(){
	
	location.href = "./main";
}
</script>
</body>
</html>