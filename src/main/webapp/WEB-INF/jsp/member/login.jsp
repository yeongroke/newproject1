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
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-lg-7">
			<div class="other_login" style="margin-bottom:20px;">
				<a id="kakao-login-btn"></a>
				<a href="http://developers.kakao.com/logout"></a>
			</div>
			<div class="my_login">
				<label>이메일</label>
				<c:choose>
					<c:when test="${sessionScope.loginuser == null}">
						<input type="email" name="email" id="useremail" value="${cookie.email.value}"/>
						<label>비밀번호</label>
						<input type="password" name="pwd" id="userpwd"/>
					</c:when>
					<c:otherwise>
						<h2>${sessionScope.loginuser.name}</h2>
					</c:otherwise>
				</c:choose>
				
				<input type="button" onClick="login()" value="로그인"/>
				<input type="button" onClick="gohome()" value="뒤로가기"/>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
//사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('99662c13961f0a69d40531562aaf40f6');
// 카카오 로그인 버튼을 생성합니다.
Kakao.Auth.createLoginButton({
  container: '#kakao-login-btn',
  success: function(authObj) {
    alert(JSON.stringify(authObj));
  },
  fail: function(err) {
     alert(JSON.stringify(err));
  }
});

function gohome(){
    history.back();
}

function login(){
var emailva = $("#useremail").val();
var pwdva = $("#userpwd").val();
    $.ajax({
        type : "POST",
        data : {
            "email" : emailva,
            "pwd" : pwdva 
        }
    	,url:"login.do",
        success : function(data){
            if(data == "1"){
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