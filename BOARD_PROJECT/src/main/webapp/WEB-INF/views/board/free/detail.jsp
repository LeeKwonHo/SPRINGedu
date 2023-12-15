<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<script src='<c:url value = "/cdn/js/jquery-3.7.1.min.js" />'></script>
</head>
<body>

	<div>
		<ul>
			<li>
				No.
				<c:out value="${free.seq }" />
			</li>
			<li>
				제목:
				<c:out value="${free.title }" />
			</li>
			<li>
				내용:===============================
				<br>
				<pre><c:out value="${free.content }" escapeXml="false" /></pre>

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
	</div>

	<div>
		<span> <img id="recBTN" src='<c:url value="/cdn/images/rec_cnt.jpg"></c:url>' style="width: 100px; height: 100px;"> 
		<span id="rec_cnt_Result"><c:out value="${free.rec_cnt }" /></span>
		</span>
	</div>

	<div>

		<input type="button" id="upDateBTN" value="수정">
		<input type="button" id="deleteBTN" value="삭제">

	</div>

	<div>
		<input style="width: 70%" type="text" id="repCont" placeholder="댓글 입력하기">
		<input type="button" id="repcontentwritetBTN" value="작성">
	</div>

	<div>
		<ul id="replyArea">
			<li>댓글 목록</li>
		</ul>
	</div>


	<form id="deleteForm" action="<c:url value="/board/free/delete?seq=${free.seq }"/>" method="post">
		<input type="hidden" id="seq" name="seq">
	</form>

	<script type="text/javascript">
		document
				.getElementById('upDateBTN')
				.addEventListener(
						'click',
						function() {
							location.href = '<c:url value="/board/free/updateView?seq=${free.seq }"/>';
						});

		document
				.getElementById('deleteBTN')
				.addEventListener(
						'click',
						function() {
							if (confirm('삭제?')) {
								document.getElementById('seq').value = '<c:out value="${free.seq }"/>';
								document.getElementById('deleteForm').submit();
							}
						});

		document.getElementById('recBTN').addEventListener('click', function() {

			$.ajax({
				method : "POST",
				url : "<c:url value = '/board/free/updateRec'/>",
				data : {
					seq : "<c:out value='${free.seq }'/>",
					recYN : "Y"
				}
			}).done(function(msg) {
				if (msg == 'success') {
					window.location.reload();
				} else {
					aletr('처리 실패')
				}
			});

		});
		
		document.getElementById('repcontentwritetBTN').addEventListener('click', function() {

			$.ajax({
				method : "POST",
				url : "<c:url value = '/board/free/addRep'/>",
				data : {
					f_seq : "<c:out value='${free.seq }'/>",
					content : $('#repCont').val()
				}
			}).done(function(msg) {
					
				console.log(msg);
				
				if('success' == msg.result){
					
					$('#repCont').val('');
					$('#replyArea').html('');	
					
					var replyhtml
					
					$.each(msg.data, function(i, reply) {
						
						replyhtml += '<li>' + reply.content + ' (' + reply.write_date + ')</li>' 
						
					});
					
					$('#replyArea').append(replyhtml);	
					
					}else{
						
						alert("TTTTTTTTTT");
						
					}
				
			});

		});
		
		
		
		
	</script>

</body>
</html>