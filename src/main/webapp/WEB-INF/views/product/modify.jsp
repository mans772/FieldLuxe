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
	<h1>물품 수정</h1>
	<hr>
	<form method="post" name="form">
		<input type="hidden" name="_method" value="put">
		<input type="hidden" name="sellerEmail" value="a@a.com">
		<input type="file" name="thumbnailSelector" id="thumbnailSelector" accept="image/*" onchange="handleFileSelect(event)"><br>
		<input type="hidden" name="productThumbnail" id="thumbnail" value="${ product.listData.productThumbnail }">
		<div id="thumbnailDiv" style="width: 30%;">${ product.listData.productThumbnail }</div>
		<input type="text" name="productName" placeholder="이름" value="${ product.listData.productName }"><br>
		<input type="text" name="productModelNumber" placeholder="모델번호" value="${ product.detailData.productModelNumber }"><br>		
		<input type="text" name="productBrand" placeholder="브랜드명" value="${ product.listData.productBrand }"><br>
		<input type="text" name="productColor" placeholder="색" value="${ product.detailData.productColor }"><br>

		<select name="productCategory" id="productCategory">
			<option value="1"<c:if test="${ product.listData.productCategory == 1 }">selected</c:if>>1</option>
			<option value="2"<c:if test="${ product.listData.productCategory == 2 }">selected</c:if>>2</option>
			<option value="3"<c:if test="${ product.listData.productCategory == 3 }">selected</c:if>>3</option>
		</select><br>
		
		<input type="number" name="releasePrice" placeholder="출시가" value="${ product.detailData.releasePrice }"><br>
		<input type="text" name="productSize" placeholder="사이즈" value="${ product.detailData.productSize }"><br>
		<input type="date" name="releaseDate" value="${ product.detailData.releaseDate }"><br>
		
		<input type="radio" name="dealMethod" value="1" onclick="viewInputTag()"
		<c:if test="${ product.dealData.dealMethod == 1 }">checked</c:if>>일반 판매
		<input type="radio" name="dealMethod" value="2" onclick="viewInputTag()"
		<c:if test="${ product.dealData.dealMethod == 2 }">checked</c:if>>경매
		<input type="radio" name="dealMethod" value="3" onclick="viewInputTag()"
		<c:if test="${ product.dealData.dealMethod == 3 }">checked</c:if>>둘 다
		<br>
		<c:choose>
			<c:when test="${ product.dealData.dealMethod == 1 }">
				<input type="number" name="immePrice" id="immePrice" placeholder="즉시판매가" value="${ product.listData.immePrice }" style="display: block;">
				<input type="number" name="minAuctionPrice" id="minAuctionPrice" placeholder="최소경매가" style="display: none;">
			</c:when>
			<c:when test="${ product.dealData.dealMethod == 2 }">
				<input type="number" name="immePrice" id="immePrice" placeholder="즉시판매가" style="display: none;">
				<input type="number" name="minAuctionPrice" id="minAuctionPrice" placeholder="최소경매가" value="${ product.dealData.minAuctionPrice }" style="display: block;">
			</c:when>
			<c:otherwise>
				<input type="number" name="immePrice" id="immePrice" placeholder="즉시판매가" value="${ product.listData.immePrice }" style="display: block;">
				<input type="number" name="minAuctionPrice" id="minAuctionPrice" placeholder="최소경매가" value="${ product.dealData.minAuctionPrice }" style="display: block;">
			</c:otherwise>
		</c:choose>
		
		<hr>
		<div style="height: auto; width: 100%; border: 1px solid gold;">
			<br>
				<div id="imageContainer">${ product.detailData.images }</div>
			<br>
		</div>
		<input type="hidden" name="images" id="images">
		<input type="file" id='imageadd' accept="image/*" onchange="setImage(event)" style="display: none;">
		<img src='<c:url value="/resources/imgs/imageadd.png"/>' border='0' onclick='$("#imageadd").click();'>
		<input type="button" value="이미지 제거" onclick="removeImage();">
		<hr>
		<textarea name="sellerWord" placeholder="판매자 한마디" rows="5" style="width: 100%; resize: none;">${ product.detailData.sellerWord }</textarea>
		<br>
		<input type="submit" value="등록">
	</form>
	
	<script>
		$(document).ready(function() {
			$('form[name="form"]').bind('submit', function() {
				var image = $('#imageContainer').html();
				var thumbnail = $('#thumbnailDiv').html();
				$('#images').val(image);
				$('#thumbnail').val(thumbnail);
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