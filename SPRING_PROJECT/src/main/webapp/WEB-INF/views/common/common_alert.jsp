<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="../include/header.jsp"></jsp:include>
		<script>
				$( document ).ready(function() {
					var success_flag = '${success_flag}';
					var forward_url = '${forward_url}';
					if ( 'Y' == success_flag ) {
						alert("정상적으로 처리되었습니다.");
					} else {
						alert("시스템 에러가 발생되었습니다.");
					}
					document.location.href = forward_url;
				});
		</script>
	</head>
	<body>
	</body>
</html>
