$(document).ready(function(){
    if( '' != $.cookie("MAIL") ) {
        $("#mail").val($.cookie("MAIL"));
    }
    $('#frm1').ajaxForm({
        dataType : 'text', 
        beforeSerialize: function(){
             // form을 직렬화하기전 엘레먼트의 속성을 수정할 수도 있다.            
        },
        beforeSubmit : function() {
        	openAjaxLayer();
        	
        //action에 걸어주었던 링크로 가기전에 실행 ex)로딩중 표시를 넣을수도 있다.
        },
        success : function(data) {
        	$('.ajaxLayer').hide();
             //컨트롤러 실행 후 성공시 넘어옴
            alert(data);            
        }
    });
});

function doCanvas(){
	/*
	html2canvas($("#chat"), {
		cavas : $("canvas")
		,onrendered : function(canvas) {
			var image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");  // here is the most important part because if you dont replace you will get a DOM 18 exception.
			$.ajax({
				type : "post",
				url : "/canvas",
				data : {
					image : image
				},
			}).done(function(msg) {
				alert(msg); 
			});
		}
	});
	*/
	html2canvas($("#ftrm"), {
		cavas : $("canvas")
		,onrendered : function(canvas) {
			var image = canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");
			var a = document.createElement('a');
			a.href = image;
			a.download = 'html2canvas.png';
			a.click();
		}
	});
}

function doAjax() {
	openAjaxLayer();
	var message = $('#message').val();
	$.ajax({
		type : "POST",
		url : "/ajax",
		data : {
			message : message
		},
		dataType : "json"
	//contentType: "application/json; charset=utf-8"
	}).done(function(msg) {
		$('.ajaxLayer').hide();
		//alert(msg.message);
		//var html = '<div>'+msg.message+'</div>';
		$('#test_Div').html(msg.message);
	});
}

function doRSA() {
	var userID = $('#userID').val();
	var userPW = $('#userPW').val();
	if( '' == userID || '' == userPW ){
		alert('아이디와 패스워드를 입력해주세요.');
		return false;
	}
	var rsaPublicKeyModulus = $('#rsaPublicKeyModulus').val();
	var rsaPublicKeyExponent = $('#rsaPublicKeyExponent').val();
	var rsa = new RSAKey();
	rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
	rsa.encrypt(userPW);
	var encPassword = rsa.encrypt(userPW);
	alert(encPassword);
	$('#encPw').val(encPassword);
	$('#frm2').submit();
}

function openAjaxLayer() {
	var ajaxLayer = $('.ajaxLayerImg');
	$('.ajaxLayer').show();
	if (ajaxLayer.outerHeight() < $(document).height())
		ajaxLayer.css('margin-top', '-' + ajaxLayer.outerHeight() / 2
				+ 'px');
	else
		ajaxLayer.css('top', '0px');
	if (ajaxLayer.outerWidth() < $(document).width())
		ajaxLayer.css('margin-left', '-' + ajaxLayer.outerWidth() / 2
				+ 'px');
	else
		ajaxLayer.css('left', '0px');
	return false;
}

function sendMail() {
	openAjaxLayer();
	var mail = $('#mail').val();
	$.cookie("MAIL", $("#mail").val(), { expires: 30 });
	$.ajax({
		type : "post",
		url : "/mail",
		data : {
			mail : mail
		},
		dataType : "json"
	//contentType: "application/json; charset=utf-8"
	}).done(function(msg) {
		$('.ajaxLayer').hide();
		if ( 'Y' == msg.isSuccess ) {
			alert('메일이 정상적으로 발송되었습니다.');
		} else {
			alert('시스템 에러가 발생했습니다.');
		}
	});
}

/* 	$(function(){
		var name = $('#userName');
		var greeting = $('#greeting');
		name.keyup(function(){
			greeting.text('Hello ' + name.val() + '!');
		});
	}) */

var app = angular.module('myApp', []);
app.controller('UserSearchController', function($scope, $http) {
    $scope.myFunc = function() {
    	var name = $scope.searchKeyword;
		if ('' != name) {
	    	$http.get('/member/jsonList?name='+$scope.searchKeyword).success(
    			function(data){
    				$scope.members = data;
    			}
    		);
		}else{
			$scope.members = '';
		}
    }
});

function enterChat(){
	var nick = $.trim($('#nick').val());			
	if( 0 == nick.length ) {
		alert('대화명을 입력해주세요.');
		$('#nick').focus();
		return false;
	}
	document.location.href = '/enterChat?nick=' + nick;
}