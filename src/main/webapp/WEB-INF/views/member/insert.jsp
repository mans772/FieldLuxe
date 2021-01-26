<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		Website CSS style
		<link rel="stylesheet" type="text/css" href="assets/css/main.css"> -->

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<title>MemberJoin</title>
		
<style type="text/css">

 .join-page{
 	width:800px;
	margin:50px auto;
	text-align:center;
 
 }
 
 .input-group{
 		width:60%;
		height:40px;
		margin:20px auto;
		text-align:center;
}
	.btn-join {
		width:250px;
		height:40px;
		background-color:#d673fa;
		border:none;
		color:white;
	}
	.input-cancle{
		width:250px;
		height:40px;
		background-color:#e6e6e6;
		text-align:center;
		border:none;
		color:#141414;
	}
@media screen and (max-width: 600px) {
	.join-page {
		width:100%;
		
	}
	
	.input-group{
		width:100%;
		 margin:0 auto;
		text-align:center;
	}
	.btn-join {
		width:100%;
	}
	.input-cancle{
		width:50%;
	}
}
</style> 



</head>



<body>
<jsp:include page="../include/header.jsp"/>
	<div class="join-page">
			<div class="row">
				<h1 class="title">회원가입</h1>
				
					<form  method="post" action="insert">
						
						<div class="input-group" >
							<input type="text" class="form-control" style="margin-top:20px;"
								name="email" id="email"  placeholder="이메일을 입력해주세요" required/>
							<div class="check_font" align="left" id="idCheck"></div>
							
							<input type="text" class="form-control" style="margin-top:20px;"
							name="nickname" id="nickname"  placeholder="별명을 입력해주세요" required/>
							<div class="check_font" align="left" id="nickCheck"></div>
							
							<input type="password" class="form-control" style="margin-top:20px;"
							name="password" id="password"  placeholder="비밀번호는 영문, 숫자, 특수문자를 조합하여 입력해주세요." onchange="check_pw()" required/>
				
							<input type="password" class="form-control" style="margin-top:20px;"
							name="pwConfirm" id="pwConfirm"  placeholder="비밀번호를 다시 한번 입력해주세요" onchange="check_pw()" required/>
    						<span id="check"></span>
						</div>
						
						
						<div  style="margin-top:20px;display:inline-flex">				
							<input type="button" value="취소" class="input-cancle" onclick="goBack()">		
						</div>
						<div  style="margin-top:20px; display:inline-flex">
    						<button type="submit" class="btn-join" id="rbtn">회원가입</button>
 						</div>		
					</form>
						
			</div>
		</div>
<script>
	var flag = 0;
	var uflag = 0;
	var nflag = 0;
	$("#rbtn").attr("disabled", true);

	$("#email").blur(function(){
		var url = "idCheck";
		var email = $("#email").val();
		var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var allData = {
				email : email
		}
		$.ajax({
			data : JSON.stringify(allData),
			url : url,
			type : "post",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				console.log(data);
				if(data.emailResult === "NO"){
					$("#idCheck").text("사용중인 이메일입니다!");
					$("#idCheck").css("color", "red");
					uflag = 0;
					$("#rbtn").attr("disabled", true);
				} else {
					console.log(email);
					if(emailRule.test(email)){
						$("#idCheck").text("사용 가능한 이메일입니다!");
						$("#idCheck").css("color", "green");
						uflag = 1;
						if( uflag + nflag >= 2){
							$("#rbtn").removeAttr("disabled");
						}
						console.log("uflag : " + uflag);
						console.log("flag : " + flag);
					} else if(email == ""){
						$("#idCheck").text("이메일을 입력하세요.");
						$("#idCheck").css("color", "red");
						uflag = 0;
						$("#rbtn").attr("disabled", true);
					} else if(!emailRule.test(email)){
						$("#idCheck").text("이메일 형식을 입력하세요.");
						$("#idCheck").css("color", "red");
						uflag = 0;
						$("#rbtn").attr("disabled", true);
					}
				}
			}, error : function(){
				console.log("실패");
			}
		});
	});
	
	$("#nickname").blur(function(){
		var url = "nickCheck";
		var nickname = $("#nickname").val();
		var allData = {
				nickname : nickname
		}
		var nicknameRule = /^[0-9a-zA-Z가-힣]{2,10}$/;
		$.ajax({
			data : JSON.stringify(allData),
			url : url,
			type : "post",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				console.log(data);
				if(data.nickResult === "NO"){
					$("#nickCheck").text("사용중인 별명입니다!");
					$("#nickCheck").css("color", "red");
					nflag = 0;
					$("#rbtn").attr("disabled", true);
				} else {
				console.log(nickname);
					if(nicknameRule.test(nickname)){
						$("#nickCheck").text("사용 가능한 별명입니다!");
						$("#nickCheck").css("color", "green");
						nflag = 1;
						if( uflag + nflag >= 2){
							$("#rbtn").removeAttr("disabled");
						}
					} else if(nickname == ""){
						$("#nickCheck").text("별명을 입력하세요.");
						$("#nickCheck").css("color", "red");
						nflag = 0;
						$("#rbtn").attr("disabled", true);
					} else if(!nicknameRule.test(nickname)){
						$("#nickCheck").text("한,영,숫자 2~10자리 입력하세요.");
						$("#nickCheck").css("color", "red");
						nflag = 0;
						$("#rbtn").attr("disabled", true);
					}
				}
			}, error : function(){
				console.log("실패");
			}
		});
	});
	
	function goBack(){
		window.history.back();
	}
	

function check_pw(){
	if(document.getElementById('password').value !='' && document.getElementById('pwConfirm').value!=''){
	    if(document.getElementById('password').value==document.getElementById('pwConfirm').value){
	        document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
	        document.getElementById('check').style.color='green';
	    }
	    else{
	        document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
	        document.getElementById('check').style.color='red';
	    }
	}}

	</script>


	<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>