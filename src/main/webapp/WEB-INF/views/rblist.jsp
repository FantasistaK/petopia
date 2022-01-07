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
		}
	</style>
	
	<script>
		function rbwrite() {
			var loginId = '${sessionScope.loginMember}';
			if (loginId.length==0)
				alert('로그인이 필요합니다');
			else
				location.href="rbwritepage";
		}
		
		function home() {
			location.href="./";
		}
	</script>

</head>
<body>
	<h2>분양 게시판</h2>
	
	<table>
		<tr>
			<th width="80px"> 글번호 </th>
			<th width="100px"> 카테고리 </th>
			<th width="50px"> 지역 </th>
			<th width="500px"> 글제목 </th>
			<th width="100px"> 작성자 </th>
			<th width="200px"> 작성일자 </th>
			<th width="80px"> 조회수 </th>
			<th width="80px"> 좋아요 </th>
		</tr>
		<c:forEach var="rboard" items="${rbList}">
			<tr>
				<td> ${rboard.rbnumber} </td>
				<td> ${rboard.rbcategory}</td>
				<td> ${rboard.rbaddress}</td>
				<td> <a href="rbview?rbnumber=${rboard.rbnumber}&page=${paging.page}">${rboard.rbtitle}</a> </td>
				<td> ${rboard.rbwriter} </td>
				<td> ${rboard.rbdate} </td>
				<td> ${rboard.rbhits} </td>
				<td> ${rboard.rblikes} </td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8" align="center">
				<c:choose>
					<c:when test="${paging.page<=1}">
						[이전]&nbsp;
					</c:when>
					<c:otherwise>
						<a href="rblist?page=${paging.page-1}">[이전]</a>&nbsp;
					</c:otherwise>
				</c:choose>
	
				<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
					<c:choose>
						<c:when test="${i eq paging.page}">
							${i}
						</c:when>
						<c:otherwise>
							<a href="rblist?page=${i}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:choose>
					<c:when test="${paging.page>=paging.maxPage}">
						[다음]
					</c:when>
					<c:otherwise>
						<a href="rblist?page=${paging.page+1}">[다음]</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	<br>
	<button onclick="rbwrite()">글쓰기</button>
	<button onclick="home()">돌아가기</button>


</body>
</html>