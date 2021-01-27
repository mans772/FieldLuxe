<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member update</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<!-- <script> /* 다음주소검색 */
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>
 -->
<style>
.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}


 body,html{
		height: 100%;
		font-family:Malgun gothic;
	}

	/* remove outer padding */
	.main .row{
		padding: 0px;
		margin: 0px;
	}

	/*Remove rounded coners*/

	nav.sidebar.navbar {
		border-radius: 0px;
	}

	nav.sidebar, .main{
		-webkit-transition: margin 200ms ease-out;
	    -moz-transition: margin 200ms ease-out;
	    -o-transition: margin 200ms ease-out;
	    transition: margin 200ms ease-out;
	}

	/* Add gap to nav and right windows.*/
	.main{
		padding: 10px 10px 0 10px;
	}

	/* .....NavBar: Icon only with coloring/layout.....*/

	/*small/medium side display*/
	@media (min-width: 768px) {

		/*Allow main to be next to Nav*/
		.main{
			position: absolute;
			width: calc(100% - 40px); /*keeps 100% minus nav size*/
			margin-left: 40px;
			float: right;
		}

		/*lets nav bar to be showed on mouseover*/
		nav.sidebar:hover + .main{
			margin-left: 200px;
		}

		/*Center Brand*/
		nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
			margin-left: 0px;
		}
		/*Center Brand*/
		nav.sidebar .navbar-brand, nav.sidebar .navbar-header{
			text-align: center;
			width: 100%;
			margin-left: 0px;
		}

		/*Center Icons*/
		nav.sidebar a{
			padding-right: 13px;
		}

		/*adds border top to first nav box */
		nav.sidebar .navbar-nav > li:first-child{
			border-top: 1px #e5e5e5 solid;
		}

		/*adds border to bottom nav boxes*/
		nav.sidebar .navbar-nav > li{
			border-bottom: 1px #e5e5e5 solid;
		}

		/* Colors/style dropdown box*/
		nav.sidebar .navbar-nav .open .dropdown-menu {
			position: static;
			float: none;
			width: auto;
			margin-top: 0;
			background-color: transparent;
			border: 0;
			-webkit-box-shadow: none;
			box-shadow: none;
		}

		/*allows nav box to use 100% width*/
		nav.sidebar .navbar-collapse, nav.sidebar .container-fluid{
			padding: 0 0px 0 0px;
		}

		/*colors dropdown box text */
		.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
			color: #777;
		}

		/*gives sidebar width/height*/
		nav.sidebar{
			width: 200px;
			height: 100%;
			margin-left: -160px;
			float: left;
			z-index: 8000;
			margin-bottom: 0px;
		}

		/*give sidebar 100% width;*/
		nav.sidebar li {
			width: 100%;
		}

		/* Move nav to full on mouse over*/
		nav.sidebar:hover{
			margin-left: 0px;
		}
		/*for hiden things when navbar hidden*/
		.forAnimate{
			opacity: 0;
		}
	}

	/* .....NavBar: Fully showing nav bar..... */

	@media (min-width: 1330px) {

		/*Allow main to be next to Nav*/
		.main{
			width: calc(100% - 200px); /*keeps 100% minus nav size*/
			margin-left: 200px;
		}

		/*Show all nav*/
		nav.sidebar{
			margin-left: 0px;
			float: left;
		}
		/*Show hidden items on nav*/
		nav.sidebar .forAnimate{
			opacity: 1;
		}
		
	}

	nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus {
		color:#403140;
		background-color: transparent; 
	}

	nav:hover .forAnimate{
		opacity: 1;
	}
	section{
		padding-left: 15px;
	}
.show-table{
		margin-top:100px;
		margin-bottom:200px;
		width:900px;
		margin-left:100px;
		margin-right:100px;
	}

.td-left {
	
	font-size:20px;
	width:12%;
	text-align:center;
}
.td-right {
	/* width:50%; */
	height:100%;
}
.btn {
	width:120px;
	margin-right:30px;
}
 @media screen and (max-width: 786px) {
	.show-table{
		overflow-x: auto;
	} 
	.table {
		width: 100%;
		min-width: 500px;
	}
	
	.btn {
	width:60%;
	}
}
td {
	/* font-style:dotum; */
	font-size:20px;
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



@media screen and (max-width: 600px) {
	.main {
		width:100%;
	}
	.btn{
		width:100%;
		margin-left:0;
	}
}

</style>


</head>
<body>
<jsp:include page="../include/header.jsp"/>
	
	<nav class="navbar navbar-inverse sidebar" role="navigation" style="background-color:#f0e1f2;">
    <div class="container-fluid" style="font-family:Malgun gothic;">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
				<a class="navbar-brand" href="#">마이 페이지</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
				<li ><a href="#">내 프로필보기<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				<li ><a href="#">경매참여내역<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list"></span></a></li>
				<li ><a href="#">구매내역<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list"></span></a></li>
				<li ><a href="#">판매내역<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list"></span></a></li>
				<li ><a href="#">상품등록 관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-envelope"></span></a></li>
				<li ><a href="#">회원정보 수정<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-pencil"></span></a></li>
				<li ><a href="#">1:1 문의<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-question-sign"></span></a></li>
				<li ><a href="#">리뷰관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></a></li>
			</ul>
		</div>
	</div>
</nav>
<div class="main" style="font-family:Malgun gothic;">
	<div class="show-table">
	
	<form:form class="form" action="update" method="post" modelAttribute="mem">

         	<input type=hidden name=password value="${mem.password}">
	<table class="table">
    	<tr>
           <td colspan="2"><h3>${mem.email}님 정보 수정</h3></td>
         </tr>
         
         <tr>
            <td class="td-left"><label class="control-label" for="id">이메일</label></td>
            <td class="td-right"><input style="width:60%" type="text" name="email" value="${mem.email}" readonly> </td>
         </tr>
         
       	 <tr>
       	   <td class="td-left"><label class="control-label" for="nickname">닉네임</label></td>
           <td class="td-right"><input style="width:60%" type="text" name="nickname" value="${mem.nickname}"> </td>
         </tr>
           
         <tr>
         	<td class="td-left"><label class="control-label" for="name">이름</label></td>
            <td class="td-right"><input style="width:60%" type="text" name="name" value="${mem.name}"> </td>
         </tr>
         
         <tr>
        	<td class="td-left"><label class="control-label" for="tel">휴대폰번호</label></td>
            <td class="td-right"><input style="width:60%" type="text" name="phoneNum" value="${mem.phoneNum}"> </td>
         </tr>
           
         <tr>
         	<td class="td-left"><label class="control-label" for="zipcode">우편번호</label></td>
            <td class="td-right"><input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="postNum" id="addr1" type="text" readonly >
    			<button style="width:130px;" type="button" class="btn" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
    		</td>
 		 </tr>
           
         <tr>
        	<td class="td-left"><label class="control-label" for="address">주소</label></td>
            <td class="td-right"> <input class="form-control" style="top: 5px;width:60%;" placeholder="도로명 주소" name="postNum" id="addr2" type="text" readonly /></td>
         </tr>
           
         <tr>
         	<td class="td-left"><label class="control-label" for="detailaddress">상세주소</label></td>
            <td class="td-right"><input class="form-control" style="width:60%" placeholder="상세주소" name="addr3" id="addr3" type="text"  /></td>
         </tr>
           
         <tr>
         	<td class="td-left"><label class="control-label" for="coupon">보유쿠폰</label></td>
            <td class="td-right"><input style="width:60%" type="text" name="userCoupon" value="<%-- ${vo. } --%>"> </td>
         </tr>
         
         <tr>
         	<td colspan="2">
         		<div class="btn-group" style="margin-top:30px;">
         			<button type="submit" class="btn" style="background-color:#90abf5;color:white;" onclick="return confirm('수정하시겠습니까?')">회원정보 수정</button>
   				    <button type="reset" class="btn" style="background-color:#747475;color:white;" onclick="goBack()">취소</button>
   				    <a href="#"> <!-- 비밀번호 변경 -->
   				    <button type="button" class="btn" style="background-color:#9191ed;color:white;">비밀번호변경</button>
    				</a>
    				<a href="#"><!-- 회원탈퇴 -->
    				<button type="button" class="btn" style="background-color:#c9c9c9;color:black;">회원탈퇴</button>
  					</a>
  				</div>
  			</td>
  		</tr>
     </table>
    </form:form> 
   </div> 
   <jsp:include page="../include/footer.jsp"/>
</div>
 


<script type="text/javascript">/* 사이드바 function */
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

function execPostCode() {/* 다음 주소 검색 */
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=postNum]").val(data.zonecode);
           $("[name=address]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>
</body>
</html>