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

	<h2>닉네임님의 프로필</h2>
	<hr>
	<h3>★★★★★</h3>

		<table border="1">
			<tr>
				<td>구매자</td>
				<td>상품</td>
				<td>등록일</td>
				<td>별점</td>
				<td>리뷰</td>
			</tr>
			
			<c:forEach var="list" items="${profileReviewList}">
				<tr>
					<td>${list.reviewWriter}</td>
					<td>${list.productId}</td>
					<td>${list.reviewRegDate}</td>
					<td>${list.reviewScore}</td>
					<td>${list.reviewContent}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div style="margin-top: 30px;">
			<button
				style="float: right; width: 100px; height: 30px; background-color: #8d98f2; font-size: 15px;"
				type="button" class="btn">더보기</button>
		</div>
	
	<hr>

	<jsp:include page="../include/footer.jsp" />

</body>
</html>