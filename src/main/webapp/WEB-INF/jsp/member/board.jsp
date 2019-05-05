<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
	tr,td{
		border:1px solid silver;
	}
</style>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<div class="container">
	<table style = "width:500px; text-align:center; border-collapse:collapse;">
			<thead style ="background-color:#606066">
				<tr><td>d1</td><td>d2</td><td>d2</td><td>d2</td><td>d2</td><td>d2</td><td>d2</td><td>d2</td></tr>
			</thead>
			<tbody>
		<c:forEach items="${boardlist}" var="bl" varStatus="i">
				<tr>
					<td>${bl.no}</td><td>${bl.title}</td><td>${bl.note}</td><td>${bl.star}</td><td>${bl.likec}</td><td>${bl.dlikec}</td><td>${bl.rgdt}</td><td>${bl.meno}</td>
				</tr>
		</c:forEach>
			</tbody>
	</table>
</div>
</body>
</html>