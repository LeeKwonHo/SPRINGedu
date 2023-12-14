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
		<ul>
			<li>No. <c:out value="${free.seq }"></c:out>
			</li>
			<li>제목: <c:out value="${free.title }"></c:out>
			</li>
			<li>내용:=============================== <br> <pre>
					<c:out value="${free.content }" escapeXml="false"></c:out>
				</pre> ==================================
			</li>
			<li>작성자: <c:out value="${free.writer }"></c:out>
			</li>
			<li>작성일시: <c:out value="${free.write_date }"></c:out>
			</li>
			<li>추천: <c:out value="${free.rec_cnt }"></c:out> || 비추천: <c:out value="${free.nrec_cnt }"></c:out>
			</li>
		</ul>
	</div>
	<div>
		<input type="button" id="upDateBTN" value="수정">
		<input type="button" id="deleteBTN" value="삭제">
	</div>
	<script type="text/javascript">
		document.getElementById('upDateBTN').addEventListener('click',
				function() {
				});

		document
				.getElementById('deleteBTN')
				.addEventListener(
						'click',
						function() {
							if (confirm('삭제?')) {
								location.href = '<c:url value="/board/free/delete?seq=${free.seq }"/>';
							}
						});
	</script>

</body>
</html>