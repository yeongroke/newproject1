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
		<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="container" style="background-color: #F2F4F7;">
<h1>회원가입 화면입돠.</h1>
<div class="row">
	<div class="main col-lg-7" style="background-color: aqua; margin: 0 auto;">
					<div class="main-center">
					<!-- <form action="join.do" method="post" class="joinstart"> -->
						<div>
							<label class="info">이름</label>
							<span class=" col-lg-11 mr-auto"><input type="text"
										class="form-control" name="name" id="username"
										oninput="namecheck()" placeholder="이름 입력하셈"
										maxlength="10" /></span>
						</div>
						<div>
							<label class="info">나이</label>
							<span class=" col-lg-11 mr-auto"><input type="number"
										class="form-control" name="age" id="userage"
										onkeypress="return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57"
										min="0" placeholder="나이 입력하셈"
										maxlength="3" /></span>
						</div>
						<div>
							<label class="info">휴대폰</label>
							<span class=" col-lg-11 mr-auto"><input type="text"
										class="form-control" name="phone" id="userphone"
										onkeyup="phocheck(this)" placeholder="유얼 폰 넘버 깁미"
										maxlength="13" /></span>
						</div>
						<div>
							<label class="info">이메일</label>
							<span class=" col-lg-11 mr-auto"><input type="email"
										class="form-control" name="email" id="useremail"
										oninput="emacheck()" placeholder="니 이메일 좀 써봐라"
										maxlength="30" /></span>
						</div>
						<div>
							<label class="info">비밀번호</label>
							<span class=" col-lg-11 mr-auto"><input type="password"
										class="form-control" name="pwd" id="userpwd"
										 placeholder="님아 비번 입력좀"
										maxlength="20" /></span>
						</div>
						<div>
							<label class="info">비밀번호 확인</label>
							<span class=" col-lg-11 mr-auto"><input type="password"
										class="form-control" name="repwd" id="userrepwd"
										oninput="repwcheck()" placeholder="입력하신 비밀번호 다시 한번 ㄱㄱ"
										maxlength="20" /></span>
						</div>
						<!-- <div>
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
						</div> -->
						<div>
							<input type="text" id="postcode" placeholder="우편번호">
							<input type="button" onclick="searchPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="userbasaddr" readonly="readonly" placeholder="주소"><br>
							<input type="text" id="userdetaddr" placeholder="상세주소">
						</div>
						<div>
						
							<input type="button" onClick="signupCheck()" value = 회원가입>
							<input type="button" onClick="gohome()" value = 뒤로가기>
						</div>
						<!-- </form> -->
					</div>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
function searchPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                //document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("userbasaddr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("userdetaddr").focus();
        }
    }).open();
}

/* new daum.Postcode({
    oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
    }
}).open(); */

var nameCheck = 0; // 유효성검사
//var pwdCheck = 0; // 패스워드 , 비밀번호가 문자 특수문자 숫자 들어가있는지 체크
var repwCheck = 0; //  패스워드확인 값이 같은지 체크용
var emailCheck = 0; // 이메일 체크

function gohome(){
    history.back();
}

function namecheck(){
    var nameval = $("#username").val();
    var reg_name = /^[가-힣]{2,4}$/;
	var x = reg_name.test(nameval);
    if(nameval == ""){
        nameCheck = 0;
    }else if(x == true || nameval.length > 1){
        nameCheck = 1;
    }else {
        nameCheck = 0;
    }
}

function phocheck(phval){
    var phoval = phval.value.replace(/[^0-9]/g, "");
	var tmp = '';
	
	if( phoval.length < 4){
	    return phoval;
	  }else if(phoval.length < 7){
	    tmp += phoval.substr(0, 3);
	    tmp += '-';
	    tmp += phoval.substr(3);
	  }else if(phoval.length < 11){
	    tmp += phoval.substr(0, 3);
	    tmp += '-';
	    tmp += phoval.substr(3, 3);
	    tmp += '-';
	    tmp += phoval.substr(6);
	  }else{
	    tmp += phoval.substr(0, 3);
	    tmp += '-';
	    tmp += phoval.substr(3, 4);
	    tmp += '-';
	    tmp += phoval.substr(7);
	  }
	phval.value = tmp;
}

function emacheck(){
    var emava = $("#useremail").val();
    var compema = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var y = compema.test(emava);
	$.ajax({
	    type : "POST",
	    data : {
	        "email" : emava,
	    },url : "findemacount",
	    success : function(data) {
	        if(emava=="" && data=='0' ) {
                $("#useremail").css("background-color", "white");
                emailCheck = 0;
            } else if (data == '0' && y == true && $("#useremail").val().length > 0) {
                $("#useremail").css("background-color", "#B0F6AC");
                emailCheck = 1;
            } else if (data == '1') {
                $("#useremail").css("background-color", "#FA5858");
                emailCheck = 0;
            }else if(data=='0') {
                $("#useremail").css("background-color", "#FA5858");
                emailCheck = 0;
            }
	    }
	})
}

/* function pwcheck(){ // 비밀번호에 특수문자 , 영어 , 숫자 포함되는지 체크 확인
    var pwdva = #("#userpwd").val();
    
    var cmp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var c = cmp.test(pwdva);
    
    if(c == true){
        
    }
} */

function repwcheck(){
    var inputed = $('#userpwd').val();
    var reinputed = $('#userrepwd').val();
    if(reinputed=="" && (inputed != reinputed || inputed == reinputed || $('#userrepwd').val().length < 8 || $('#userpwd').val().length < 4)){
        $("#userrepwd").css("background-color", "#FA5858");
        pwdCheck = 0;
    }else if (inputed == reinputed && $('#userpwd').val().length > 3){
        $("#userrepwd").css("background-color", "#B0F6AC");
        pwdCheck = 1;
    } else if (inputed != reinputed) {
        pwdCheck = 0;
        $("#userrepwd").css("background-color", "#FA5858");
    }
}

/* function bsacheck(){
    
}

function dtacheck(){
    
} */

function signupCheck(){
    var nameva = $("#username").val();
    var agva = $("#userage").val();
    var phova = $("#userphone").val();
    var emailva = $("#useremail").val();
    var repwva = $("#userrepwd").val();
    var bsava = $("#userbasaddr").val();
    var dtava = $("#userdetaddr").val();
    if(nameCheck == 1 || repwCheck == 1 || emailCheck == 1){
        $.ajax({
            type : "POST",
            data : {
                "name" : nameva,
                "age" : agva,
                "phone" : phova,
                "email" : emailva,
                "pwd" : repwva,
                "bas_addr" : bsava,
                "det_addr" : dtava
            },
            url : "join.do",
            success : function(data){
                swal({
                    title : "회원가입 성공",
                    text: "회원가입을 축하드립니다.",
                    icon: "success",
                    button:"메인 화면이동"
                }).then((willDelete) => { 
                     location.href="../member/main";
                  });
            }
        });
    }else{
        swal({
            title : "회원가입 조건이 맞지않습니다.",
            text: "입력하신 정보를 다시 확인해보셈.",
            icon: "warning"
        })
    }
}
</script>
</html>