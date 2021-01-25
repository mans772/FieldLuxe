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
<style type="text/css">
.pro-de {
	width:950px;
	text-align:center;
	display:block;
	margin:50px auto;
}

@media screen and (max-width: 786px) {
	.pro-de {
		width:100%;
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
<jsp:include page="../include/header.jsp"/>
<div class="contanier">
	
		<div class="pro-de">
		 	<div class="col-md-6">
		 		<img alt="" src="../img/handbag1.jpg<%-- <%= %> --%>" style="width:350px;height:350px;margin-top:100px;">
		 	</div>
			<div class="col-md-6">
			<div class="show-table">
				<h3><strong>VALENCIAGA<%-- <%= %> --%></strong></h3>
				<h4>Balenciaga Track Trainer Grey White2019<%-- <%= %> --%></h4>
					
				<h4 style="margin-top:20px;'">상품정보</h4>
				<table class="table">
					<tr>
						<td>브랜드</td>
						<td>Balenciaga<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>모델번호</td>
						<td>542023W1GB71214<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>대표색상</td>
						<td>Grey/Grey-White<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>출시일</td>
						<td>2019.10.12<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>발매가</td>
						<td>$895(약 971.200원)<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>사이즈</td>
						<td>240mm<%-- <%= %> --%></td>
					</tr>
				</table>
			
				<h4>구매정보</h4>
				<table class="table">
					<tr>
						<td>판매자</td>
						<td>Annie<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>거래방식</td>
						<td>경매입찰방식/즉시 구매방식<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>즉시구매가</td>
						<td>1,400,000원<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>최소입찰가</td>
						<td>800,000원<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>입찰보증금</td>
						<td>최소입찰가의 10%<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>입찰기간</td>
						<td>2021.01.03~2021.01.15<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td>현재입찰가</td>
						<td>850,000원<%-- <%= %> --%></td>
					</tr>
					<tr>
						<td colspan="2">
						<a href="#" class="btn btn-default" name="buy-btn" style="width:200px;height:33px;background-color:#916d90;color:white;">구매</a>
			</table>
			</div>
		</div>
		<div class="show-table2">
		
			<div id="image_container" class="col-md-3 col-sm-6" style="display:inline-flex;width:250px;float:left;"></div>
			<div style="">
				<table class="table t2">
					<tr>
						<td style="margin-left:20px; float:left;"><h4>판매자 한마디</h4></td>
					</tr>
					<tr>
						<td style="margin-left:20px;">
							<textarea row="5" cols="120" style="border:none;" name="sellerComent"><%-- <%= %> --%>현재 단종된 한정판 상품이에요</textarea>
						</td>
					</tr>
				
				</table>
			</div>
		
			<div style="margin-top:50px;">
			<h4 style="margin-left:20px; float:left;"> 구매자 리뷰</h4>
			<table class="table t3">
				<tr>
					<td>구매자</td>
					<td>Sunny<%-- <%= %> --%></td>
				</tr>
				<tr>
					<td>등록일</td>
					<td>2021.01.04<%-- <%= %> --%></td>
				</tr>
				<tr>
					<td>별점</td>
					<td>★★★★★<%-- <%= %> --%></td>
				</tr>
				<tr>
					<td>리뷰</td>
					<td>물건 참좋네요</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:right;">
					<a href="#" class="btn btn-default" style="background-color:#90abf5;color:white;">수정</a>
					<a href="#" class="btn btn-default"style="background-color:#6e656d;color:white;">삭제</a>
					</td>
				</tr>
			</table>
			</div>
		</div>
      </div>
	
</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>