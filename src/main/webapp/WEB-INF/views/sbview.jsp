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
			border: 0px solid black;
			border-collapse: collapse;
	}
</style>

<script>

	function updatefn(sbnumber){
		location.href="sbupdate?sbnumber="+sbnumber;
	}

	function deletefn(sbnumber){
		var dconfirm = confirm('삭제 하시겠습니까?');
		if (dconfirm) {
			alert('삭제 되었습니다.');
			location.href="sbdelete?sbnumber="+sbnumber;
		} else {
			alert('취소 되었습니다.');
		}
	}
	
	function likefn(sbnumber){
		alert('좋아요 눌러주셔서 감사합니다.');
		location.href="sblike?sbnumber="+sbnumber;
	}
	
</script>

</head>
<body>
	<h2>sbview.jsp</h2>
	글번호 : ${sbView.sbnumber} <br>
	작성자 : ${sbView.sbwriter} <br>
	가격 : ${sbView.sbprice} <br>
	지역 : ${sbView.sbaddress} <br>
	글제목 : ${sbView.sbtitle} <br>
	내용 : <textarea rows=5>${sbView.sbcontents}</textarea> <br>
	작성일자 : ${sbView.sbdate} <br>
	조회수 : ${sbView.sbhits} <br>
	좋아요 : ${sbView.sblikes} <br>
	<!-- 첨부파일 : ${rbView.rbfilename} <br> -->
	이미지 : <img src="resources/upload/${sbView.sbfilename}" height="100"> <br>
	<c:choose>
		<c:when test="${empty sessionScope.loginMember}">
		</c:when>
		<c:when test="${sessionScope.loginMember eq sbView.sbwriter}">
			<button onclick="updatefn('${sbView.sbnumber}')">수정</button>
			<button onclick="deletefn('${sbView.sbnumber}')">삭제</button>
		</c:when>
		<c:when test="${sessionScope.loginMember eq 'admin'}">
			<button onclick="deletefn('${sbView.sbnumber}')">삭제</button>
		</c:when>
		<c:otherwise>
			<button onclick="likefn('${sbView.sbnumber}')">좋아요</button>
		</c:otherwise>
	</c:choose>
	
	<br>
	<br>
	
	<a href="sblist">목록으로 돌아가기</a>
</body>
</html>