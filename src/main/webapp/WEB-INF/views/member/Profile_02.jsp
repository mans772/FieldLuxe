<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<style type="text/css">
.profile-top {
	text-align:center;
	margin-top:40px;
	width:1000px;
}


.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

@media screen and (max-width: 786px) {
	.profile-top{
		width:50%;
	}

}
</style>
</head>
<body>


<jsp:include page="../include/header.jsp"/>


<div class="container" style="font-family:Malgun Gothic;">
    <div style="text-align:center;">
    	<div class="profile-top">
    	<h2><%-- {} --%>Angel님의 프로필</h2>
    		<div class="star-re" style="width:1000px; margin-bottom:50px;">
       <hr>
        	<h4><strong>별점평가</strong></h4>
        		<div class="starRev" style="text-align:center;">
  					<span class="starR on">별1</span>
  					<span class="starR">별2</span>
  					<span class="starR">별3</span>
  					<span class="starR">별4</span>
  					<span class="starR">별5</span>
				</div>
			</div>
		</div>
		<div class="mybtn" style="width:1000px;margin-bottom:50px;text-align:left;">
    		<a href="#" class="btn btn-default" id="regiatratedProduct"
    			style="width:130px;height:30px; background-color:#e2c2ff; font-size:15px;">등록된 상품</a>
    		<a href="#" class="btn btn-default" id="review"
    			style="width:130px;height:30px; background-color:#bdd1ff; font-size:15px;" >구매후기</a>
    	</div>	
    	
    	
    	<c:forEach var="list" items="${profileReviewList}">
		 <div class="col-md-6 col-sm-12" style="margin-bottom:50px;">
		 	<table class="table">
		 		<tr>
		 			<th>구매자</th>
		 			<td>${list.reviewWriter}</td>
		 		</tr>
		 		<tr>
		 			<th>상품</th>
		 			<td>${list.productId}</td>
		 		</tr>
		 		<tr>
		 			<th>등록일</th>
		 			<td>${list.reviewRegDate}</td>
		 		</tr>
		 		<tr>
		 			<th>별점</th>
		 			<td>
		 			${list.reviewScore}
		 			<div class="starRev" style="text-align:center;">
  					<span class="starR on">별1</span>
  					<span class="starR">별2</span>
  					<span class="starR">별3</span>
  					<span class="starR">별4</span>
  					<span class="starR">별5</span>
					</div>
					</td>
		 		</tr>
		 		<tr>
		 			<th>리뷰</th>
		 			<td>${list.reviewContent}</td>
		 		</tr>
		 	</table>
		 </div>
		</c:forEach>
		 
		 
     <div style="margin-top:30px;width:1000px;">
       		<button style="float:right; width:100px;height:30px; background-color:#8d98f2; font-size:15px;" 
       			type="button" class="btn">더보기</button> 
    </div>
   </div>
</div>
<hr>

<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript">
$('.starRev span').click(function(){//별점평가
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
</script>

</body>
</html>