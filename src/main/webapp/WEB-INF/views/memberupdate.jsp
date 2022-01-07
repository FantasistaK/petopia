<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function updatefn() {
		var pwdConfirm = document.getElementById('pwd').value;  
		var pwd = '${member.mpassword}';
		if (pwd == pwdConfirm){
			updateform.submit();
		} else {
			alert('비밀번호가 틀립니다!!');
		}
		
	}
</script>

</head>
<body>
	<h2>memberupdate.jsp</h2>
	
	<form action="memberupdateprocess" method="post" name="updateform">
		아이디: <input type="text" name="mid" value="${member.mid}" readonly><br>
		비밀번호: <input type="text" name="mpassword" id="pwd"><br>
		이름: <input type="text" name="mname" value="${member.mname}" readonly><br>
		전화번호: <input type="text" name="mphone" value="${member.mphone}"><br>
		이메일: <input type="text" name="memail" value="${member.memail}"><br>
		주소: <input type="text" name="maddress" value="${member.maddress}"><br>
				
		<input type="button" value="수정" onclick="updatefn()">
	</form>
	
</body>
</html>