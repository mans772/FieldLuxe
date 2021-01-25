<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>FinePassword</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
	
	.loginPage {
		width:1000px;
		margin:50px auto;
		text-align:center;
		padding:40px;
		font-family:Malgun Gothic;
	} 
	
@media screen and (max-width: 600px) {
	.loginPage {
		width:100%;
		
	}
	
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"/>

<div class="loginPage">
  <h2>Send Email</h2>
 
  <form action="#" method="post">
  <table class="table" style="margin-top:50px;">
  	<tr>
  		<td style="width:20%;">
  			<label for="usr">이메일</label>
  		</td>
  		<td>
  			<input type="text" class="form-control" id="usr">
  		</td>
    	
    <tr>
    	
    	<td>
  			<label for="title">제목</label>
  		</td>
  		<td>
      		<input type="text" class="form-control" id="title">
      	</td>
     	
     </tr>
     <tr>
     	
     	<td><label for="comment">내용</label>
     	</td>
     	<td>
     		<textarea class="form-control" rows="5" id="comment"></textarea>
     	</td>
    	
    </tr>
    <tr>
    	<td colspan="2" style="text-align:center;">
    		<div  class="sendbtn" style="margin-top:20px;">
    		<button type="submit" class="btn btn-primary" >전송하기</button>
    		</div>
    	</td>
    </tr>
   </table>
  </form>
</div>
<jsp:include page="../include/footer.jsp"/>



</body>
</html>
    