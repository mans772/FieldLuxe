<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:parseDate value="${ product.listData.productRegDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedRegDate" type="both" />
<fmt:parseDate value="${ product.listData.productPostDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedPostDate" type="both" />
<fmt:parseDate value="${ product.dealData.auctionStartDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedStartDate" type="both" />
<fmt:parseDate value="${ product.listData.auctionEndDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedEndDate" type="both" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
<style type="text/css">
#thumbnail img{
	position: relative;
	width: 100%;
}
#images img{
	position: relative;
	width: 100%;
}
</style>
</head>
<body>
<c:if test="${ product.listData.productPostStatus == 0 }">
	<!-- 관리자가 아닐 경우 다른 페이지로 이동 처리 -->
</c:if>
<h1 align="center">상세 화면</h1>
<div style="margin-left: 15%; margin-right: 15%; width: 70%;">
	<div style="position: relative; width: 100%; height: auto;">
		<div id="thumbnail" style="position: relative; width: 45%; border: 1px solid black; display: inline-block; float: left;">
			${ product.listData.productThumbnail }
			<p align="center">대표 이미지</p>
		</div>
		<div style="position: relative; width: 45%; border: 1px solid black; display: inline-block; float: right;">
			<p style="font-size: 20px; font-weight: bold;">${ product.listData.productBrand }</p>
			<p style="font-size: 16px; font-weight: bold;">${ product.listData.productName }</p>
			<hr>
			<p>상품 정보</p>
			<hr>
			<table>
				<tr>
					<td>브랜드</td>
					<td>${ product.listData.productBrand }</td>
				</tr>
				<tr>
					<td>모델번호</td>
					<td>${ product.detailData.productModelNumber }</td>
				</tr>
				<tr>
					<td>대표색상</td>
					<td>${ product.detailData.productColor }</td>
				</tr>
				<tr>
					<td>출시일</td>
					<td>${ product.detailData.releaseDate.year }년  ${ product.detailData.releaseDate.monthValue }월 ${ product.detailData.releaseDate.dayOfMonth }일</td>
				</tr>
				<tr>
					<td>발매가</td>
					<td>${ product.detailData.releasePrice }원</td>
				</tr>
				<tr>
					<td>사이즈</td>
					<td>${ product.detailData.productSize }</td>
				</tr>
			</table>
			<hr>
			<p>구매정보</p>
			<hr>
			<table>
				<tr>
					<td>판매자</td>
					<td>${ product.listData.sellerEmail }</td>
				</tr>
				<tr>
					<td>거래방식</td>
					<td>
						<c:choose>
							<c:when test="${ product.dealData.dealMethod == 1 }">
								즉시구매 방식
							</c:when>
							<c:when test="${ product.dealData.dealMethod == 2 }">
								경매입찰 방식
							</c:when>
							<c:otherwise>
								즉시구매,경매입찰 방식
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				
				<c:choose>
					<c:when test="${ product.dealData.dealMethod == 1 }">
						<tr>
							<td>즉시구매가</td>
							<td>${ product.listData.immePrice }</td>
						</tr>
					</c:when>
					<c:when test="${ product.dealData.dealMethod == 2 }">
						<tr>
							<td>최소입찰가</td>
							<td>${ product.dealData.minAuctionPrice }원</td>
						</tr>
						<tr>
							<td>입찰보증금</td>
							<td>${ product.dealData.auctionDeposit }원</td>
						</tr>
						<c:if test="${ product.listData.productPostStatus eq '1'.charAt(0) }">
							<tr>
								<td>입찰기간</td>
								<td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${ parsedStartDate }" /> ~ <fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${ parsedEndDate }" /></td>
							</tr>
							<tr>
								<td>현재입찰가</td>
								<td>${ product.dealData.nowAuctionPrice }</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr>
							<td>즉시구매가</td>
							<td>${ product.listData.immePrice }</td>
						</tr>
						<tr>
							<td>최소입찰가</td>
							<td>${ product.dealData.minAuctionPrice }</td>
						</tr>
						<tr>
							<td>입찰보증금</td>
							<td>${ product.dealData.auctionDeposit }원</td>
						</tr>
						<tr>
							<td>입찰기간</td>
							<td><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${ parsedStartDate }" /> ~ <fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${ parsedEndDate }" /></td>
						</tr>
						<tr>
							<td>현재입찰가</td>
							<td>${ product.dealData.nowAuctionPrice }</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<hr>
			<c:choose>
				<c:when test="${ product.listData.productPostStatus eq '0'.charAt(0) }">
					<input type="button" value="판매 등록" onclick="check(1)">
					<input type="button" value="판매 취소" onclick="check(2)">
				</c:when>
				<c:otherwise>
					<input type="button" value="구매" onclick="location.href='/fieldluxe/product/pay?productId=${product.listData.productId}'">
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div id="images" align="center" style="position: relative; margin-left: 15%; margin-right: 15%; width: 70%; display: inline-block;">
		<p align="center" style="position: relative;">상세 이미지</p>
		${ product.detailData.images }
	</div>
	<div style="position: relative; width: 100%; display: inline-block;">
		<p align="center" style="position: relative;">판매자 한마디</p>
		${ product.detailData.sellerWord }
	</div>
	<div style="position: relative; width: 100%; display: inline-block;">
		<p align="center" style="position: relative;">구매자 리뷰</p>		
	</div>
	<div style="position: relative; width: 100%; display: inline-block;">
		<p align="right" style="position: relative;">
			<input type="button" value="수정" onclick="modifyPage(${ product.listData.productId })">
			<input type="button" id="delete" value="삭제">
		</p>
	</div>
</div>
<form id="deleteForm" method="post">
	<input type="hidden" name="_method" value="delete">
	<input type="hidden" name="productId" value="${ product.listData.productId }">
</form>
<form id="checkForm" method="post">
	<input type="hidden" name="_method" value="put">
	<input type="hidden" name="status" id="status">
	<input type="hidden" name="productId" value="${ product.listData.productId }">
	<input type="hidden" name="rejectReason" value="그냥">
</form>
<script>
	$("#delete").click(function(e) {
		e.preventDefault();
		if (!confirm("정말로 삭제하시겠습니까?")) return;
		$("#deleteForm")[0].submit();
	})

	function modifyPage(id) {
		location.href="/fieldluxe/product/modify/" + id;
	}

	function check(status) {
		$("#status").val(status);
		$("#checkForm")[0].submit();
	}
</script>
</body>
</html>