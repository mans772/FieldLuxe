<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.show-table{
	margin-top:100px;
	margin-bottom:200px;
	width:900px;
	margin-left:100px;
	margin-right:100px;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.search-container {
  float: right;
  display:inline-flex;
}
.search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
  display:inline-flex;
}

.search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 786px) {
	.show-table{
		overflow-x: auto;
	}
	.table {
		width: 100%;
		min-width: 500px;
	}
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
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="manageNav.jsp" />
<div class="main">
<div class="show-table" >
	<table class="table">
    	<tr>
           <td colspan="6"><h3>리뷰 관리</h3></td>
         </tr>
         <tr>
            <th>리뷰번호</th>
            <th>리뷰날짜</th>
           	<th>판매자</th>
            <th>상품명</th>
            <th style="text-align:center;">별점평가</th>
            <th>리뷰내용</th>
          </tr>
          <tr>
      <%-- <c:forEach items="${}" var="vo"> --%>
      <%-- <c:if test="${empty }"><h3>내역이 없습니다.</h3></c:if> --%>
           	<td>0053<%-- ${vo. } --%></td>
           	<td>2020.12.30<%-- ${vo. } --%></td>
           	<td>Linda</td>
            <td>BALENCIAGA<%-- ${vo. } --%></td>
            <td><div class="starRev" style="text-align:center;">
  					<span class="starR on">별1</span>
  					<span class="starR">별2</span>
  					<span class="starR">별3</span>
  					<span class="starR">별4</span>
  					<span class="starR">별5</span>
				</div><%-- ${vo. } --%></td>
            <td>그냥 그래요<%-- ${vo. } --%></td>
            <%-- </c:forEach> --%>
           </tr>
            			<tr>
            				<td>0053<%-- ${vo. } --%></td>
            				<td>2020.12.30<%-- ${vo. } --%></td>
            				<td>Choi</td>
            				<td>BALENCIAGA<%-- ${vo. } --%></td>
            				<td><div class="starRev" style="text-align:center;">
  									<span class="starR on">별1</span>
  									<span class="starR">별2</span>
  									<span class="starR">별3</span>
  									<span class="starR">별4</span>
  									<span class="starR">별5</span>
								</div>
							</td>
            				<td>예뻐요.잘쓰고 있어요<%-- ${vo. } --%></td>
            			</tr>
           <tr>
            <td colspan="6" style="text-align:center;"><!-- 페이징처리 -->
  				<div class="pagination">
  					<a href="#">&laquo;</a>
  					<a class="active" href="#">1</a>
  					<a  href="#">2</a>
  					<a href="#">3</a>
  					<a href="#">&raquo;</a>
				</div>
			</td>
			</tr>
     	</table>       			
      </div>
    <jsp:include page="../include/footer.jsp"/>
    
</div>
 

<script type="text/javascript"> /* sidebar function */
function htmlbodyHeightUpdate(){
	var height3 = $( window ).height()
	var height1 = $('.nav').height()+50
	height2 = $('.main').height()
	if(height2 > height3){
		$('html').height(Math.max(height1,height3,height2)+10);
		$('body').height(Math.max(height1,height3,height2)+10);
	}
	else
	{
		$('html').height(Math.max(height1,height3,height2));
		$('body').height(Math.max(height1,height3,height2));
	}
	
}
$(document).ready(function () {
	htmlbodyHeightUpdate()
	$( window ).resize(function() {
		htmlbodyHeightUpdate()
	});
	$( window ).scroll(function() {
		height2 = $('.main').height()
			htmlbodyHeightUpdate()
	});
});


$('.starRev span').click(function(){//별점평가
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
</script>

</body>
</html>