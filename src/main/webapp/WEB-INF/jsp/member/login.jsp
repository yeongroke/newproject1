<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
		<%-- 부트스트랩 --%>
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<%-- js --%>
		<script src="/vendor/jquery/jquery.min.js"></script>
		<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<label>이메일</label>
<c:choose>
	<c:when test="${sessionScope.loginuser == null}">
		<input type="email" name="email" id="useremail"/>
		<label>비밀번호</label>
		<input type="password" name="pwd" id="userpwd"/>
	</c:when>
	<c:otherwise>
		<h2>${sessionScope.loginuser.name}</h2>
	</c:otherwise>
</c:choose>

<input type="button" onClick="login()" value="로그인"/>
<input type="button" onClick="gohome()" value="뒤로가기"/>


<script type="text/javascript">
function gohome(){
    history.back();
}

function login(){
var emailva = $("#useremail").val();
var pwdva = $("#userpwd").val();
console.log(emailva);
console.log(pwdva);
    $.ajax({
        type : "POST",
        data : {
            "email" : emailva,
            "pwd" : pwdva 
        },url:"login.do",
        success : function(data){
            console.log(data);
            if(data == 1){
                console.log("성공");
                swal({
                    text: "로그인성공.",
                    icon: "success",
                    button:"메인 화면이동"
                }).then((willDelete) => { 
                     location.href="../member/main";
                  });
            }else{
                swal({
                    title : "로그인 실패",
                    text : "없는 이메일이거나 비밀번호가 틀렸",
                }).then((willDelete) =>{
                    location.href="../member/login";
                });
            }
        }
    });
}

</script>
</body>
</html>