<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<link rel="stylesheet" href='<c:url value="/cdn/css/jquery-ui.min.css"></c:url>'>
<script src='<c:url value = "/cdn/js/jquery-3.7.1.min.js" />'></script>
<script src='<c:url value = "/cdn/js/jquery-ui.min.js" />'></script>

<title>자유 게시판</title>


</head>
<body>
	<div>
		<h1>자유 게시판 글 목록</h1>
		상세보기) 글 제목 클릭
	</div>
	<div>
		<a href="<c:url value="/"></c:url>">Home</a>
	</div>

	<div>
		<input type="text" id="fCalendar" style="width: 100px;" value="<c:out value='${rp.fWrite }'></c:out>">
		~
		<input type="text" id="tCalendar" style="width: 100px;" value="<c:out value='${rp.tWrite }'></c:out>">
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
				<span class="spanPage" style="margin: 10px; font-weight: bold; cursor: pointer;" data-page="${page }"> [${page }] </span>&nbsp;				
			</c:if>

			<c:if test="${rp.page != page}">
				<span class="spanPage" style="margin: 10px; cursor: pointer;" data-page="${page }"> [${page }] </span>&nbsp;				
			</c:if>

		</c:forEach>
	</div>

	<form id="frm1" action='<c:url value = "/board/free/listView"></c:url>' method="post">
		<input type="hidden" name="page" id="page">
		<input type="hidden" name="title" id="title">
		<input type="hidden" name="fWrite" id="fWrite">
		<input type="hidden" name="tWrite" id="tWrite">
	</form>


	<script>
		$('.spanPage').on('click', function() {
			$('#page').val($(this).data('page'));
			$('#title').val($('#titleSearch').val());
			$('#frm1').submit();
		});

		$('#searchBTN').on('click', function() {
			$('#title').val($('#titleSearch').val());
			$('#fWrite').val($('#fCalendar').val());
			$('#tWrite').val($('#tCalendar').val());
			$('#frm1').submit();
		});
	</script>

	<script>
		$(function() {
			//input을 datepicker로 선언
			$("#fCalendar")
					.datepicker(
							{
								dateFormat : 'yymmdd' //달력 날짜 형태
								,
								showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
								,
								showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
								,
								changeYear : true //option값 년 선택 가능
								,
								changeMonth : true //option값  월 선택 가능                
								,
								showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
								,
								buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
								,
								buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
								,
								buttonText : "선택" //버튼 호버 텍스트              
								,
								yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
								,
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월', '10월',
										'11월', '12월' ] //달력의 월 부분 텍스트
								,
								monthNames : [ '1월', '2월', '3월', '4월', '5월',
										'6월', '7월', '8월', '9월', '10월', '11월',
										'12월' ] //달력의 월 부분 Tooltip
								,
								dayNamesMin : [ '일', '월', '화', '수', '목', '금',
										'토' ] //달력의 요일 텍스트
								,
								dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
										'금요일', '토요일' ] //달력의 요일 Tooltip
								,
								minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
								,
								maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
							});

			//초기값을 오늘 날짜로 설정해줘야 합니다.
			$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
		});

		$(function() {
			//input을 datepicker로 선언
			$("#tCalendar")
					.datepicker(
							{
								dateFormat : 'yymmdd' //달력 날짜 형태
								,
								showOtherMonths : true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
								,
								showMonthAfterYear : true // 월- 년 순서가아닌 년도 - 월 순서
								,
								changeYear : true //option값 년 선택 가능
								,
								changeMonth : true //option값  월 선택 가능                
								,
								showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
								,
								buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
								,
								buttonImageOnly : true //버튼 이미지만 깔끔하게 보이게함
								,
								buttonText : "선택" //버튼 호버 텍스트              
								,
								yearSuffix : "년" //달력의 년도 부분 뒤 텍스트
								,
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월', '10월',
										'11월', '12월' ] //달력의 월 부분 텍스트
								,
								monthNames : [ '1월', '2월', '3월', '4월', '5월',
										'6월', '7월', '8월', '9월', '10월', '11월',
										'12월' ] //달력의 월 부분 Tooltip
								,
								dayNamesMin : [ '일', '월', '화', '수', '목', '금',
										'토' ] //달력의 요일 텍스트
								,
								dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
										'금요일', '토요일' ] //달력의 요일 Tooltip
								,
								minDate : "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
								,
								maxDate : "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
							});

			//초기값을 오늘 날짜로 설정해줘야 합니다.
			$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
		});
	</script>

</body>
</html>