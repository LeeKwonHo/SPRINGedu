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
		<h1></h1>
	</div>

	<div>
		<a href="<c:url value="/"></c:url>">Home</a>
	</div>

	<div>
		<form id="upDateForm" action="<c:url value="/board/free/update"/>" method="post">
			<input type="hidden" name="seq" value="<c:out value="${free.seq }" />">
			<ul>
				<li>
					No.
					<c:out value="${free.seq }" />
				</li>
				<li>
					제목:
					<input type="text" name="title" value="<c:out value="${free.title }"/>">
				</li>
				<li>
					내용:===============================
					<br>
					<pre><textarea name="content"><c:out value="${free.content }" /></textarea></pre>
					==================================
				</li>
				<li>
					작성자:
					<c:out value="${free.writer }" />
				</li>
				<li>
					작성일시:
					<c:out value="${free.write_date }" />
				</li>
				<li>
					추천:
					<c:out value="${free.rec_cnt }" />
					|| 비추천:
					<c:out value="${free.nrec_cnt }" />
				</li>
			</ul>
		</form>
	</div>

	<div>

		<input type="button" id="upDateBTN" value="수정하기">

	</div>

	<script type="text/javascript">
		document.getElementById('upDateBTN').addEventListener('click',
				function() {
					if (confirm('수정?')) {
						document.getElementById('upDateForm').submit();
					}
				});
	</script>

</body>
</html>