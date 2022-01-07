<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function idcheck() {
		var inputId = document.getElementById('mid').value;
		var idCheckResult = document.getElementById('idcheckresult');
		var idExp = /^[a-z\d]{6,12}$/; 
		
		if(inputId.length==0) {
			idCheckResult.style.color = 'red';
			idCheckResult.innerHTML = '아이디를 입력 하세요.';
		} else if (inputId.match(idExp)) {
			$.ajax({
				type: 'post',
				url: 'idcheck',
				data: {'mid': inputId},
				dataType: 'text',
				success: function(idck){ 
					if(idck=='ok'){
						idCheckResult.style.color = 'green';
						idCheckResult.innerHTML = '사용가능한 아이디입니다.';
					} else {
						idCheckResult.style.color = 'red';
						idCheckResult.innerHTML = '이미 사용중인 아이디입니다.';
					}
				},
				error: function(){ 
					console.log('제대로 안돌고 있음.');
				}
			});
		} else {
			idCheckResult.style.color = 'red';
			idCheckResult.innerHTML = '아이디는 6~12 자리 영어소문자, 숫자만 가능합니다.';
		}
	}
	
	function pwdcheck() {
		var inputPwd = document.getElementById('mpassword').value;
		var pwdCheckResult = document.getElementById('pwdcheckresult');
		var pwdExp = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()-])[a-z\d!@#$%^&*()-]{8,16}$/;
		
		if(inputPwd.length==0){
	        pwdCheckResult.style.color = 'red';
	        pwdCheckResult.innerHTML = '비밀번호를 입력하세요.';
	    } else if(inputPwd.match(pwdExp)) {
	    	pwdCheckResult.style.color = 'green';
	    	pwdCheckResult.innerHTML = '사용 가능한 비밀번호 입니다.';
	    } else {
	    	pwdCheckResult.style.color = 'red';
	    	pwdCheckResult.innerHTML = '비밀번호는 8~16자리, 영어소문자, 특수문자, 숫자 포함입니다.';
	    }
	}
	
	function namecheck() {
	    var name = document.getElementById('mname').value;
	    var result = document.getElementById('namecheckresult');
	    if(name.length==0){
	        result.style.color = 'red';
	        result.innerHTML = '필수입력입니다.';
	    } else {
	        result.innerHTML = '';
	    }
	}
	
	function phonecheck() {
	    var exp = /^\d{3}-\d{4}-\d{4}$/;
	    var phone = document.getElementById('mphone').value;
	    var result = document.getElementById('phonecheckresult');
	    if(phone.match(exp)){
	        result.style.color = 'green';
	        result.innerHTML = '유효한 형식입니다.';
	    } else {
	        result.style.color = 'red';
	        result.innerHTML = '유효하지 않은 전화번호 형식입니다.';
	    }        
	}
	
</script>

</head>
<body>
	<h2>memberjoin.jsp</h2>
	<form action="memberjoin" method="post">
		
		아이디: <input type="text" name="mid" id="mid" onkeyup="idcheck()"><br>
					<span id="idcheckresult"></span><br>
		비밀번호: <input type="text" name="mpassword" id="mpassword" onblur="pwdcheck()"><br>
					<span id="pwdcheckresult"></span><br>
		이름: <input type="text" name="mname" id="mname" onblur="namecheck()"><br>
					<span id="namecheckresult"></span><br>
		전화번호: <input type="text" name="mphone" id="mphone" onblur="phonecheck()"><br>
					<span id="phonecheckresult"></span><br>
		이메일: <input type="text" name="memail"><br>
		주소: <input type="text" name="maddress"><br>
		
		<input type="submit" value="가입">
	</form>
</body>
</html>