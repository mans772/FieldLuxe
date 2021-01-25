<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">
.pro-de {
	width: 950px;
	text-align: center;
	display: block;
	margin: 50px auto;
}
.btn btn-default {
	width: 120px;
	height: 30px;
	font-size: 18px;
	margin: 30px 10px;
}
@media screen and (max-width: 800px) {
	.pro-de {
		width: 100%;
	}
	.btn1 {
		display: block;
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
	.show-table3 {
		overflow-x: auto;
	}
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="pro-de">
				<div>
					<div class="col-md-6">
						${ product.listData.productThumbnail }
						<div class="show-table">
							<table class="table" style="margin-top: 20px;">
								<tr>
									<td>브랜드</td>
									<td id="productBrand">${ product.listData.productBrand }</td>
								</tr>
								<tr>
									<td>상품명</td>
									<td id="productName">${ product.listData.productName }</td>
								</tr>
								<tr>
									<td>모델번호</td>
									<td>${ product.detailData.productModelNumber }</td>
								</tr>
								<tr>
									<td>사이즈</td>
									<td>${ product.detailData.productSize }</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="col-md-6">
						<div class="show-table2">
							<c:if test="${ product.dealData.dealMethod != 2 }">
								<h3>즉시구매</h3>
								<table class="table">
									<tr>
										<td>즉시구매가</td>
										<td id="immePrice"><fmt:formatNumber value="${ product.listData.immePrice }" />원</td>
									</tr>
									<tr>
										<td>쿠폰</td>
										<td>
											<select name="order" class="selectpicker" style="width: 200px; height: 30px; font-size: 15px;">
												<option>보유쿠폰</option>
												<option>10% 할인 쿠폰</option>
												<option>20% 할인 쿠폰</option>
												<option>30% 할인 쿠폰</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>0원</td>
									</tr>
									<tr style="background-color: #d6e5ff;">
										<td>총결제금액</td>
										<td id="immePriceTotal"><fmt:formatNumber value="${ product.listData.immePrice }" />원</td>
									</tr>
									<tr>
										<td colspan="2">
											<a class="btn btn-default" style="width: 450px; height: 35px; background-color: #807a7e; color: white;" onclick="selectMethod(1)">즉시구매방식 선택</a>
										</td>
									</tr>
								</table>
							</c:if>
							<c:if test="${ product.dealData.dealMethod != 1 }">
								<h3>경매입찰</h3>
								<table class="table">
									<tr align="center">
										<td style="vertical-align: middle;">입찰희망가</td>
										<td id="auctionPrice">
											<input class="form-control" type="text" id="nowAuctionPrice" style="width: 65%; background-color: #fff; text-align: center;" readonly value="${ product.dealData.nowAuctionPrice }">
											<input class="btn btn-light" type="button" value="+10000">
											<input class="btn btn-light" type="button" value="+50000">
											<input class="btn btn-light" type="button" value="+100000">
										</td>
									</tr>
									<tr>
										<td>쿠폰</td>
										<td>
											<select name="order" class="selectpicker" style="width: 200px; height: 30px; font-size: 15px;">
												<option>보유쿠폰</option>
												<option>10% 할인 쿠폰</option>
												<option>20% 할인 쿠폰</option>
												<option>30% 할인 쿠폰</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>0원</td>
									</tr>
									<tr style="background-color: #d6e5ff;">
										<td>총결제금액</td>
										<td id="auctionPayment"></td>
									</tr>
									<tr>
										<td colspan="2">
											<a class="btn btn-default" style="width: 450px; height: 35px; background-color: #807a7e; color: white;" onclick="selectMethod(2)">경쟁입찰방식 선택</a>
										</td>
									</tr>
								</table>
							</c:if>
						</div>
					</div>
				</div>
				<br>
				<br>
				<div class="show-table3">
					<h3 style="display: inline-flex; float: left; margin-top: 70px">배송정보입력</h3>
					<form action="#" method="post" style="display: inline-flex; float: right; margin-top: 70px">
						<input type="checkbox" id="userInfo" name="userInfo" value="<%-- ${ } --%>">
						<label for="userInfo">회원정보에서 가져오기</label>
						<br>
					</form>
					<table class="table">
						<tr>
							<td><label class="control-label" for="name">이름</label></td>
							<td>
								<input class="form-control" style="width: 80%" id="name" name="name" placeholder="수령인의 이름을 입력하세요">
							</td>
						</tr>
						<tr>
							<td><label class="control-label" for="tel">휴대폰번호</label></td>
							<td>
								<input class="form-control" style="width: 80%" name="tel" placeholder="-없이 입력">
							</td>
						</tr>
						<tr>
							<td><label class="control-label" for="zipcode">우편번호</label></td>
							<td>
								<input class="form-control" style="width: 60%; display: inline; float: left; background-color: #fff;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly">
								<button style="width: 130px; float: left; margin-left: 20px;" class="btn" onclick="execPostCode();">
									<i class="fa fa-search"></i>우편번호 찾기
								</button>
							</td>
						</tr>
						<tr>
							<td><label class="control-label" for="address">주소</label></td>
							<td>
								<input class="form-control" style="top: 5px; width: 80%; background-color: #fff;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
							</td>
						</tr>

						<tr>
							<td><label class="control-label" for="detailaddress">상세주소</label></td>
							<td>
								<input class="form-control" style="width: 80%" placeholder="상세주소" name="addr3" id="addr3" type="text" />
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<form action="#" method="post" style="display: inline-flex;">
									<input type="checkbox" id="userAddress" name="userAddress" value=""> <label for="userAddress">기본배송지로 설정</label><br>
								</form>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="show-table4">
					<h3 style="float: left;">결제</h3>
					<table class="table">
						<tr>
							<td style="text-align: left; background-color: #d6e5ff; font-size: 20px;">
								<strong>결제 방식</strong>
							</td>
							<td style="text-align: left; background-color: #d6e5ff; font-size: 20px;">
								<c:if test="${ product.dealData.dealMethod == 1 }">
									<strong id="showMethod">즉시 구매</strong>
									<input type="hidden" id="dealMethod" value="1">
								</c:if>
								<c:if test="${ product.dealData.dealMethod == 2 }">
									<strong id="showMethod">경매 입찰</strong>
									<input type="hidden" id="dealMethod" value="2">
								</c:if>
								<c:if test="${ product.dealData.dealMethod == 3 }">
									<strong id="showMethod"></strong>
									<input type="hidden" id="dealMethod" value="3">
								</c:if>
							</td>
						</tr>
						<tr>
							<td style="text-align: left; background-color: #d6e5ff; font-size: 20px;">
								<strong>최종결제금액</strong>
							</td>
							<td style="text-align: left; background-color: #d6e5ff; font-size: 20px;">
								<strong id="paymentAmount">0원</strong>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<form action="#" method="post" style="display: inline-flex; margin-top: 30px;">
									<input type="checkbox" id="paymentProgressAgreement" name="paymentProgressAgreement" value="">
									<label for="paymentProgressAgreement">결제 진행 필수사항 동의</label><br>
								</form>
								<p>개인정보 제 3자 제공및 결제대행서비스 표준 이용약관</p>
							</td>
						</tr>
					</table>
					<a type="button" class="btn btn-primary" style="text-align: center; width: 350px; height: auto;" onclick="pay()">결제하기</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script type="text/javascript">
		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var fullRoadAddr = data.roadAddress;
					var extraRoadAddr = '';
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}
					console.log(data.zonecode);
					console.log(fullRoadAddr);
					$("[name=addr1]").val(data.zonecode);
					$("[name=addr2]").val(fullRoadAddr);
				}
			}).open();
		}
		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		function removeComma(str)
		{
			n = parseInt(str.replace(/,/g,""));
			return n;
		}
		function selectMethod(method) {
			if (method == 1) {
				$("#dealMethod").val(1);
				$("#showMethod").text("즉시 구매");
				$("#paymentAmount").text($("#immePriceTotal").text());
			} else if (method == 2) {
				$("#dealMethod").val(2);
				$("#showMethod").text("경매 입찰");
				$("#paymentAmount").text($("#auctionPayment").text());
			}
		}
		$(document).ready(function() {
			var dealMethod = ${ product.dealData.dealMethod };
			var minAuctionPrice = ${ product.dealData.minAuctionPrice };
			var nowAuctionPrice = $("#nowAuctionPrice").val();
			if (nowAuctionPrice == 0) {
				$("#nowAuctionPrice").val(numberWithCommas(minAuctionPrice + 50000));
				$("#auctionPayment").text($("#nowAuctionPrice").val() + "원");
			} else {
				$("#auctionPayment").text(numberWithCommas($("#nowAuctionPrice").val()) + "원");
			}
			$("#auctionPrice input[type=button]").click(function() {
				var amount = parseInt(this.value.substr(1, this.value.length));
				var now = removeComma($("#nowAuctionPrice").val());
				$("#nowAuctionPrice").val(numberWithCommas(now + amount));
				$("#auctionPayment").text($("#nowAuctionPrice").val() + "원");
			});
		});
		function pay(method) {
			var IMP = window.IMP; // 생략가능
			var price = $("#paymentAmount").text().substr(0, $("#paymentAmount").text().length - 1);
			price = removeComma(price);
			IMP.init("imp98236427"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
			IMP.request_pay({
				pg : 'html5_inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				escrow : true,
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : $("#productBrand").text() + " " + $("#productName").text(),
				amount : price,
				buyer_email : 'buyer@test.com',
				buyer_name : '구매자 이름',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456',
				m_redirect_url : '/test'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		}
	</script>
</body>
</html>