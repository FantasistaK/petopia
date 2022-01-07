<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>memberview.jsp</h2>
	아이디 : ${memberView.mid} <br>
	비밀번호 : ${memberView.mpassword} <br>
	이름 : ${memberView.mname} <br>
	전화번호 : ${memberView.mphone} <br>
	이메일 : ${memberView.memail} <br>
	주소 : ${memberView.maddress} <br>
	<a href = "memberlist">목록으로 돌아가기</a>
</body>
</html>