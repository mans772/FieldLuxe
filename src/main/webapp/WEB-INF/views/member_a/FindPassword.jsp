<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>FinePassword</title>
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
		padding:40px;
		background-color:#e9edf5;
		font-family:Malgun Gothic;
	}
	.loginemail{
		width:70%;
		height:40px;
	}
@media screen and (max-width: 600px) {
	.loginPage {
		width:100%;
		
	}
	
	.loginemail{
		width:80%;
		margin:0 auto;
		text-align:center;
	}
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"/>

<div class="loginPage">
  <h2>비밀번호 찾기</h2>
 
  <form action="#" class="needs-validation" novalidate>
    <div class="form-group" style="margin-top:50px;">
    <P>가입 시 입력하신 이메일 주소를 입력해주시면 임시 비밀번호를 전송해 드립니다.</P>
    <p>임시 비밀번호로 로그인 뒤 새로운 비밀번호를 설정하세요.</p>
    <div style="margin-top:50px;">
    	<label for="email">이메일 주소</label>
      	<input type="text" class="loginemail" 
      	 placeholder="asdf@naver.com" name="userEmail" required>
     <!--  <div class="valid-feedback">Valid.</div> -->
      	<div class="invalid-feedback">이메일을 입력해주세요.</div>
    </div>
    <div  class="sendbtn" style="margin-top:20px;">
    	<button type="submit" class="btn btn-primary"style="width:270px;">전송하기</button>
    </div>
   </div>
  </form>
 
  
</div>
<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript">
//Disable form submissions if there are invalid fields
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
    