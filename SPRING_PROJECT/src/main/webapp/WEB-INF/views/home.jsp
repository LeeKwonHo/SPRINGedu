<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="./include/header.jsp"></jsp:include>
		<style>
		canvas {
            border: 1px solid black;
        }
		</style>
	</head>
	<body>
		<h1>Hello world11!${pageContext.request.contextPath}</h1>
		<div id="ftrm" class="fotorama" data-autoplay="1500">
			<c:forEach var="i" begin="1" end="6">
				<img src="${webappRoot}/resources/images/gallery/image_${i }.jpg">
			</c:forEach>
		</div>
		<div class="ajaxLayer">
			<div class="ajaxLayer-bg"></div>
			<div class="ajaxLayerImg">
				<img src="/resources/images/ajax-loader.gif" width="128" height="128" />
			</div>
		</div>
		<a href="/member/list">회원관리</a><br>
		<br>
		<div>
			<input type="text" id="nick" placeholder="대화명"/>
			<input type="button" value="채팅방 입장" onclick="enterChat();"/>
		</div>
		<br>
		<P>The time on the server is ${fn:substring(serverTime,0,12)}</P>
		<br>
		<c:if test="${!empty originalFileName}">
			<P>OriginalFileName is ${originalFileName}.</P>
			<img src="/resources/upload/${originalFileName}" />
		</c:if>
		<form id="frm1" action="/upload" method="post" enctype="multipart/form-data">
			<input type="file" name="file" />
			<br>
			<input type="file" name="file" />
			<br>
			<input type="submit"/>
		</form>
		<br>
		<canvas style="display:none"></canvas>
		<br>
		<input type="button" value="html2canvas" onclick="doCanvas();"/>
		<br>
		<a href="/download">파이썬 교재 다운받기</a>
		<br><br>
		<input type="text" name="message" id="message" />
		<input type="button" onclick="doAjax()" value="AJAX" />
		<br>
		<div id="test_Div"></div>
		<br>
		<input type="text" name="mail" id="mail" />
		<input type="button" onclick="sendMail()" value="Mail" />
		<br>
		<br>
		패스워드 : ${decPW }
		<br>
		<form id="frm2" action="/rsa" method="post">
			<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}"/>
			<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}"/>
			<input type="hidden" name="encPw" id="encPw"/>
			<input type="text" name="id" id="userID" placeholder="아이디"/>
			<br>
			<input type="text" name="pw" id="userPW" placeholder="패스워드"/>
			<br>
			<input type="button" onclick="doRSA()" value="RSA" />
		</form>
		<br>
		<div ng-app="myApp" ng-controller="UserSearchController">
			<input type="text" ng-keyup="myFunc()" ng-model="searchKeyword" placeholder="AngularJS"/>
			<!-- <h2 id="greeting">Hello {{userName}}!</h2> -->
			<ul>
				<li ng-repeat="member in members">
					아이디 : {{member.id}}<br />
					아이디 : {{member.name}}<br />
					전화번호 : {{member.phone}}<br />
					나이 : {{member.age}}
				</li>
			</ul>
		</div>
		<br>
		<textarea class="ckeditor" cols="80" id="content" name="content" rows="10">
	</textarea>
		<br>
		<input type="file" id="take-picture" accept="image/*">
		<br>
		<img style="border-radius:50%;width:200px;hegiht:200px" src="/resources/images/no_img.jpg" alt="" id="show-picture">
	</body>
</html>
