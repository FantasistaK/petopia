<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	
	function update() {
		location.href="memberupdate";
	}
	
	function home() {
		location.href="./";
	}
	
</script>

</head>
<body>
	<h2>mypage.jsp</h2>
	<h4>${sessionScope.loginMember}회원 님의 마이페이지 입니다.</h4>
	<button onclick="update()">회원정보수정</button> <br><br>
	
	<button onclick="home()">돌아가기</button> <br>
</body>
</html>