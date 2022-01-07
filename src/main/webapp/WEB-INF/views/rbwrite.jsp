<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>rbwrite.jsp</h2>
	
	<h2>파일 첨부용 글쓰기</h2>
	<form action="rbwrite" method="post" enctype="multipart/form-data">
		작성자: <input type="text" name="rbwriter" value="${sessionScope.loginMember}" readonly><br>
		카테고리: <select name="rbcategory">
					<option value="" selected>카테고리선택</option>
					<option value="강아지">강아지</option>
					<option value="고양이">고양이</option>
					<option value="토끼">토끼</option>
				</select><br>
		지역: <select name="rbaddress">
					<option value="" selected>지역선택</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="대전">대전</option>
					<option value="부산">부산</option>
					<option value="제주">제주</option>
				</select><br>
		글제목: <input type="text" name="rbtitle"><br>
		내용: <textarea name="rbcontents" rows="5"></textarea><br>
		파일: <input type="file" name="rbfile"><br>
		<input type="submit" value="글작성">
	</form>
	
	<br>
	<a href="rblist">홈으로</a>
</body>
</html>