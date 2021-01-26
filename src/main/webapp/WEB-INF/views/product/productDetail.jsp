<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:parseDate value="${ product.listData.productRegDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedRegDate" type="both" />
<fmt:parseDate value="${ product.listData.productPostDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedPostDate" type="both" />
<fmt:parseDate value="${ product.dealData.auctionStartDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedStartDate" type="both" />
<fmt:parseDate value="${ product.listData.auctionEndDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedEndDate" type="both" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">
.pro-de {
	width: 950px;
	text-align: center;
	display: block;
	margin: 50px auto;
	font-family:Malgun Gothic;
}

@media screen and (max-width: 786px) {
	.pro-de {
		width: 100%;
	}
	.show-table {
		overflow-x: auto;
	}
	.table {
		width: 100%;
		min-width: 500px;
	}
	.show-table2 {
		overflow-x: auto;
	}
	.table t2 {
		width: 100%;
		min-width: 500px;
	}
	.table t3 {
		width: 100%;
		min-width: 500px;
	}
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<c:if test="${ product.listData.productPostStatus eq '0'.charAt(0) }">
		<%-- 관리자가 아닐 경우 처리 --%>
	</c:if>
	<div class="contanier">
		<div class="pro-de">
			<div class="col-md-6" style="width:350px;height:350px;margin-top:100px;">${ product.listData.productThumbnail }</div>
				<div class="col-md-6">
					<div class="show-table">
						<h3>
							<strong>${ product.listData.productBrand }</strong>
						</h3>
						<h4>${ product.listData.productName }</h4>
						<h4 style="margin-top: 20px;'">상품정보</h4>
						<table class="table">
							<tr>
								<th>브랜드</th>
								<td>${ product.listData.productBrand }</td>
							</tr>
							<tr>
								<th>모델번호</th>
								<td>${ product.detailData.productModelNumber }</td>
							</tr>
							<tr>
								<th>대표색상</th>
								<td>${ product.detailData.productColor }</td>
							</tr>
							<tr>
								<th>출시일</th>
								<td>${ product.detailData.releaseDate }</td>
							</tr>
							<tr>
								<th>발매가</th>
								<td><fmt:formatNumber value="${ product.detailData.releasePrice }" />원</td>
							</tr>
							<tr>
								<th>사이즈</th>
								<td>${ product.detailData.productSize }</td>
							</tr>
						</table>
						<h4>구매정보</h4>
						<table class="table">
							<tr>
								<th>판매자</th>
								<td>${ product.listData.sellerEmail }</td>
							</tr>
							<c:choose>
								<c:when test="${ product.dealData.dealMethod == 1 }">
									<tr>
										<th>거래방식</th>
										<td>즉시구매방식</td>
									</tr>
									<tr>
										<th>즉시구매가</th>
										<td>
											<fmt:formatNumber value="${ product.listData.immePrice }" />원
										</td>
									</tr>
								</c:when>
								<c:when test="${ product.dealData.dealMethod == 2 }">
									<tr>
										<th>거래방식</th>
										<td>경매입찰방식</td>
									</tr>
									<tr>
										<th>최소입찰가</th>
										<td>
											<fmt:formatNumber value="${ product.dealData.minAuctionPrice }" />원
										</td>
									</tr>
									<tr>
										<th>입찰보증금</th>
										<td>
											최소입찰가의 10% (<fmt:formatNumber value="${ product.dealData.auctionDeposit }" />원)
										</td>
									</tr>
									<tr>
										<th>입찰기간</th>
										<td>
											<fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${ parsedStartDate }" /> ~<br>
											<fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${ parsedEndDate }" />
										</td>
									</tr>
									<tr>
										<th>현재입찰가</th>
										<td>${ product.dealData.nowAuctionPrice }</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th>거래방식</th>
										<td>즉시구매방식 / 경매입찰방식</td>
									</tr>
									<tr>
										<th>즉시구매가</th>
										<td><fmt:formatNumber value="${ product.listData.immePrice }" />원
										</td>
									</tr>
									<tr>
										<th>최소입찰가</th>
										<td>
											<fmt:formatNumber value="${ product.dealData.minAuctionPrice }" />원
										</td>
									</tr>
									<tr>
										<th>입찰보증금</th>
										<td>
											최소입찰가의 10% (<fmt:formatNumber value="${ product.dealData.auctionDeposit }" />원)
										</td>
									</tr>
									<tr>
										<th>입찰기간</th>
										<td>
											<fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${ parsedStartDate }" /> ~<br>
											<fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${ parsedEndDate }" />
										</td>
									</tr>
									<tr>
										<th>현재입찰가</th>
										<td>${ product.dealData.nowAuctionPrice }</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<tr>
								<td colspan="2">
									<a href="<c:url value='/product/pay?productId=${ product.listData.productId }' />" class="btn btn-default" style="width: 200px; height: 33px; background-color: #916d90; color: white;">구매</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="show-table2">
					<div id="image_container" class="col-md-3 col-sm-6"style="display: inline-flex; width: 250px; float: left;">
						${ product.detailData.images }
					</div>
					<div>
						<table class="table t2">
							<tr>
								<td style="margin-left: 20px; float: left;"><h4>판매자 한마디</h4></td>
							</tr>
							<tr>
								<td style="margin-left: 20px;" align="left">
									<textarea rows="10" cols="130" style="resize: none; border: none;" readonly>${ product.detailData.sellerWord }</textarea>
								</td>
							</tr>
						</table>
					</div>
					<div style="margin-top: 30px;">
						<h4 style="margin-left: 20px; float:left;width:900px;text-align:left;">구매자 리뷰</h4>
						<table class="table t3" style="width:700px;margin-top:30px;">
							<tr>
								<th style="text-align:center;">구매자</th>
								<td style="text-align:left;">Sunny</td>
							</tr>
							<tr>
								<th style="text-align:center;">등록일</th>
								<td style="text-align:left;">2021.01.04</td>
							</tr>
							<tr>
								<th style="text-align:center;">별점</th>
								<td style="text-align:left;">★★★★★</td>
							</tr>
							<tr>
								<th style="text-align:center;">리뷰</th>
								<td style="text-align:left;">물건 참좋네요</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: right;">
									<c:if test="${ product.listData.productPostStatus eq '0'.charAt(0) }">
										<a href="<c:url value='/product/modify/${ product.listData.productId }' />" class="btn btn-default" style="background-color: #90abf5; color: white;">수정</a>
										<a class="btn btn-default" style="background-color: #6e656d; color: white;" onclick="deleteProduct(${ product.listData.productId })">삭제</a>
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	
	<jsp:include page="../include/footer.jsp" />
	<script>
	
	function deleteProduct(id) {
		$.ajax({
			type: "delete",
			url: "/fieldluxe/product/content/" + id,
			headers: {
				"Content-Type" : "application/json"
			},
			dataType: "text",
			success: function(text) {
				console.log(text);
			}
		});
	}
	</script>
</body>
</html>