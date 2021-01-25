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
 
<script> /* 다음주소검색 */
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>

<style type="text/css">
.pro-de {
	width:1000px;
	text-align:center;
	display:block;
	margin-top:50px;
	margin-bottom:100px;
}
.btn btn-default {
	
	width:120px;
	height:30px;
	font-size:18px;
	margin:30px 10px;
}
@media screen and (max-width: 800px) {
	.pro-de {
		width:100%;
	}
	.btn1 {
		display:block;
	}
	.show-table{
		overflow-x: auto;
	}
	.table {
		width: 100%;
		min-width: 500px;
	}
	
	.show-table2{
		overflow-x: auto;
	}
	.show-table3{
		overflow-x: auto;
	}
}
</style>

</head>
<body>
<jsp:include page="../include/header.jsp" />
<div class="container" style="font-family:Malgun gothic;">
	
		<div class="pro-de">
		<h3 style="margin:50px 35px;text-align:left;">구매방식 선택</h3>
		<div>
		<div class="col-md-6">
		 		<img alt="" src="../img/handbag1.jpg<%-- <%= %> --%>" style="height:265px;">
				<div class="show-table">
				<table class="table" style="margin-top:20px;">
					<tr>
						<td>브랜드</td>
						<td>Balenciaga<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td>Balenciaga Track Trainer Grey White 2019<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>모델번호</td>
						<td>542023W1GB71214<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>사이즈</td>
						<td>240mm<%-- <%= %> --%></td>
					</tr>
				</table>
				</div>
			</div>
		
			<div class="col-md-6">
			<div class="show-table2">
				<h4>즉시구매</h4>
				<table class="table">
					<tr>
						<td>즉시구매가</td>
						<td>1,500,000원<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>쿠폰</td>
						<td><select name="order" class="selectpicker" style="width:200px;height:30px;font-size:15px;">
			 					<option>보유쿠폰</option>
								<option>10% 할인 쿠폰</option>
								<option>20% 할인 쿠폰</option>
								<option>30% 할인 쿠폰</option>
							</select></td>
					</tr>
					<tr>
						<td>배송비</td>
						<td>0원<%-- <%= %> --%></td>
					</tr>
					<tr style="background-color:#d6e5ff;">
						<td>총결제금액</td>
						<td>1,350,000</td>
					</tr>
					<tr>
						<td colspan="2">
						<a href="#" class="btn btn-default" style="width:170px;height:35px;background-color:#807a7e;color:white;">즉시구매방식 선택</a>
				</table>
				<h4 style="margin-top:30px;">경매입찰</h4>
				<table class="table">
					<tr>
						<td>입찰희망가</td>
						<td><input type="text" name="" style="width:200px;height:30px;"></td>
					</tr>
						<tr>
						<td>쿠폰</td>
						<td><select name="order" class="selectpicker" style="width:200px;height:30px;font-size:15px;">
			 					<option>보유쿠폰</option>
								<option>10% 할인 쿠폰</option>
								<option>20% 할인 쿠폰</option>
								<option>30% 할인 쿠폰</option>
							</select></td>
					</tr>
					<tr>
						<td>배송비</td>
						<td>0원<%-- <%= %> --%></td>
					</tr>
					<tr style="background-color:#d6e5ff;">
						<td>총결제금액</td>
						<td>1,350,000</td>
					</tr>
					<tr>
						<td colspan="2">
						<a href="#" class="btn btn-default" style="width:170px;height:35px;background-color:#807a7e;color:white;">경쟁입찰방식 선택</a>
				</table>
				</div>
				</div>
			</div>
				<br><br>
				
		
		<div class="show-table3" style="margin-top:30px;" >
			<h3 style="display:inline-flex; float:left; margin-top:70px">배송정보입력</h3>
			<form action="#" method="post" style="display:inline-flex;float:right;margin-top:70px">
  				<input   type="checkbox" id="userInfo" name="userInfo" value="<%-- ${ } --%>">
  				<label for="userInfo"> 회원정보에서 가져오기</label><br>
  			</form>
			<table class="table">
				<tr>
  					<td><label class="control-label" for="name">이름</label></td>
                    <td><input class="form-control" style="width:80%" id="name" name="name" placeholder="수령인의 이름을 입력하세요"></td>
				</tr>
				<tr>
					<td><label class="control-label" for="tel">휴대폰번호</label></td>
					<td><input class="form-control" style="width:80%" name="tel" placeholder="-없이 입력"></td>
				</tr>
				<tr>
         			<td><label class="control-label" for="zipcode">우편번호</label></td>
            		<td><input class="form-control" style="width:60%; display:inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
    					<button style="width:130px; type="button" class="btn" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
    				</td>
 		 		</tr>
         		<tr>
        			<td><label class="control-label" for="address">주소</label></td>
            		<td> <input class="form-control" style="top: 5px;width:80%;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" /></td>
         		</tr>
           
         		<tr>
         			<td><label class="control-label" for="detailaddress">상세주소</label></td>
            		<td><input class="form-control" style="width:80%" placeholder="상세주소" name="addr3" id="addr3" type="text"  /></td>
         		</tr>
         		<tr>
         			<td colspan="2" style="text-align:center;">
         				<form action="#" method="post" style="display:inline-flex;">
  						<input   type="checkbox" id="userAddress" name="userAddress" value="<%-- ${ } --%>">
  						<label for="userAddress">기본배송지로 설정</label><br>
  						</form>
  					</td>
  				</tr>
			</table>
		</div>
		<hr>
		<div class="show-table4">
		<h3 style="float:left;">결제방법 선택</h3>
			<table class="table">
				<tr>
				<td style="text-align:left;background-color:#d6e5ff;font-size:20px;"><strong>최종결제금액</strong></td>
				<td style="text-align:left;background-color:#d6e5ff;font-size:20px;"><strong>810,000원<%-- <%= %> --%></strong></td>
				</tr>
				<tr>
  					<td colspan="2">
  						<form action="#" method="post" style="display:inline-flex;margin-top:30px;">
  						<input   type="checkbox" id="paymentProgressAgreement" name="paymentProgressAgreement" value="<%-- ${ } --%>">
  						<label for="paymentProgressAgreement">결제 진행 필수사항 동의</label><br>
  						</form>
  						<p>개인정보 제 3자 제공및 결제대행서비스 표준 이용약관</p>
  					</td>
  				</tr>
  			</table>
  			<a href="#"  type="button" class="btn btn-primary" style="text-align:center;width:350px;height:auto; ">결제하기</a>	
  		</div>
	</div>
	
</div>	
<jsp:include page="../include/footer.jsp" />
<script type="text/javascript">
function execPostCode() {/* 다음 주소 검색 */
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}





</script>
</body>
</html>