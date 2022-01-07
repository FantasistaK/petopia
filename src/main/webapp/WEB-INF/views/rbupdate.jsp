<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function updatefn() {
		
		var dconfirm = confirm('수정 하시겠습니까?');
		if (dconfirm) {
			alert('수정 되었습니다.');
			updateform.submit();
		} else {
			alert('취소 되었습니다.');
		}
		
	}
	
	function canclefn(rbnumber) {
		location.href="rbview?rbnumber="+rbnumber;
	}
	
</script>

</head>
<body>
	<h2>rbupdate.jsp</h2>
	
	<form action="rbupdateprocess" method="post" name="updateform">
		글번호: <input type="text" name="rbnumber" value="${rbUpdate.rbnumber}" readonly><br>
		작성자: <input type="text" name="rbwriter" value="${rbUpdate.rbwriter}" readonly><br>
		카테고리: <select name="rbcategory">
					<option value="${rbUpdate.rbcategory}" selected>${rbUpdate.rbcategory}</option>
					<option value="강아지">강아지</option>
					<option value="고양이">고양이</option>
					<option value="토끼">토끼</option>
				</select><br>
		지역: <select name="rbaddress">
					<option value="${rbUpdate.rbaddress}" selected>${rbUpdate.rbaddress}</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="대전">대전</option>
					<option value="부산">부산</option>
					<option value="제주">제주</option>
				</select><br>
		글제목: <input type="text" name="rbtitle" value="${rbUpdate.rbtitle}"><br>
		내용: <textarea rows="5" name="rbcontents">${rbUpdate.rbcontents}</textarea><br>
		이미지: <img src="resources/upload/${rbUpdate.rbfilename}" height="100"> <br>
		<input type="button" value="수정" onclick="updatefn()">
		<input type="button" value="돌아가기" onclick="canclefn(${rbUpdate.rbnumber})">
	</form>
</body>
</html>