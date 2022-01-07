<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
		table, tr, td, th {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 20px;
		}
		
	</style>
	
	<script>
		function sbwrite() {
			var loginId = '${sessionScope.loginMember}';
			if (loginId.length==0)
				alert('로그인이 필요합니다');
			else
				location.href="sbwritepage";
		}
		
		function home() {
			location.href="./";
		}
		
		function citycheck() {
			var add = document.getElementById('city').value;
			if (add=="total")
				location.href="sblist";
			else
				location.href="citycheck?add="+add;
		}
	</script>

</head>
<body>
	<h2>용품 게시판</h2>
	
	지역:
    <select name="city" id="city" onChange="citycheck()">
        <option value="" selected>--선택--</option>
        <option value="total">전체</option>
        <option value="서울">서울</option>
        <option value="인천">인천</option>
        <option value="부산">부산</option>
        <option value="제주">제주</option>
    </select> <br><br>
			
	<table>
		<c:forEach var="sboard" items="${sbList}">
		
			<tr>
				<td align = "center" width = "160" height = "160"> <img src="resources/upload/${sboard.sbfilename}" width="100" height = "100"> </td>
				<td width = "500">
					<p> <a href="sbview?sbnumber=${sboard.sbnumber}"> <b> ${sboard.sbtitle}</b> </a> </p>
					<p> ${sboard.sbaddress} </p>
					<p> ${sboard.sbprice} </p>
					<p align="right"> ☆ ${sboard.sbhits} ♡ ${sboard.sblikes} </p>									
				</td>
			</tr>
		
		</c:forEach>
		
		<tr>
			<td colspan="2" align="center">
				<c:choose>
					<c:when test="${paging.page<=1}">
						[이전]&nbsp;
					</c:when>
					<c:otherwise>
						<a href="sblist?page=${paging.page-1}">[이전]</a>&nbsp;
					</c:otherwise>
				</c:choose>
	
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
					<c:choose>
						<c:when test="${i eq paging.page}">
							${i}
						</c:when>
						<c:otherwise>
							<a href="sblist?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${paging.page>=paging.maxPage}">
						[다음]
					</c:when>
					<c:otherwise>
						<a href="sblist?page=${paging.page+1}">[다음]</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		
	</table>	
	<br>
	<button onclick="sbwrite()">글쓰기</button>
	<button onclick="home()">돌아가기</button>
</body>
</html>