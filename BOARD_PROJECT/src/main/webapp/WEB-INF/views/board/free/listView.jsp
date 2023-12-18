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
		<input style="width: 30%" type="text" id="titleSearch" placeholder="제목으로 검색" value="<c:out value='${rp.title }'></c:out>">
		<input type="button" id="searchBTN" value="검색">
	</div>

	<div>
		<ul>
			<c:forEach var="free" items="${list }">
				<li>
					<c:out value="${free.seq }"></c:out>
					|

					<a href='<c:url value="/board/free/detail?seq=${free.seq }"></c:url>'>
						<c:out value="${free.title }"></c:out>
					</a>
					|

					<c:out value="${free.writer }"></c:out>
					|
					<c:out value="${free.write_date }"></c:out>
				</li>
			</c:forEach>
		</ul>
	</div>

	<div style="text-align: center;">
		<c:forEach var="page" begin="1" end="${totalpage }">

			<c:if test="${rp.page  == page}">
				<span class="spanPage" style="margin: 10px; font-weight: bold;  cursor: pointer;" data-page="${page }"> [${page }] </span>&nbsp;				
			</c:if>

			<c:if test="${rp.page != page}">
				<span class="spanPage" style="margin: 10px;  cursor: pointer;" data-page="${page }"> [${page }] </span>&nbsp;				
			</c:if>
			
		</c:forEach>
	</div>

	<form id="frm1" action='<c:url value = "/board/free/listView"></c:url>' method="post">
		<input type="hidden" name="page" id="page">
		<input type="hidden" name="title" id="title">
		<input type="hidden" name="fWrite" id="fWrite">
		<input type="hidden" name="tWrite" id="tWrite">
	</form>

	<script src='<c:url value = "/cdn/js/jquery-3.7.1.min.js" />'></script>

	<script>
		$('.spanPage').on('click', function() {
			$('#page').val($(this).data('page'));
			$('#title').val($('#titleSearch').val());
			$('#frm1').submit();
		});

		$('#searchBTN').on('click', function() {
			$('#title').val($('#titleSearch').val());
			$('#frm1').submit();
		});
	</script>

</body>
</html>