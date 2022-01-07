<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
		td {
			width: 100px;
		}
	</style>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	
	<script>
	function memberviewAjax(mid) {

		$.ajax({
			type: 'post',
			url: 'memberviewajax',
			data: {'mid': mid},
			dataType: 'json',
			success: function(result){
				
				var output = "아이디 : "+result.mid+"<br>";
				output += "비밀번호 : "+result.mpassword+"<br>";
				output += "이름 : "+result.mname+"<br>";
				output += "전화번호 : "+result.mphone+"<br>";
				output += "이메일 : "+result.memail+"<br>";
				
				document.getElementById('memberviewdiv').innerHTML = output;
				
			},
			error: function(){
				console.log('문제발생');
			}
		});
	}
	</script>
	
	<script>
		function deletefn(id){
			location.href="memberdelete?mid="+id;
		}
	</script>
	
</head>
<body>
	
	<h2> 회원 목록 조회 </h2>
	<table>
		<tr>
			<th> 아이디 </th>
			<th> 삭제 </th>
			<th> 상세조회(ajax) </th>
		</tr>
		<c:forEach var="member" items="${memberList}">
			<tr>
				<td> <a href="memberview?mid=${member.mid}">${member.mid}</a> </td>
				<td align = "center"> <button onclick="deletefn('${member.mid}')">삭제</button>
				<td align = "center"> <button onclick="memberviewAjax('${member.mid}')">조회(ajax)</button>
			</tr>
		</c:forEach>
	</table>
	<br>

	<div id="memberviewdiv"></div>
	
	<br>
	<a href="./">메인으로 돌아가기</a>
</body>
</html>