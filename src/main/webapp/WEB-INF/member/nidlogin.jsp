<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
    <!-- google signin api -->
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('87ba928e25c8fcc2c9de8e5b9ed0814f');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
        
    </script>
</head>
<body>
<div class="login_container">
	<div class="login_wrapper">
		<form action="loginmethod" method="post">
			<div class="login_symbol_background">
				<img src="${root}/image/covid_symbol.png" >
			</div>
			<div class="login_input1">
				<input type="text" name="mid" class="login_id" required />
				<div class="underline"></div>
				<label><span class="glyphicon glyphicon-user"></span>  ID</label>
			</div>
			<div class="login_input1">
				<input type="password" name="mpw" class="login_id" style="font-family:serif;" required />
				<div class="underline"></div>
				<label><span class="glyphicon glyphicon-lock"></span>  Password</label>
			</div>
			<p style="color:red; margin-top:-10px;margin-bottom:10px;text-align: center;">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</p>
			<div class="find_informaion">
				<p id="findid_btn">아이디 찾기</p>&nbsp;/&nbsp;<p id="findpw_btn">비밀번호 찾기</p>
			</div>
			<div class="login_btns">
				<button type="submit" class="login_btn">L O G  I N</button><br>
				<button type="button" class="login_btn signup_btn" onclick="location.href='signup'">S I G N  U P</button>
			</div>
			
			
			<!-- 카카오 자바 사용 스크립트 -->
			<a href="javascript:loginWithKakao()"><img src="${root}/image/kakao_login.png" style="width:350px; height:55px;margin-top:10px;" class="kakaologin_btn" alt="카카오 로그인 이미지"></a>
			
			<!-- 구글 -->
			<div id="google_login" class="circle google" onclick="init();"><img alt="구글 로그인 이미지" src="${root}/image/google_login.png" style="width:350px; height:55px;margin-top:10px;cursor:pointer" class="googlelogin_btn"></div>
			<%-- <a href="init();"><img alt="구글 로그인 이미지" src="${root}/image/google_login.png" class="googlelogin_btn"></a> --%>
			
			
			
		</form>
	</div>
</div>

<!-- 아이디 찾기 모달 -->
<div class="modal fade" id='findMemberId' role="dialog">
	<div class="modal-dialog">

		<div class="modal-content" style="z-index: 11;">
			<div class="modal-header">
		    	<button type="button" class="close" data-dismiss="modal">&times;</button>
		    	<h4 class="modal-title">가입하신 이메일을 입력해주세요.</h4>
			</div>
			<form id="findidajax" method="post">
			  	<div class="modal-body" style="display:flex; justify-content: center; align-items: center;">
					<label class="signup_input">
						<input type="email" name="memail" class="memail" required>
						<span class="signup_input_sp"> <span class="glyphicon glyphicon-mail"></span> Email</span>
					</label>
			  	</div>
			  	<div id="answer_id">
			  	</div>
			  	<div class="modal-footer">
			  		<button type="submit" class="btn btn-default">검색</button>
			    	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			  	</div>
		  	</form>
		</div>
    </div>
</div>
<!--//아이디 찾기 모달 -->
<!-- 아이디 찾기 모달 -->
<div class="modal fade" id='findMemberPw' role="dialog">
	<div class="modal-dialog">

		<div class="modal-content" style="z-index: 11;">
			<div class="modal-header">
		    	<button type="button" class="close" data-dismiss="modal">&times;</button>
		    	<h4 class="modal-title">가입하신 아이디와 이메일을 입력해주세요.</h4>
			</div>
			<form id="findpwajax" method="post">
			  	<div class="modal-body" style="display:flex; justify-content: center; align-items: center;">
					<label class="signup_input">
						<input type="email" name="memail" class="memail" required>
						<span class="signup_input_sp"> <span class="glyphicon glyphicon-mail"></span> Email</span>
					</label>
					<label class="signup_input">
						<input type="text" name="mid" class="mid" required>
						<span class="signup_input_sp"> <span class="glyphicon glyphicon-mail"></span> ID</span>
					</label>
			  	</div>
			  	<div class="modal-footer">
			  		<button type="submit" class="btn btn-default">검색</button>
			    	<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			  	</div>
		  	</form>
		</div>
    </div>
</div>
<!--//아이디 찾기 모달 -->


</body>
<script type="text/javascript">

/* 아이디찾기 */
$(document).ready(function(){
	$("#findid_btn").click(function(){
		$("#findMemberId").modal();
	});
});

$(function(){
	$('#findidajax').submit(function(e){
		e.preventDefault();
		
		var memail=$(this).find("input[name='memail']").val();
		
		
		$.ajax({
			type:"post",
			url:"${root}/member/findmid",
			dataType:"html",
			data:{
				"memail":memail
			},
			success:function(result){
				
			}
		});
	});
});


/* 패스워드 찾기 */
$(document).ready(function(){
	$("#findpw_btn").click(function(){
		$("#findMemberPw").modal();
	});
});

$(function(){
	$('#findpwajax').submit(function(e){
		e.preventDefault();
		
		var memail=$(this).find("input[name='memail']").val();
		var mid=$(this).find("input[name='mid']").val();
		
		$.ajax({
			type:"post",
			url:"${root}/member/findmpw",
			dataType:"html",
			data:{
				"memail":memail,
				"mid":mid
			},
			success:function(result){
				swal(result);
			}
		});
	});
});


/* 카카오 로그인 */
function loginWithKakao() {
    Kakao.Auth.login({
      scope:'profile,  account_email',
      success: function(authObj) {
        //console.log(authObj)
        window.Kakao.API.request({
        	url:'/v2/user/me',
        	success:res=>{
        		const kakao_account=res.kakao_account;
        		console.log(kakao_account);
        		var mnick=kakao_account.profile.nickname;
        		var memail=kakao_account.email;
        		sendPost('/member/kakaologin', {'mnick':mnick,'memail':memail})
        	}
        })
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      }
   })
}

function sendPost(action, params) {
	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', action);
	document.charset = "utf-8";
	for(var key in params) {
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', key);
		hiddenField.setAttribute('value', params[key]);
		form.appendChild(hiddenField);
	}
	document.body.appendChild(form);
	form.submit();
}



/* 구글 로그인 */
//google signin API
 var googleUser = {};
 function init() {
     gapi.load('auth2', function() {
      //console.log("init()시작");
      auth2 = gapi.auth2.init({
            client_id: '450104102175-i935bf7sldgbe7063q28h96dd4t7js0p.apps.googleusercontent.com',
            cookiepolicy: 'single_host_origin'
          });
          attachSignin(document.getElementById('google_login'));
     });
 }

 //google signin API2
 function attachSignin(element) {
     auth2.attachClickHandler(element, {},
         function(googleUser) {
        var profile = googleUser.getBasicProfile();
        var id_token = googleUser.getAuthResponse().id_token;
//           console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
//           console.log('ID토큰: ' + id_token);
//           console.log('Name: ' + profile.getName());
//           console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
          
       sendPost('/member/googlelogin', {'mnick':profile.getName(),'memail':profile.getEmail()});   
         }, 
         function(error) {
           //alert(JSON.stringify(error, undefined, 2));
         }); 
         
         
     //console.log("구글API 끝");
   }





</script>
</html>