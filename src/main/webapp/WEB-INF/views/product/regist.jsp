<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
<style type="text/css">
#imageContainer img{
	display: block;
	position: relative; top:0; left: 0;
	width: 100%;
	height: 100%;
}
#thumbnailDiv img{
	display: block;
	position: relative; top:0; left: 0;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<h1>물품 등록</h1>
	<hr>
	<form method="post" name="form">
		<input type="hidden" name="sellerEmail" value="a@a.com">
		<input type="file" name="thumbnailSelector" id="thumbnailSelector" accept="image/*" onchange="handleFileSelect(event)"><br>
		<input type="hidden" name="productThumbnail" id="thumbnail">
		<div id="thumbnailDiv" style="width: 30%;">
		</div>
		<input type="text" name="productName" placeholder="이름" value="물품 이름 A"><br>
		<input type="text" name="productModelNumber" placeholder="모델번호" value="AAA-BBB"><br>
		<input type="text" name="productBrand" placeholder="브랜드명" value="브랜드 A"><br>
		<input type="text" name="productColor" placeholder="색" value="검은색"><br>
		<select name="productCategory">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select><br>
		<input type="number" name="releasePrice" placeholder="출시가" value="3000000"><br>
		<input type="text" name="productSize" placeholder="사이즈" value="보통사이즈"><br>
		<input type="date" name="releaseDate"><br>
		
		<input type="radio" name="dealMethod" value="1" onclick="viewInputTag()">일반 판매
		<input type="radio" name="dealMethod" value="2" onclick="viewInputTag()">경매
		<input type="radio" name="dealMethod" value="3" onclick="viewInputTag()">둘 다
		<br>
		
		<input type="number" name="immePrice" id="immePrice" placeholder="즉시판매가" style="display: none;">
		<input type="number" name="minAuctionPrice" id="minAuctionPrice" placeholder="최소경매가" style="display: none;">
		<hr>
		<div style="height: auto; width: 100%; border: 1px solid gold;">
			<br>
				<div id="imageContainer"></div>
			<br>
		</div>
		<input type="hidden" name="images" id="images">
		<input type="file" id='imageadd' accept="image/*" onchange="setImage(event)" style="display: none;">
		<img src='<c:url value="/resources/imgs/imageadd.png"/>' border='0' onclick='$("#imageadd").click();'>
		<input type="button" value="이미지 제거" onclick="removeImage();">
		<hr>
		<textarea name="sellerWord" placeholder="판매자 한마디" rows="5" style="width: 100%; resize: none;"></textarea>
		<br>
		<input type="submit" value="등록">
		<input type="button" value="TEST" onclick="test()">
	</form>
	
	<script>
		$(document).ready(function() {
			$('form[name="form"]').bind('submit', function() {
				var image = $('#imageContainer').html();
				$('#images').val(image);
			});
		})
		function viewInputTag() {
			var dealMethod = $('input[name="dealMethod"]:checked').val();
			if (dealMethod == '1') {
				jQuery('#immePrice').css("display", "block");
				jQuery('#minAuctionPrice').css("display", "none");
				$('#minAuctionPrice').val(0);
			}
			else if (dealMethod == '2') {
				jQuery('#immePrice').css("display", "none");
				jQuery('#minAuctionPrice').css("display", "block");
				$('#immePrice').val(0);
			}
			else {
				jQuery('#immePrice').css("display", "block");
				jQuery('#minAuctionPrice').css("display", "block");
			}
		}
		
		function setImage(event) {
			var cnt = $('#imageContainer > img').length + 1;
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("id", cnt);
				img.setAttribute("src", event.target.result);
				document.querySelector("div#imageContainer").appendChild(img);
			};
			/* var size = Math.round(event.target.files[0].size / 1024 / 1024 * 100) / 100;
			alert('파일 크기 : ' + size + 'MB'); */
			reader.readAsDataURL(event.target.files[0]);
			$("#imageadd").val("");
		}
		
		function removeImage() {
			var id = $('#imageContainer > img').length;
			if (id > 0) {
				$('#' + id).remove();
			}
		}
		
		function handleFileSelect(event){
			var file = document.querySelector('#thumbnailSelector');
			var result;
			var reader = new FileReader();
			reader.onload = function(event) {
				result = event.target.result;
				$('#thumbnail').val("<img src='" + result + "'>");
				$('#thumbnailDiv').html($('#thumbnail').val());
			}
			reader.readAsDataURL(event.target.files[0]);
		}
	</script>

</body>
</html>