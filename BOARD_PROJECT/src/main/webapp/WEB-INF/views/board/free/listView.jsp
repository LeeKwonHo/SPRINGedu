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
		<h1>자유 게시판 글 목록</h1>
		상세보기) 글 제목 클릭
	</div>

	<div>
		<ul>
			<c:forEach var="free" items="${list }">
				<li>
					<c:out value="${free.seq }"></c:out>
					| <a href='<c:url value="/board/free/detail?seq=${free.seq }"></c:url>'> 
					<c:out value="${free.title }"></c:out>
					</a> |
					<c:out value="${free.writer }"></c:out>
					|
					<c:out value="${free.write_date }"></c:out>
				</li>
			</c:forEach>
		</ul>
	</div>

</body>
</html>