<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 HOME</title>
</head>
<body>
	<h1>Hello Board!</h1>

	<P>서버상 시간 ${serverTime}.</P>
	<div>
		<h2>자유 게시판</h2>
	</div>
	
	<div>
		<ul>
			<li><a href='<c:url value="/board/free/listView"></c:url>'>글 목록</a></li>
			<li><a href='<c:url value="/board/free/writeView"></c:url>'>글 작성</a></li>
		</ul>
	</div>
	
</body>
</html>
