<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
.pro-de {
	margin-bottom:300px;
}

@media screen and (max-width: 786px) {
	.show-table{
		overflow-x: auto;
	}
	.table {
		width: 100%;
		min-width: 500px;
	} 
	
	.pro-de {
		width:100%;
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
				<li class="active"><a href="#">Home<span style="font-size:13px;"
				 class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
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
<div class="main">
		<div class="pro-de" style="font-family:Malgun gothic;width:1000px;margin-top:50px;margin-left:50px;">
		<h3>구매 내역 상세보기</h3>
		 	<div class="col-md-6" style="margin-top:50px;">
		 		<div class="show-table">
		 			<table class="table" style="width:450px;">
						<tr>
							<td colspan="2" style="text-align:center;">
								<img style="height:270px;">${purchase.listData.productThumbnail}
							</td>
						<tr>
							<th>브랜드</th>
							<td>${purchase.listData.productBrand}</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td>${purchase.listData.productName}</td>
						</tr>
						<tr>
							<th>모델번호</th>
							<td>${purchase.detailData.productModelNumber}</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-6" style="margin-top:50px;">
				<div class="show-table">
					<table class="table" style="width:500px;height:500px;margin-bottom:200px;">
						<tr>
							<td colspan="2" style="text-align:left;">
							<h4><strong>주문정보</strong></h4></td>
						<tr>
							<th>주문번호</th>
							<td>${purchase.tradeVO.tradeId}</td>
						</tr>
						<tr>
							<th>구매일</th>
							<td><fmt:formatDate value="${purchase.tradeVO.tradeDate}" pattern="yyyy-MM-dd HH:mm"/></td>
						</tr>
						<tr>
							<th>판매자</th>
							<td>${purchase.tradeVO.tradeSeller}</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:left;">
							<h4><strong>결제정보</strong></h4></td>
						</tr>
						<tr>
							<th>구매가</th>
							<td>${purchase.listData.immePrice}</td>
						</tr>
						<tr>
							<th>쿠폰할인</th>
							<td>?</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>?</td>
						</tr>
						<tr style="background-color:#ebebff">
							<td><strong>총결제금액</strong></td>
							<td>${purchase.listData.immePrice}</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:left;">
							<h4><strong>배송정보</strong></h4></td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${purchase.memberVO.name}</td>
						</tr>
						<tr>
							<th>휴대폰번호</th>
							<td>${purchase.memberVO.phoneNum}</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>${purchase.memberVO.postNum}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${purchase.memberVO.address}</td>
						</tr>
						<tr style="background-color:#ebebff">
							<th>배송상태</th>
							
							<c:set var="status" value="${purchase.listData.deliveryStatus}" />
							<c:if test="${status == 0}">
								<td>배송준비</td>
							</c:if>
							<c:if test="${status == 1}">
								<td>배송중</td>
							</c:if>
							<c:if test="${status == 2}">
								<td>배송완료</td>
							</c:if>
							<c:if test="${status == 3}">
								<td>구매확정</td>
							</c:if>
							
						</tr>
						<tr>
							<td colspan="2" style="text-align:center;">
							
							<!-- 배송상태가 배송완료(2)일 때만 구매확정 활성화 -->
							<c:if test="${status == 2}">
								<a href="<c:url value="/trade/purchaseConfirm/${purchase.tradeVO.tradeId}" />" class="btn btn-default" name="cancle-btn" style="width:200px;height:33px;
									margin-top:20px;background-color:#916d90;color:white;">구매확정</a>
							</c:if>
							
							<!-- 배송상태가 구매확정(3)일 때만 리뷰작성 활성화 -->
							<c:if test="${status == 3}">
								<a href="<c:url value="/review/insertReview/${purchase.tradeVO.tradeId}" />" class="btn btn-default" name="cancle-btn" style="width:200px;height:33px;
									margin-top:20px;background-color:#916d90;color:white;">리뷰작성</a>
							</c:if>
							
							</td>
						</tr>
					</table>
				</div>
			</div>
			
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