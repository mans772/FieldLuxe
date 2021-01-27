<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
		margin-bottom:300px;
		width:900px;
		margin-left:100px;
	}
	.table{
		margin-top:60px;
		margin-left:100px;
		width:700px;
	
	}
	

.btn .btn-default.1{
	width:50px;
	height:30px;
	
}	
.btn.btn-default.2{
	width:50px;
	height:30px;
	
}
@media screen and (max-width: 786px) {
	.show-table{
		overflow-x: auto;
		margin:0 5px;
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
				<li><a href="#">회원관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				<li><a href="#">등록상품 검수<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list"></span></a></li>
				<li><a href="#">게시상품관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list"></span></a></li>
				<li><a href="#">거래내역관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list"></span></a></li>
				<li><a href="#">1:1문의관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-question-sign"></span></a></li>
				<li><a href="#">리뷰관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></a></li>
				<li><a href="#">쿠폰관리<span style="font-size:13px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></a></li>
			</ul>
		</div>
	</div>
</nav>
<div class="main">
	<div class="show-table" style="font-family:Malgun Gothic;">
		<h3>쿠폰수정/삭제</h3>
		<form action="#" method="post">
         <table class="table" style="margin-top:60px;">
         <tr>
            <th>쿠폰번호</th>
            <td><input type="text" name="userEmail" style="width:500px;" value=""></td>
          </tr>
           <tr>
            <th>쿠폰명</th>
            <td><input type="text" name="couponName" style="width:500px;" value=""></td>
          </tr>
          <tr>
            <th>사용기한</th>
            <td><input type="date" class="form-control" id="tillDate" style="width:500px;" name="tillDate"></td>
          </tr>
          <tr>
            <th>할인율</th>
            <td><input type="text" name="discountRate" style="width:500px;" value=""></td>
          </tr>
          <tr>
            <th>상태</th>
            <td><!-- <input type="text" name="status" style="width:500px;" value=""> -->
            	<select name="" class="selectpicker" style="width:200px;height:30px;font-size:15px;">
			 		<option>활성화</option>
					<option>비활성화</option>
				</select></td>
          </tr>
       
     	</table>
     	<div style="float:right;">
     		<button class="btn btn-default 1" type="submit" style="background-color:#ffedf1;display:inline-flex;margin-right:7px;">수정</button>
            <button class="btn btn-default 2"  type="reset" style="background-color:#c3a6ff;color:white;display:inline-flex;">삭제</button>
     	</div>
     	</form>       			
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