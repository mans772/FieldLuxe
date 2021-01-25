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
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="assets/css/main.css">

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
				
					<form  method="post" action="#">
						
						<div class="input-group" >
							<input type="text" class="form-control" style="margin-top:20px;"
								name="name" id="name"  placeholder="아이디를 입력해주세요" required/>
								<input type="text" class="form-control" style="margin-top:20px;"
								name="nickname" id="nickname"  placeholder="별명을 입력해주세요" onchange="check_pw()" required/>
							<input type="password" class="form-control" style="margin-top:20px;"
							name="password" id="password"  placeholder="비밀번호는 영문, 숫자, 특수문자를 조합하여 입력해주세요." required/>
							<input type="password" class="form-control" style="margin-top:20px;"
							name="confirm" id="confirm"  placeholder="비밀번호를 다시 한번 입력해주세요"onchange="check_pw()" required/>
								
    						<span id="check"></span>
						</div>
						
						
						<div  style="margin-top:20px;display:inline-flex">
						<a href="#">
							<input type="reset" value="취소" class="input-cancle">		
						</a>
						</div>
						<div  style="margin-top:20px; display:inline-flex">
    						<button type="submit" class="btn-join">회원가입</button>
 						</div>		
					</form>
						
			</div>
		</div>
<script>
function check_pw(){
	if(document.getElementById('password').value !='' && document.getElementById('confirm').value!=''){
	    if(document.getElementById('password').value==document.getElementById('confirm').value){
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