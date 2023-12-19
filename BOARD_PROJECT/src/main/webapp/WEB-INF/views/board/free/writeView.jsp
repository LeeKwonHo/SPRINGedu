<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
</head>
<body>
	<div>
		<h1>게시글 등록</h1>
	</div>
	<div>
		<a href="<c:url value="/"></c:url>">Home</a>
	</div>
	<div>
		<form id="titleForm" method="post" action='<c:url value="/board/free/write"></c:url>' enctype="multipart/form-data">
			<input type="text" name="title" placeholder="제목">
			<br>
			<input type="file" name="file">
			<br>
			<textarea name="content"></textarea>
			<br>
			<input type="button" id="writeBTN" value="작성">
			<br>
		</form>
	</div>

	<script type="text/javascript">
		document.getElementById('writeBTN').addEventListener('click',
				function() {
					document.getElementById('titleForm').submit();
				});
	</script>

</body>
</html>