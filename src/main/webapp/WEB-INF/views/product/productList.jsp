<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<style type="text/css">
h3.h3 {
	text-align: center;
	margin: 1em;
	text-transform: capitalize;
	font-size: 1.7em;
}

/********************* shopping Demo-1 **********************/
.product-grid {
	font-family: Raleway, sans-serif;
	text-align: center;
	padding: 0 0 72px;
	border: 1px solid rgba(0, 0, 0, .1);
	overflow: hidden;
	position: relative;
	z-index: 1
}

.product-grid .product-image {
	position: relative;
	transition: all .3s ease 0s
}

.product-grid .product-image a {
	display: block
}

.product-grid .product-image img {
	width: 100%;
	height: auto
}

.product-grid .pic-1 {
	opacity: 1;
	transition: all .3s ease-out 0s
}

.product-grid:hover .pic-1 {
	opacity: 1
}

.product-grid .pic-2 {
	opacity: 0;
	position: absolute;
	top: 0;
	left: 0;
	transition: all .3s ease-out 0s
}

.product-grid:hover .pic-2 {
	opacity: 1
}

.product-grid .social {
	width: 150px;
	padding: 0;
	margin: 0;
	list-style: none;
	opacity: 0;
	transform: translateY(-50%) translateX(-50%);
	position: absolute;
	top: 60%;
	left: 50%;
	z-index: 1;
	transition: all .3s ease 0s
}

.product-grid:hover .social {
	opacity: 1;
	top: 50%
}

.product-grid .social li {
	display: inline-block
}

.product-grid .social li a {
	color: #fff;
	background-color: #333;
	font-size: 16px;
	line-height: 40px;
	text-align: center;
	height: 40px;
	width: 40px;
	margin: 0 2px;
	display: block;
	position: relative;
	transition: all .3s ease-in-out
}

.product-grid .social li a:hover {
	color: #fff;
	background-color: #ef5777
}

.product-grid .social li a:after, .product-grid .social li a:before {
	content: attr(data-tip);
	color: #fff;
	background-color: #000;
	font-size: 12px;
	letter-spacing: 1px;
	line-height: 20px;
	padding: 1px 5px;
	white-space: nowrap;
	opacity: 0;
	transform: translateX(-50%);
	position: absolute;
	left: 50%;
	top: -30px
}

.product-grid .social li a:after {
	content: '';
	height: 15px;
	width: 15px;
	border-radius: 0;
	transform: translateX(-50%) rotate(45deg);
	top: -20px;
	z-index: -1
}

.product-grid .social li a:hover:after, .product-grid .social li a:hover:before
	{
	opacity: 1
}

.product-grid .product-discount-label, .product-grid .product-new-label
	{
	color: #fff;
	background-color: #ef5777;
	font-size: 12px;
	text-transform: uppercase;
	padding: 2px 7px;
	display: block;
	position: absolute;
	top: 10px;
	left: 0
}

.product-grid .product-discount-label {
	background-color: #333;
	left: auto;
	right: 0
}

.product-grid .rating {
	color: #FFD200;
	font-size: 12px;
	padding: 12px 0 0;
	margin: 0;
	list-style: none;
	position: relative;
	z-index: -1
}

.product-grid .rating li.disable {
	color: rgba(0, 0, 0, .2)
}

.product-grid .product-content {
	background-color: #fff;
	text-align: center;
	padding: 12px 0;
	margin: 0 auto;
	position: absolute;
	left: 0;
	right: 0;
	bottom: -27px;
	z-index: 1;
	transition: all .3s
}

.product-grid:hover .product-content {
	bottom: 0
}

.product-grid .title {
	font-size: 13px;
	font-weight: 400;
	letter-spacing: .5px;
	text-transform: capitalize;
	margin: 0 0 10px;
	transition: all .3s ease 0s
}

.product-grid .title a {
	color: #828282
}

.product-grid .title a:hover, .product-grid:hover .title a {
	color: #ef5777
}

.product-grid .price {
	color: #333;
	font-size: 17px;
	font-family: Montserrat, sans-serif;
	font-weight: 700;
	letter-spacing: .6px;
	margin-bottom: 8px;
	text-align: center;
	transition: all .3s
}

.product-grid .price span {
	color: #999;
	font-size: 13px;
	font-weight: 400;
	text-decoration: line-through;
	margin-left: 3px;
	display: inline-block
}

.product-grid .add-to-cart {
	color: #000;
	font-size: 13px;
	font-weight: 600
}

@media only screen and (max-width:990px) {
	.product-grid {
		margin-bottom: 30px
	}
}

.selectpicker span4 {
	width: 200px;
	height: 30px;
	font-size: 15px;
}

.pic-1 {
	width: 150px;
	height: 200px;
}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp" />

	<div class="container">
		<form class="navbar-form">
			<div class="input-group">
				<div class="form-group navbar-left">
					<select name="kategorie" class="selectpicker span4"
						style="width: 200px; height: 30px; font-size: 15px;">
						<option>모든 카테고리</option>
						<option>의류</option>
						<option>가방</option>
						<option>신발</option>
					</select> <select name="brand" class="selectpicker span4"
						style="width: 200px; height: 30px; font-size: 15px;">
						<option>모든 브랜드</option>
						<option>GUCCI</option>
						<option>CHANEL</option>
						<option>LOUISVUITTON</option>
						<option>PRADA</option>
					</select> <select name="price" class="selectpicker span4"
						style="width: 200px; height: 30px; font-size: 15px;">
						<option>모든 가격</option>
						<option>~30만</option>
						<option>30만~50만</option>
						<option>50만~80만</option>
						<option>80만 이상</option>
					</select> <select name="order" class="selectpicker span4"
						style="width: 200px; height: 30px; font-size: 15px;">
						<option>최신순</option>
						<option>저가순</option>
						<option>고가순</option>
					</select>
				</div>
			</div>
		</form>

		<div class="row" style="margin-top: 40px;">
			<c:forEach var="list" items="${productList}">
				<div class="col-md-3 col-sm-6">
					<div class="product-grid">
						<div class="product-image">
							<a href="#"> <img class="pic-1" src="../img/handbag1.jpg">
							</a> <span class="product-new-label">경매진행중</span>
						</div>
						<div class="product-content">
							<h3 class="title">${list.productBrand}</h3>
							<span><a href="#">${list.productName}</a></span>
							<div class="price">${list.immePrice}</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 페이징 처리 부분  -->
		<ul class="pagination justify-content-center">

			<!-- 이전 버튼 -->
			<c:if test="${pc.prev}">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/product/productList${pc.makeURI(pc.beginPage - 1)}' />"
					style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">이전</a>
				</li>
			</c:if>

			<!-- 페이지 버튼 -->
			<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
				<li class="page-item"><a
					href="<c:url value='/product/productList${pc.makeURI(pageNum)}'/>"
					class="page-link ${(pc.paging.page == pageNum) ? 'page-active' : ''}"
					style="margin-top: 0; height: 40px; color: pink; border: 1px solid #643691;">${pageNum}</a>
				</li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pc.next}">
				<li class="page-item"><a class="page-link"
					href="<c:url value='/product/productList${pc.makeURI(pc.endPage + 1)}' />"
					style="background-color: #643691; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">다음</a>
				</li>
			</c:if>
		</ul>
		<!-- 페이징 처리 끝 -->

	</div>

	<hr>

	<jsp:include page="../include/footer.jsp" />

</body>
</html>