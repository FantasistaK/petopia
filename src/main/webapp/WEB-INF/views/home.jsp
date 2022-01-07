<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Home</title>
	
	<script>
		function logout() {
			location.href="logout";
		}
		
		function mypage() {
			location.href="mypage";
		}
		
		function memberlist() {
			location.href="memberlist";
		}
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

	
	
	<c:choose>
		<c:when test="${sessionScope.loginMember eq null }">
			<a href="joinpage">회원가입</a><br>
			<a href="loginpage">로그인</a><br>
		</c:when>
		<c:when test="${sessionScope.loginMember eq 'admin'}">
			<h2> 관리자페이지 </h2>
			<button onclick="memberlist()">회원정보목록</button> <br>
			<button onclick="logout()">로그아웃</button> <br>
		</c:when>
		<c:otherwise>
			<h4>${sessionScope.loginMember} 님 반갑습니다!!</h4>
			<button onclick="mypage()">마이페이지</button> <br>
			<button onclick="logout()">로그아웃</button> <br>
		</c:otherwise>
	</c:choose>
	<br>
	<br>
	<a href="rblist">분양게시판</a><br>
	<a href="sblist">용품게시판</a><br>
	

</body>
</html>
