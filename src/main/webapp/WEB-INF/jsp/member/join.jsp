<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.main-center{
		text-align : center;
		
	}
</style>
<meta charset="UTF-8">
<title>회원가입화면</title>
		<%-- 부트스트랩 --%>
		<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<%-- js --%>
		<script src="/vendor/jquery/jquery.min.js"></script>
		<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container" style="background-color: #F2F4F7;">
<h1>회원가입 화면입돠.</h1>
<div class="row">
	<div class="main col-lg-7" style="margin: 0 auto;">
					<div class="main-center">
					<form action="join" method="POST" class="join">
						<div>
							<label class="info">이름</label>
							<span class=" col-lg-11 mr-auto"><input type="text"
										class="form-control" name="name" id="username"
										placeholder="이름 입력하셈"
										maxlength="10" /></span>
						</div>
						<div>
							<label class="info">나이</label>
							<span class=" col-lg-11 mr-auto"><input type="text"
										class="form-control" name="age" id="userage"
										placeholder="나이 입력하셈"
										maxlength="10" /></span>
						</div>
						<div>
							<label class="info">휴대폰</label>
							<span class=" col-lg-11 mr-auto"><input type="text"
										class="form-control" name="phone" id="userphone"
										placeholder="유얼 폰 넘버 깁미"
										maxlength="15" /></span>
						</div>
						<div>
							<label class="info">이메일</label>
							<span class=" col-lg-11 mr-auto"><input type="email"
										class="form-control" name="email" id="useremail"
										placeholder="니 이메일 좀 써봐라"
										maxlength="30" /></span>
						</div>
						<div>
							<label class="info">비밀번호</label>
							<span class=" col-lg-11 mr-auto"><input type="password"
										class="form-control" name="pwd" id="userpwd"
										placeholder="님아 비번 입력좀"
										maxlength="20" /></span>
						</div>
						<!-- <div>
							<label class="info">비밀번호 확인</label>
							<span class=" col-lg-11 mr-auto"><input type="password"
										class="form-control" name="pwd" id="userpwd"
										placeholder="입력하신 비밀번호 다시 한번 ㄱㄱ"
										maxlength="20" /></span>
						</div> -->
						<div>
							<label class="info">기본주소</label>
							<span class=" col-lg-11 mr-auto"><input type="text"
										class="form-control" name="basaddr" id="userbasaddr"
										placeholder="기본주소 입력"
										maxlength="20" /></span>
						</div>
						<div>
							<label class="info">상세주소</label>
							<span class=" col-lg-11 mr-auto"><input type="text"
										class="form-control" name="detaddr" id="userdetaddr"
										placeholder="상세주소 입력"
										maxlength="20" /></span>
						</div>
						<div>
						
							<input type="submit" value = 회원가입>
							<input type="button" value = 뒤로가기>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
var nameCheck = 0; // 유효성검사
var pwdCheck = 0; // 패스워드 , 패스워드확인 값이 같은지 체크용
var emailCheck = 0;
var nickCheck = 0;


</script>
</html>