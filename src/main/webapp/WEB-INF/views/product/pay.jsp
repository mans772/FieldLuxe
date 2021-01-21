<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<h1>결제 화면</h1>
<hr>
대표 이미지
<br>
${ product.listData.productThumbnail }
<br>
<table>
	<tr>
		<td>브랜드</td>
		<td>${ product.listData.productBrand }</td>
	</tr>
	<tr>
		<td>상품명</td>
		<td>${ product.listData.productName }</td>
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
<br>
<c:if test="${ product.dealData.dealMethod != 2}">
	<h3>즉시 구매</h3>
	<hr>
	<table>
		<tr>
			<td>즉시구매가</td>
			<td>${ product.listData.immePrice }</td>
		</tr>
		<tr>
			<td>쿠폰</td>
			<td>쿠폰 선택</td>
		</tr>
		<tr>
			<td>배송비</td>
			<td>0원</td>
		</tr>
		<tr>
			<td>총 결제금액</td>
			<td id="immePrice">${ product.listData.immePrice }</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="즉시구매방식 선택" onclick="pay(1)"></td>
		</tr>
	</table>
</c:if>
<hr>
<c:if test="${ product.dealData.dealMethod != 1}">
	<h3>경매 입찰</h3>
	<hr>
	<table>
		<tr>
			<td>입찰희망가</td>
			<c:if test="${ product.dealData.nowAuctionPrice == 0 or product.dealData.nowAuctionPrice eq null }">
				<td><input type="number" name="nowAuctionPrice" value="${ product.dealData.minAuctionPrice }"></td>
			</c:if>
			<c:if test="${ product.dealData.nowAuctionPrice != 0 }">
				<td><input type="number" name="nowAuctionPrice" value="${ product.dealData.nowAuctionPrice + 10000 }"></td>
			</c:if>
		</tr>
		<tr>
			<td>쿠폰</td>
			<td>쿠폰 선택</td>
		</tr>
		<tr>
			<td>배송비</td>
			<td>0원</td>
		</tr>
		<tr>
			<td>총 결제금액</td>
			<c:if test="${ product.dealData.nowAuctionPrice == 0 or product.dealData.nowAuctionPrice eq null }">
				<td id="nowAuctionPrice">${ product.dealData.minAuctionPrice }</td>
			</c:if>
			<c:if test="${ product.dealData.nowAuctionPrice != 0 }">
				<td id="nowAuctionPrice">${ product.dealData.nowAuctionPrice + 10000 }</td>
			</c:if>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="경매입찰방식 선택" onclick="pay(2)"></td>
		</tr>
	</table>
</c:if>
<hr>
<h1>배송정보입력</h1>
<table>
	<tr>
		<td>이름</td>
		<td colspan="2"><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<td>우편번호</td>
		<td><input type="text" name="postNum" id="postNum" placeholder="우편번호"></td>
		<td><input type="button" onclick="findPostCode()" value="우편번호 찾기"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td colspan="2"><input type="text" id="address" placeholder="주소"></td>
	</tr>
	<tr>
		<td>상세주소</td>
		<td colspan="2"><input type="text" id="detailAddress" placeholder="상세주소"></td>
	</tr>
</table>

<script>
	function findPostCode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	            
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postNum').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}
</script>
<input type="button" value="결제하기" onclick="pay()">
<script>
	function pay(method) {
		var IMP = window.IMP; // 생략가능
		var price;
		if (method == 1) {
			price = $("#immePrice").text();
		} else {
			price = $("#nowAuctionPrice").text();
		}
		
		IMP.init("imp98236427"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
		IMP.request_pay({
			pg : 'html5_inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			escrow : true,
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명:결제테스트',
			amount : price,
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
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