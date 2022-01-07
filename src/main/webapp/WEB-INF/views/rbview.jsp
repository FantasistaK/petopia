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

	function updatefn(rbnumber){
		location.href="rbupdate?rbnumber="+rbnumber;
	}

	function deletefn(rbnumber){
		var dconfirm = confirm('삭제 하시겠습니까?');
		if (dconfirm) {
			alert('삭제 되었습니다.');
			location.href="rbdelete?rbnumber="+rbnumber;
		} else {
			alert('취소 되었습니다.');
		}
	}
	
</script>

</head>
<body>
	<h2>rbview.jsp</h2>
	글번호 : ${rbView.rbnumber} <br>
	작성자 : ${rbView.rbwriter} <br>
	카테고리 : ${rbView.rbcategory} <br>
	지역 : ${rbView.rbaddress} <br>
	글제목 : ${rbView.rbtitle} <br>
	내용 : <textarea rows=5>${rbView.rbcontents}</textarea> <br>
	작성일자 : ${rbView.rbdate} <br>
	조회수 : ${rbView.rbhits} <br>
	<!-- 첨부파일 : ${rbView.rbfilename} <br> -->
	이미지 : <img src="resources/upload/${rbView.rbfilename}" height="100"> <br>
	<c:choose>
		<c:when test="${sessionScope.loginMember eq rbView.rbwriter}">
			<button onclick="updatefn('${rbView.rbnumber}')">수정</button>
			<button onclick="deletefn('${rbView.rbnumber}')">삭제</button>
		</c:when>
		<c:when test="${sessionScope.loginMember eq 'admin'}">
			<button onclick="deletefn('${rbView.rbnumber}')">삭제</button>
		</c:when>
	</c:choose>
	<br>
	<br>
	
	<a href="rblist?page=${page}">목록으로 돌아가기</a>
</body>
</html>