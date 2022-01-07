<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>sbwrite.jsp</h2>
	
	<form action="sbwrite" method="post" enctype="multipart/form-data">
		작성자: <input type="text" name="sbwriter" value="${sessionScope.loginMember}" readonly><br>
		지역: <select name="sbaddress">
					<option value="" selected>지역선택</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="대전">대전</option>
					<option value="부산">부산</option>
					<option value="제주">제주</option>
				</select><br>
		글제목: <input type="text" name="sbtitle"><br>
		가격: <input type="text" name="sbprice"><br>
		내용: <textarea name="sbcontents" rows="5"></textarea><br>
		파일: <input type="file" name="sbfile"><br>
		<input type="submit" value="글작성">
	</form>
	
	<br>
	<a href="sblist">홈으로</a>
</body>
</html>