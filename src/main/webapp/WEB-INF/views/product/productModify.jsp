<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<style type="text/css">
.thumbnail {
	display: block;
}

.pro-re {
	width: 900px;
	text-align: center;
	margin: 0 auto;
}

#preview img {
	width: 150px;
	height: 100px;
}

#preview p {
	text-overflow: ellipsis;
	overflow: hidden;
}

.preview-box {
	padding: 5px;
	border-radius: 2px;
	margin-bottom: 10px;
	display: inline-block;
}

.preview-box img {
	display: block;
}

@media screen and (max-width: 800px) {
	.pro-re {
		width: 100%;
	}
	.show-table {
		overflow-x: auto;
	}
	.table {
		width: 100%;
		min-width: 500px;
	}
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<div class="contanier">
	<div class="pro-re">
		<h2 style="text-align:center;">상품 재등록</h2>
			<div class="show-table">
				<!--<c:if test=""> 관리자일 경우 -->
					<h4 style="margin-top:20px;float:left;"><strong>반려사유</strong></h4>
					<textarea rows="5" cols="120" style="resize: none;"></textarea>
				<!--</c:if>-->
				<form method="post" name="form">
					<h4 style="display: inline-flex; float: left;">상품정보 입력</h4>
					<h6 style="display: inline-flex; margin-left: 20px; float: left;">모든항목을 정확하게 기입하세요</h6>
					<table class="table">
						<tr class="form-group">
							<td><label for="productCategory">카테고리</label></td>
							<td>
								<select name="productCategory" class="selectpicker" id="productCategory" name="productCategory" style="width: 100%; height: 30px; font-size: 15px;">
									<option value="0">카테고리</option>
									<c:choose>
										<c:when test="${ product.listData.productCategory == 1 }">
											<option value="1" selected>의류</option>
											<option value="2">가방</option>
											<option value="3">신발</option>
										</c:when>
										<c:when test="${ product.listData.productCategory == 2 }">
											<option value="1">의류</option>
											<option value="2" selected>가방</option>
											<option value="3">신발</option>
										</c:when>
										<c:otherwise>
											<option value="1">의류</option>
											<option value="2">가방</option>
											<option value="3" selected>신발</option>
										</c:otherwise>
									</c:choose>
								</select>
							</td>
						</tr>
						<tr class="form-group">
							<td><label for="productBrand">브랜드명</label></td>
							<td>
								<input type="text" class="form-control" id="productBrand" name="productBrand" value="${ product.listData.productBrand }">
							</td>
						</tr>
						<tr class="form-group">
							<td><label for="productName">모델명</label></td>
							<td>
								<input type="text" class="form-control" id="productName" name="productName" value="${ product.listData.productName }">
							</td>
						</tr>
						<tr class="form-group">
							<td><label for="productModelNumber">모델번호</label></td>
							<td>
								<input type="text" class="form-control" id="productModelNumber" name="productModelNumber" value="${ product.detailData.productModelNumber }">
							</td>
						</tr>
						<tr class="form-group">
							<td><label for="productColor">대표색상</label></td>
							<td>
								<input type="text" class="form-control" id="productColor" name="productColor" value="${ product.detailData.productColor }">
							</td>
						</tr>
						<tr class="form-group">
							<td><label for="releaseDate">출시일</label></td>
							<td>
								<input type="date" class="form-control" id="releaseDate" name="releaseDate" value="${ product.detailData.releaseDate }">
							</td>
						</tr>
						<tr class="form-group">
							<td><label for="releasePrice">발매가</label></td>
							<td>
								<input type="number" class="form-control" id="releasePrice" name="releasePrice" value="${ product.detailData.releasePrice }">
							</td>
						</tr>
						<tr class="form-group">
							<td><label for="productSize">사이즈</label></td>
							<td>
								<input type="text" class="form-control" id="productSize" name="productSize" value="${ product.detailData.productSize }">
							</td>
						</tr>
					</table>
					<h4 style="float: left;">상품정보 입력</h4>
					<table class="table">
						<tr class="form-group">
							<td><label for="sellerEmail">판매자 이메일</label></td>
							<td>
								${ product.listData.sellerEmail }
								<input type="hidden"name="sellerEmail" value="${ product.listData.sellerEmail }">
							</td>
						</tr>
						<tr class="form-group">
							<td><label for="dealing">거래방식</label></td>
							<td>
								<c:choose>
									<c:when test="${ product.dealData.dealMethod == 1 }">
										<label class="radio-inline">
											<input type="radio" name="dealMethod" onclick="changeMethod()" value="1" checked>즉시구매방식
										</label>
										<label class="radio-inline">
											<input type="radio"name="dealMethod" onclick="changeMethod()" value="2">경매입찰방식
										</label>
										<label class="radio-inline">
											<input type="radio" name="dealMethod" onclick="changeMethod()" value="3">둘 다
										</label>
									</c:when>
									<c:when test="${ product.dealData.dealMethod == 2 }">
										<label class="radio-inline">
											<input type="radio" name="dealMethod" onclick="changeMethod()" value="1">즉시구매방식
										</label>
										<label class="radio-inline">
											<input type="radio"name="dealMethod" onclick="changeMethod()" value="2" checked>경매입찰방식
										</label>
										<label class="radio-inline">
											<input type="radio" name="dealMethod" onclick="changeMethod()" value="3">둘 다
										</label>
									</c:when>
									<c:otherwise>
										<label class="radio-inline">
											<input type="radio" name="dealMethod" onclick="changeMethod()" value="1">즉시구매방식
										</label>
										<label class="radio-inline">
											<input type="radio"name="dealMethod" onclick="changeMethod()" value="2">경매입찰방식
										</label>
										<label class="radio-inline">
											<input type="radio" name="dealMethod" onclick="changeMethod()" value="3" checked>둘 다
										</label>
									</c:otherwise>
								</c:choose>
								
							</td>
						</tr>
						<tr class="form-group method1">
							<td>
								<label for="immediatePurchasePrice" class="method1">즉시구매가</label>
							</td>
							<td>
								<input type="number" class="form-control method1" id="immePrice" name="immePrice" value="${ product.listData.immePrice }">
							</td>
						</tr>
						<tr class="form-group method2">
							<td>
								<label for="minimumBidPrice" class="method2">최소입찰가</label>
							</td>
							<td>
								<input type="number" class="form-control method2" id="minAuctionPrice" name="minAuctionPrice" value="${ product.dealData.minAuctionPrice }">
							</td>
						</tr>
						<tr class="form-group method2">
							<td><label for="bidBond" class="method2">입찰보증금</label></td>
							<td>
								<!-- 백엔드에서 최소입찰가의 10% 입력, 프론트에서는 10%가 얼마인지 보여주기만 -->
								<input type="number" class="form-control method2" id="auctionDeposit" value="${ product.dealData.auctionDeposit }" readonly>
							</td>
						</tr>
					</table>
					<table style="width: 100%">
						<tr>
							<td><h4 style="display: inline-flex; float: left;">이미지첨부</h4></td>
							<td>
								<h6 style="display: inline-flex; margin-left: 20px; float: left;">정품인증서를 반드시 첨부해주세요.</h6>
								<br>
								<h6 style="display: inline-flex; margin-left: 20px; float: left;">썸네일로 적용될 이미지를 하나 선택해주세요.</h6>
							</td>
							<td>
								<div id="attach" style="display: block;">
									<label class="waves-effect waves-teal btn-primary" for="uploadInputBox" style="height: 30px; width: 100%; background-color: #9facf5; float: right;">
										<i class="fa fa-search"></i>내 컴퓨터에서 파일 찾기
									</label>
									<input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple />
								</div>
							</td>
						</tr>
					</table>
					<br>
					<!-- 미리보기 영역 -->
					<div id="preview" class="content" style="display: block;">
					</div>
					<div style="display: none;" id="images">
						${ product.detailData.images }
					</div>
					<textarea name="images" style="display: none;"></textarea>
					<input type="hidden" name="productThumbnail">
					<!-- multipart 업로드시 영역 -->
					<div id="uploadForm" style="display: inline-flex;"></div>
					<div>
						<h3 style="float: left;">판매자 한마디</h3>
						<table class="table">
							<tr>
								<td colspan="2">
									<textarea rows="10" cols="130" name="sellerWord" id="sellerWord" placeholder="내용을 입력해주세요" wrap="hard">${ product.detailData.sellerWord }</textarea>
								</td>
							</tr>
							<tr>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									게시물 검수 후 상품이 등록된 후에는 임의로 수정이나 삭제를 할 수 없습니다.
									<br>
									필요시 관리자에게 1:1문의 하십시오.
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="등록하기" class="btn btn-default" style="width: 300px; background-color: #8284ff; color: white;">
									<!-- <a href="#" type="button" class="btn btn-default" style="width:300px;background-color:#8284ff;color:white;" onclick="return confirm('등록하시겠습니까?')" >등록하기</a> -->
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<a type="button" class="btn btn-default" style="width: 300px; background-color: #ebcee8;" onclick="goBack()">취소하기</a>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script>
	// 선택한 거래 방식에 따라 input disabled
	function changeMethod() {
		var dealMethod = $("input[name='dealMethod']:checked").val();
		if (dealMethod == "1") {
			$("#immePrice").attr("disabled", false);
			$("#minAuctionPrice").attr("disabled", true);
		}
		else if (dealMethod == "2") {
			$("#immePrice").attr("disabled", true);
			$("#minAuctionPrice").attr("disabled", false);
		}
		else {
			jQuery("#immePrice").attr("disabled", false);
			jQuery("#minAuctionPrice").attr("disabled", false);
		}
	}

//	기존 취소 버튼
//	function goBack() {
//		location.href="/fieldluxe/product/list";
//	}

	function goBack() {
		console.log($("#sellerWord").val());
	}

	//임의의 file object영역
	var files = {};
	var previewIndex = $("#images img").length;
	// image preview 기능 구현
	// input = file object[]
	function addPreview(input) {
	    if (input[0].files) {
	        //파일 선택이 여러개였을 시의 대응
	        for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
	            var file = input[0].files[fileIndex];
	
	            if (validation(file.name))
	                continue;
	
	            var reader = new FileReader();
	            reader.onload = function(img) {
	                //div id="preview" 내에 동적코드추가.
	                //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
	                var imgNum = previewIndex++;
	                $("#preview").append(
	                                "<div class=\"preview-box\" value=\"" + imgNum +"\">"
									+ "<img class=\"thumbnail\" value=\"" + imgNum + "\" name=\"image\" src=\"" + img.target.result + "\"\/>"
									+ "<input type=\"button\" name=\"selector\" class=\"btn btn-primary\" value=\"썸네일 선택\" style=\"display:inline-block;\""
									+ "onclick=\"selectThumbnail(" + imgNum + ", this)\">"
									+ "<input type=\"button\" class=\"btn btn-danger\" value=\"삭제\" style=\"display:inline-block;\""
									+ "onclick=\"deletePreview(" + imgNum + ")\"></div>");
	                files[imgNum] = file;
	                $("#images").append("<img id=\"" + imgNum + "\" src=\"" + img.target.result + "\">");
	                $("#uploadInputBox").val("");
	            };
	            reader.readAsDataURL(file);
	        }
	    }
	}
	
	//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	function selectThumbnail(imgNum, btn) {
		$("input[name=productThumbnail]").val("<img src=\"" + $(".preview-box img[value=" + imgNum + "]").attr("src") + "\">");
	    var thumbnailButtons = $("#preview .preview-box input[name=selector]");
	    var imgs = $(".thumbnail");
	    for (var i = 0; i < thumbnailButtons.length; i++) {
	    	thumbnailButtons[i].value = "썸네일 선택";
	    	thumbnailButtons[i].disabled = false;
	    	imgs[i].removeAttribute("id");
	    }
		$(".thumbnail[value=" + imgNum + "]")[0].setAttribute("id", "t");
	    btn.value = "현재 썸네일";
	    btn.disabled = true;
	}
	
	//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	function deletePreview(imgNum) {
	    if ($("input[name=productThumbnail]").val().length > 0) {
	    	var attr = $("#preview .preview-box[value=" + imgNum + "] input[name=selector]").attr("disabled");
	    	if (attr == 'disabled') {
	    		$("input[name=productThumbnail]").val("");
	    	}
	    }
	    delete files[imgNum];
	    $("#preview .preview-box[value=" + imgNum + "]").remove();
	    $("#images img[id=" + imgNum + "]").remove();
	}
	
	//client-side validation
	//always server-side validation required
	function validation(fileName) {
		fileName = fileName + "";
		var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
		var fileNameExtension = fileName.toLowerCase().substring(
			fileNameExtensionIndex, fileName.length);
		if (!((fileNameExtension === 'jpg') || (fileNameExtension === 'gif')
				|| (fileNameExtension === 'png') || (fileNameExtension === 'jpeg'))) {
			return true;
		} else {
			return false;
		}
	}
	
	$(document).ready(function() {
		$("form[name=form]").bind("submit", function() {
			
			// 썸네일 선택 확인
			if ($("input[name=productThumbnail]").val().length < 1) {
				alert("썸네일로 적용할 이미지를 선택해주세요.");
				$("#attach").focus();
				return false;
			}
			// 카테고리 선택 확인
			if ($("select[name=productCategory]").val() == "0") {
				alert("등록하려는 물품의 카테고리를 정해주세요.");
				$("select[name=productCategory]").focus();
				return false;
			}
			// input images에 값 설정
			var imgs = {};
			var imgtag = "";
		    imgs = $("#preview .preview-box img[name=image]");
		    for (var i = 0; i < imgs.length; i++) {
		    	imgtag += "<img src=\"" + imgs[i].src + "\">";
		    }
		    $("textarea[name=images]").text(imgtag);
			// 최종 등록 확인
			if (confirm("등록하시겠습니까?")) {
				return true;
			} else {
				return false;			
			}
		});
		var img = $("#images img");
		for (var i = 0; i < img.length; i++) {
			if (img[i].id == "t") {
				 $("#preview").append(
	                     "<div class=\"preview-box\" value=\"" + i +"\">"
							+ "<img class=\"thumbnail\" id=\"t\" value=\"" + i + "\" name=\"image\" src=\"" + img[i].src + "\"\/>"
							+ "<input type=\"button\" name=\"selector\" class=\"btn btn-primary\" value=\"썸네일 선택\" style=\"display:inline-block;\""
							+ "onclick=\"selectThumbnail(" + i + ", this)\">"
							+ "<input type=\"button\" class=\"btn btn-danger\" value=\"삭제\" style=\"display:inline-block;\""
							+ "onclick=\"deletePreview(" + i + ")\"></div>");
			} else {
				 $("#preview").append(
	                     "<div class=\"preview-box\" value=\"" + i +"\">"
							+ "<img class=\"thumbnail\" value=\"" + i + "\" name=\"image\" src=\"" + img[i].src + "\"\/>"
							+ "<input type=\"button\" name=\"selector\" class=\"btn btn-primary\" value=\"썸네일 선택\" style=\"display:inline-block;\""
							+ "onclick=\"selectThumbnail(" + i + ", this)\">"
							+ "<input type=\"button\" class=\"btn btn-danger\" value=\"삭제\" style=\"display:inline-block;\""
							+ "onclick=\"deletePreview(" + i + ")\"></div>");
			}
		}
		$("#images").html("");
		var thumbnail = $(".preview-box #t")[0];
		var thumbnailValue = thumbnail.getAttribute("value");
		var thumbnailBtn = $(".preview-box[value=" + thumbnailValue + "] input[name=selector]")[0];
		thumbnailBtn.value = "현재 썸네일";
		thumbnailBtn.disabled = true;
		$("input[name=productThumbnail]").val("<img src=\"" + $(".preview-box img[value=" + thumbnailValue + "]").attr("src") + "\">");
		$('#attach input[type=file]').change(function() {
			addPreview($(this));
		});
		changeMethod();
	});
	</script>
</body>
</html>