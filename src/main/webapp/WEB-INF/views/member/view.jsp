<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Info</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
		margin-top:50px;
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


input[type="checkbox"] { 
	display: none; 
} 
.label__on-off { 
	overflow: hidden; 
	position: relative; 
	display: inline-block; 
	width: 58px; height: 26px; 
	-webkit-border-radius: 13px; 
	-moz-border-radius: 13px; 
	border-radius: 13px; 
	background-color: #ed4956; 
	color: #fff; 
	font-weight: bold; 
	cursor: pointer; 
	-webkit-transition: all .3s; 
	-moz-transition: all .3s; 
	-ms-transition: all .3s; 
	-o-transition: all .3s; 
	transition: all .3s; 
} 
.label__on-off > * { 
	vertical-align: middle; 
	-webkit-transition: all .3s; 
	-moz-transition: all .3s; 
	-ms-transition: all .3s; 
	-o-transition: all .3s; 
	transition: all .3s; font-size: 14px; 
} 
.label__on-off .marble { 
	position: absolute; 
	top: 1px; left: 1px; 
	display: block; 
	width: 24px; 
	height: 24px; 
	background-color: #fff; 
	-webkit-border-radius: 50%; 
	-moz-border-radius: 50%; 
	border-radius: 50%; 
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
	box-shadow: 0 0 10px rgba(0, 0, 0, .3); 
} 
.label__on-off .on { 
	display: none; 
	padding-left: 12px; 
} 
.label__on-off .off { 
	padding-left: 30px; line-height: 25px; 
} 
.input__on-off:checked + .label__on-off { 
	background-color: #0bba82; 
} 
.input__on-off:checked + .label__on-off .on { 
	display: inline-block; 
} 
.input__on-off:checked + .label__on-off .off { 
	display: none; 
} 
.input__on-off:checked + .label__on-off .marble { 
	left: 33px; 
}
.show-table {
	width:800px;
	margin-top:70px;
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
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
   
<a href="update?email=${mem.email}">회원정보 수정</a>
	<nav class="navbar navbar-inverse sidebar" role="navigation" >
    <div class="container-fluid" style="font-family:Malgun Gothic;">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">ADMIN</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home<span style="font-size:13px;"
				 class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
				<li ><a href="#">회원관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				<li ><a href="#">등록상품 검수<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list"></span></a></li>
				<li ><a href="#">게시 상품 관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list"></span></a></li>
				<li ><a href="#">거래내역 관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list"></span></a></li>
				<li ><a href="#">1:1 문의 관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-question-sign"></span></a></li>
				<li ><a href="#">리뷰관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></a></li>
				<li ><a href="#">쿠폰관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></a></li>
			</ul>
		</div>
	</div>
</nav>
<div class="main" style="font-family:Malgun Gothic;">
	<div class="show-table" >
		<h3>회원상세보기</h3>
	<table class="table" style="margin-top:50px;">
    	
         <tr>
            <th>이메일</th>
            <td>${mem.email}</td>
         </tr>
         <tr>
            <th>닉네임</th>
            <td>${mem.nickname}</td>
          </tr>
          <tr>
          	<th>이름</th>
          	<td>${mem.name}</td>
          </tr>
           <tr>
          	<th>휴대폰번호</th>
          	<td>${mem.phoneNum}</td>
          </tr>
           <tr>
          	<th>가입날짜</th>
          	<td>${mem.joinDate}</td>
          </tr>
           <tr>
          	<th>주소</th>
          	<td>${mem.address}</td>
          </tr>
          <%-- <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MASTER')"> --%>
          <tr>
          <td>권한</td>
          <td>${mem.auth}</td>
          <%-- </sec:authorize> --%>
          <tr>
          	<th>보유쿠폰</th>
          	<td><select name="coupon" class="selectpicker"style="width:200px;height:30px;font-size:15px;">
			 		<option>10% 할인</option>
			 		<option>20% 할인</option>
					<option>30% 할인</option>
					
				</select></td>
          </tr>
          <tr>
          	<th>계좌번호</th>
          	<td>${mem.account}</td>
          </tr>
          <tr>
          	<th>계좌정지</th>
          	<td><input type="checkbox" id="switch1" name="switch1" class="input__on-off"> 
          		<label for="switch1" class="label__on-off"> 
          			<span class="marble"></span> 
          			<span class="on">ACT</span> 
          			<span class="off">BAN</span>
          		</label>
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


</script>
</body>
</html>