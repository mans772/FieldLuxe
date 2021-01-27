<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
  <title>login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<style type="text/css">
	
	.loginPage {
		width:800px;
		margin:50px auto;
		text-align:center;
		font-family:Malgun Gothic;
	}
	.loginID{
		width:35%;
		height:40px;
	}
@media screen and (max-width: 600px) {
	.loginPage {
		width:100%;
		
	}
	.login-img {
		width:80%;
	}
	.loginID{
		width:80%;
		margin:0 auto;
		text-align:center;
	}
}
</style>
</head>
<body>
<jsp:include page="include/header.jsp"/>

<div class="loginPage">
  <h2 style="margin-bottom:30px;">로그인</h2>
<sec:authorize access="isAnonymous()">
	${message}
  <form action="loginCheck" method="post" class="needs-validation" novalidate>
    <div class="form-group">
    <label class="sr-only" for="uname">아이디 :</label>
      <input type="text" class="loginID" 
      	 placeholder="아이디 입력" name="id" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label class="sr-only" for="pwd">비밀번호:</label>
      <input type="password" class="loginID" 
      	 placeholder="비밀번호 입력" name="pw">
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    
    
    <!-- <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" required> I agree on blabla.
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this checkbox to continue.</div>
      </label>
    </div> -->
    <sec:csrfInput/>
    <div  style="margin-top:20px;">
    	<button type="submit" class="btn btn-primary" style="width:270px;">로그인</button>
    </div>
  </form>
  </sec:authorize>
  

    
 
  <p class="divider-text">
        <span class="bg-light">OR</span>
    </p>
  <div style="margin-top:30px;">
     	 <a id="custom-login-btn" href="javascript:loginWithKakao()">
  			<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
    			width="280"/>
		</a>
		<div style="margin-top:5px;">
		<div id="naverIdLogin">
     	 
     	 	<img class="login-img" alt="naver-login" src="../img/naver.png">
     	 
     	 </div>
     	 </div>
     	 <!--  <a href="#">
     	 	<img class="login-img" alt="google-login" src="img/google.png">
     	 </a>
     	  <a href="#">
     	 	<img class="login-img" alt="facebook-login" src="img/facebook.png">
     	 </a> -->
    </div>
    <div style="margin-top:30px;">
    <a href="#">
    	<button type="text" class="btn btn-light" style="display:inline-flex; background-color:#888fbf; color:white;">회원가입</button>
    </a>
    
     <a href="#">
    	<button type="text" class="btn btn-light" style="display:inline-flex; background-color:#a8b2f7;color:white;">비밀번호 찾기</button>
    </a>
    </div>
</div>
<jsp:include page="include/footer.jsp"/>

<!-- 카카오로그인 -->
<p id="token-result"></p>
<script type="text/javascript">
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'https://developers.kakao.com/tool/demo/oauth'
    })
  }
  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    const token = getCookie('authorize-access-token')
    if(token) {
      Kakao.Auth.setAccessToken(token)
      Kakao.Auth.getStatusInfo(({ status }) => {
        if(status === 'connected') {
          document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
        } else {
          Kakao.Auth.setAccessToken(null)
        }
      })
    }
  }
  function getCookie(name) {
    const value = "; " + document.cookie;
    const parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
  }
</script>

<!-- naver login -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "xqQBGc8hFdkhFYTkojoF",
			callbackUrl: "http://localhost:8081/naver/callback.php",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height:60  } /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>
<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

</body>
</html>
    