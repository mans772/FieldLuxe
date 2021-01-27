<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <fmt:parseDate value="${ product.listData.productRegDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedRegDate" type="both" />
<fmt:parseDate value="${ product.listData.productPostDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedPostDate" type="both" />
<fmt:parseDate value="${ product.dealData.auctionStartDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedStartDate" type="both" />
<fmt:parseDate value="${ product.listData.auctionEndDate }" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedEndDate" type="both" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					
					
					<!-- 리뷰가 존재할 때만 보여지기 -->
					<c:if test="${not empty review.reviewId}">
					
					<div id="reviewArea" style="margin-top: 30px;">
						<h4 style="margin-left: 20px; float:left;width:900px;text-align:left;">구매자 리뷰</h4>
						<table class="table t3" style="width:700px;margin-top:30px;">
							<tr>
								<th style="text-align:center;">구매자</th>
								<td style="text-align:left;">${review.reviewWriter}</td>
							</tr>
							<tr>
								<th style="text-align:center;">등록일</th>
								<td style="text-align:left;">${review.reviewRegDate}</td>
							</tr>
							<tr>
								<th style="text-align:center;">별점</th>
								<td style="text-align:left;">${review.reviewScore}</td>
							</tr>
							<tr>
								<th style="text-align:center;">리뷰</th>
								<td style="text-align:left;">${review.reviewContent}</td>
							</tr>
							<tr>
						</table>	
							
						<!-- 리뷰 수정 버튼 -->
						<button id='reviewBtn' type='button' data-toggle='modal' data-target='#modifyModal'
							class="btn btn-default" style="background-color: #90abf5; color: white;">수정
						</button>
							
					  </div>
					  </c:if>
							
							<!-- 리뷰 수정 모달창 -->
							<div class="modal fade" id="modifyModal" role="dialog">
							  <div class="modal-dialog">
							      <div class="modal-content">
							          <div class="modal-header">
							          	  <h4 class="modal-title" align="left">리뷰 수정</h4>
							              <button type="button" class="close" data-dismiss="modal">&times;</button>
							          </div>
							          <div class="modal-body">
							              <div class="form-group" align="left">
							                  <label for="sellerEmail">판매자</label>
							                  <input class="form-control" id="sellerEmail" name="sellerEmail" readonly>
							              </div>
							              <div class="form-group" align="left">
							                  <label for="productName">상품명</label>
							                  <input class="form-control" id="productName" name="productName" readonly>
							              </div>
							              <div class="form-group" align="left">
							                  <label for="reviewScore">별점</label>
							                  <input class="form-control" id="reviewScore" name="reviewScore">
							              </div>
							              <div class="form-group" align="left">
							                  <label for="reviewContent">리뷰</label>
							                  <textarea class="form-control" id="reviewContent" name="reviewContent" style="height: 150px"></textarea>
							              </div>
							          </div>
							          <div class="modal-footer">
							              <button type="button" class="btn btn-success modalModBtn" style="background-color: #90abf5; color: white;">수정</button>
							              <button type="button" class="btn btn-danger modalDelBtn" style="background-color: #6e656d; color: white;">삭제</button>
							          </div>
							      </div>
							  </div>
							</div>							
							
							
							
								<%-- <td colspan="2" style="text-align: right;">
									<c:if test="${ product.listData.productPostStatus eq '0'.charAt(0) }">
										<a href="<c:url value='/product/modify/${ product.listData.productId }' />" class="btn btn-default" style="background-color: #90abf5; color: white;">수정</a>
										<a class="btn btn-default" style="background-color: #6e656d; color: white;" onclick="deleteProduct(${ product.listData.productId })">삭제</a>
									</c:if>
								</td> --%>
							
							
							
						
					</div>
				</div>
			</div>
	
	
	<jsp:include page="../include/footer.jsp" />
	
</body>


<script>

//start jQuery
$(function() {
	
	// 리뷰 수정창 호출시 값 그대로 가져가기
	$("#reviewBtn").click(function() {
	    var sellerEmail = "${product.listData.sellerEmail}";
	    var productName = "${product.listData.productName}";
	    var reviewScore = "${review.reviewScore}";
	    var reviewContent = "${review.reviewContent}";

	    $("#sellerEmail").val(sellerEmail);
	    $("#productName").val(productName);
	    $("#reviewScore").val(reviewScore);
	    $("#reviewContent").val(reviewContent);
	});	
	
	
	// 리뷰 수정 이벤트
	$(".modalModBtn").click(function () {
		
	  	//리뷰 자바스크립트 객체 생성
		const review = {
			reviewId: "${review.reviewId}",
			reviewScore: $("#reviewScore").val(),
			reviewContent: $("#reviewContent").val()
		};
	    
	    // AJAX통신
	    $.ajax({
	        type : "POST",
	        url : "/fieldluxe/review/updateReview",
	        headers : {
	            "Content-type" : "application/json"
	        },
	        contentType : "application/json; charset=UTF-8",
	        dataType : "text",
	        data : JSON.stringify(review),
	        success : function(result) {
	            console.log("result : " + result);
	            if (result === "updateSuccess") {
	                alert("리뷰 수정 완료");
	                $("#modifyModal").modal("hide"); // Modal 닫기
	                location.reload();
	            }
	        },
            error: function(request, error) {
            	console.log("통신 실패");
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
	    });
	});
	

	// 리뷰 삭제 이벤트
	$(".modalDelBtn").click(function () {
		
	    // 리뷰 번호
	    var reviewId = "${review.reviewId}";
	    
	    // AJAX통신
	    $.ajax({
	        type : "POST",
	        url : "/fieldluxe/review/deleteReview",
	        headers : {
	            "Content-type" : "application/json"
	        },
	        contentType : "application/json; charset=UTF-8",
	        dataType : "text",
	        data : reviewId,
	        success : function(result) {
	            console.log("result : " + result);
	            if (result === "deleteSuccess") {
	                alert("리뷰 삭제 완료");
	                $("#modifyModal").modal("hide"); // Modal 닫기
	                location.reload();
	            }
	        },
            error: function(request, error) {
            	console.log("통신 실패");
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
	    });
	});
	
	
});	//end jQuery
	
	
</script>	


</html>