<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/vendor/jquery/jquery.min.js"></script>
<style>
tr, td {
	border: 1px solid silver;
}
</style>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<script>
function goregist(){
	location.href = "../member/addboard";
}
</script>
<body>
	<div class="container">
		<div style="float:left; margin:30px;">
		<c:choose>
			<c:when test="${sessionScope.loginuser eq null}">
			</c:when>
			<c:otherwise>
				<label>사용자 : ${sessionScope.loginuser.name}</label>
			</c:otherwise>
		</c:choose>
		<table style="width: 500px; text-align: center; border-collapse: collapse;">
			<thead style="background-color: #606066">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>일부내용</td>
					<td>별점</td>
					<td>좋아요</td>
					<td>싫어요</td>
					<td>작성자</td>
					<td>등록일</td>
				</tr>
			</thead>
			<tbody class="boardtable">
				<c:forEach items="${boardlist}" var="bl" varStatus="i">
					<tr>
						<td>${bl.no}</td>
						<td><a href="/app/member/detailbo?no=${bl.no}">${bl.title}</a></td>
						<td>${bl.note}</td>
						<td>${bl.star}</td>
						<td>${bl.likec}</td>
						<td>${bl.dlikec}</td>
						<td>${bl.meno}</td>
						<td>${bl.rgdt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<div>
			<nav aria-label="Page navigation example" class='pages' style="text-align: center;margin-top: 17px;">
	              <ul class="pagination justify-content-center">
	                <li class="page-item"><a class="page-link"
	                  href="javascript:goPage(${paging.prevPageNo})">Previous</a></li>
	
	                <c:forEach var="i" begin="${paging.startPageNo}"
	                  end="${paging.endPageNo}" step="1">
	                  <c:choose>
	                    <c:when test="${i eq paging.pageNo}">
	                      <li class="page-item active"><a
	                        href="javascript:goPage(${i},${sessionScope.loginuser.no})" class="choice">${i}</a></li>
	                    </c:when>
	                    <c:otherwise>
	                      <li class="page-item"><a
	                        href="javascript:goPage(${i},${sessionScope.loginuser.no})">${i}</a></li>
	                    </c:otherwise>
	                  </c:choose>
	                </c:forEach>
	                <li class="page-item"><a class="page-link"
	                  href="javascript:goPage(${paging.nextPageNo},${sessionScope.loginuser.no})">Next</a></li>
	              </ul>
	          </nav>
			<button onclick="goregist()">게시글 등록하러가기</button>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
function goPage(pageno,meno){
	var html = "";
	console.log(pageno);
	console.log(meno);
	$.ajax({
		type : "POST",
		data : {
			"pageNo" : pageno ,
			"meno" : meno
		},url : "board.do",
		success : function(data){
			console.log(data);
			/* $(".boardtable").empty();
			$.each(data.boardlist,function(index,item){
				$(".boardtable").append(
					'<tr>'+
					'<td>'+item.no+'</td>'+
					'<td><a href="/app/member/detailbo?no='+item.no+'">'+item.title+'</a></td>'+
					'<td>'+item.note+'</td>'+
					'<td>'+item.star+'</td>'+
					'<td>'+item.likec+'</td>'+
					'<td>'+item.dlikec+'</td>'+
					'<td>'+item.meno+'</td>'+
					'<td>'+item.rgdt+'</td>'+
					'</tr>'
				);
			}); */
			
		}
	});
}
</script>
</body>
</html>