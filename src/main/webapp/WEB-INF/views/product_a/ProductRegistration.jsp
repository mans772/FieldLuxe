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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> <meta http-equiv="X-UA-Compatible" content="ie=edge" />


 
    
<style type="text/css">
	.pro-re{
		width:900px;
		text-align:center;
		margin:0 auto;
	}

 
   #preview img {
    width: 150px;
    height:100px;
}
#preview p {
    text-overflow: ellipsis;
    overflow: hidden;
}
.preview-box {
	
   	border: 1px solid;
    padding: 5px;
    border-radius: 2px;
    margin-bottom: 10px;
    display:inline-flex;
}
.show-table {
	margin-top:50px;

}

   @media screen and (max-width: 800px) {
   	.pro-re{
   		width:100%;
   	}
   	.show-table {
   		overflow-x: auto;
   		margin:0 5px;
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
<div class="contanier" style="font-family:Malgun gothic;">
	<div class="pro-re">
	<h2 style="text-align:center;">상품등록</h2>
		<div class="show-table">
		<form action="#" method="post">
		<h4 style="display:inline-flex;float:left;margin-bottom:30px;">상품정보 입력</h4>
		<h6 style="display:inline-flex;margin-left:20px;float:left;">모든 항목을 정확하게 기입하세요</h6>
			
			<table class="table">
				<tr class="form-group">
					<td>
 						<label for="kategorie">카테고리</label>
  					</td>
  					<td><!-- <input type="text" class="form-control" id="kategorie"> -->
  						<select name="kategorie" class="selectpicker" style="width:200px;height:30px;font-size:15px;">
			 				<option>의류</option>
							<option>가방</option>
							<option>신발</option>
						</select>
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="brandName">브랜드명</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="brandName" name="brandName">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="model">모델명</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="model" name="model">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="modelNumber">모델번호</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="modelNumber" name="modelNumber">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="color">대표색상</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="color" name="color">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="releaseDate">출시일</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="releaseDate" name="releaseDate">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="releasePrice">발매가</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="releasePrice" name="releasePrice">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="size">브랜드명</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="size" name="size">
					</td>
				</tr>
			</table>
			<h4 style="float:left; margin-top:50px; margin-bottom:30px;">상품정보 입력</h4>
			<table class="table">
				<tr class="form-group">
					<td>
  						<label for="sellerId">판매자 아이디</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="sellerId" name="sellerId">
  					</td>
  				</tr>
  				<tr class="form-group">
					<td>
  						<label for="dealing">거래방식</label>
  					</td>
  					<td>		
  						<label class="radio-inline">
      						<input type="radio" name="optradio" checked>경매입찰방식
    					</label>
    					<label class="radio-inline">
      						<input type="radio" name="optradio">즉시구매방식
    					</label>
   					    <label class="radio-inline">
      						<input type="radio" name="optradio">둘 다
    					</label>
 					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="immediatePurchasePrice">즉시구매가</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="immediatePurchasePrice" name="immediatePurchasePrice">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="minimumBidPrice">최소입찰가</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="minimumBidPrice" name="minimumBidPrice">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="bidBond">입찰보증금</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="bidBond" name="bidBond">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="bidPeriod">입찰기간</label>
  					</td>
  					<td>		
  						<input type="date" class="form-control" id="bidPeriod" name="bidPeriodFrom">
  						<input type="date" class="form-control" id="bidPeriod" name="bidPeriodtil">
					</td>
				</tr>
				<tr class="form-group">
					<td>
  						<label for="releasePrice">발매가</label>
  					</td>
  					<td>		
  						<input type="text" class="form-control" id="releasePrice" name="releasePrice">
					</td>
				</tr>
			</table>
			<div style="margin-top:50px;">
			<h4 style="display:inline-flex;float:left;">이미지 첨부</h4>
			<h6 style="display:inline-flex;margin-left:20px;float:left;">정품인증서를 반드시 첨부해주세요.</h6><br>
			 
			  <!-- 첨부 버튼 -->
            <div id="attach">
                <label class="waves-effect waves-teal btn-primary" for="uploadInputBox" style="height:30px;width:170px;background-color:#9facf5;">
                	<i class="fa fa-search"></i>내 컴퓨터에서 파일 찾기</label>
                <input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple />
            </div>
            
            <!-- 미리보기 영역 -->
            <div id="preview" class="content"></div>
            
            <!-- multipart 업로드시 영역 -->
            <div id="uploadForm" style="display:inline-flex;"></div>
            </div>
            
			<div>
				<h4 style="float:left; margin-top:50px;margin-bottom:30px;">판매자 한마디</h4>
				<table class="table">
					<tr>
						<td colspan="2">
							<textarea rows="10" cols="130" name="sellerComent" placeholder="내용을 입력해주세요"></textarea></p>
						</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
						게시물 검수 후 상품이 등록된 후에는 임의로 수정이나 삭제를 할 수 없습니다.<br>
						필요시 관리자에게 1:1문의 하십시오.
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<button type="submit" class="btn btn-default" style="width:300px;background-color:#8284ff;color:white;" onclick="return confirm('등록하시겠습니까?')" >등록하기</button>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<button type="reset" class="btn btn-default" style="width:300px;background-color:#ebcee8;" onclick="goBack()">취소하기</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>
</div>
<jsp:include page="../include/footer.jsp"/>

<script>

//임의의 file object영역
 var files = {};
 var previewIndex = 0;

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
                 $("#preview")
                         .append(
                                 "<div class=\"preview-box\" value=\"" + imgNum +"\">"
                                         + "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
                                         + "<p>"
                                         + file.name
                                         + "</p>"
                                         + "<a href=\"#\" value=\""
                                         + imgNum
                                         + "\" onclick=\"deletePreview(this)\">"
                                         + "삭제" + "</a>" + "</div>");
                 files[imgNum] = file;
             };
             reader.readAsDataURL(file);
         }
     } else
         alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
 }

 //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
 function deletePreview(obj) {
     var imgNum = obj.attributes['value'].value;
     delete files[imgNum];
     $("#preview .preview-box[value=" + imgNum + "]").remove();
     resizeHeight();
 }

 //client-side validation
 //always server-side validation required
 function validation(fileName) {
     fileName = fileName + "";
     var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
     var fileNameExtension = fileName.toLowerCase().substring(
             fileNameExtensionIndex, fileName.length);
     if (!((fileNameExtension === 'jpg')
             || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
         alert('jpg, gif, png 확장자만 업로드 가능합니다.');
         return true;
     } else {
         return false;
     }
 }

 $(document).ready(function() {
     //submit 등록. 실제로 submit type은 아니다.
     $('.submit a').on('click',function() {                        
         var form = $('#uploadForm')[0];
         var formData = new FormData(form);

         for (var index = 0; index < Object.keys(files).length; index++) {
             //formData 공간에 files라는 이름으로 파일을 추가한다.
             //동일명으로 계속 추가할 수 있다.
             formData.append('files',files[index]);
         }

         //ajax 통신으로 multipart form을 전송한다.
         $.ajax({
             type : 'POST',
             enctype : 'multipart/form-data',
             processData : false,
             contentType : false,
             cache : false,
             timeout : 600000,
             url : '/imageupload',
             dataType : 'JSON',
             data : formData,
             success : function(result) {
                 //이 부분을 수정해서 다양한 행동을 할 수 있으며,
                 //여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
                 //-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
                 if (result === -1) {
                     alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
                     // 이후 동작 ...
                 } else if (result === -2) {
                     alert('파일이 10MB를 초과하였습니다.');
                     // 이후 동작 ...
                 } else {
                     alert('이미지 업로드 성공');
                     // 이후 동작 ...
                 }
             }
             //전송실패에대한 핸들링은 고려하지 않음
         });
     });
     // <input type=file> 태그 기능 구현
     $('#attach input[type=file]').change(function() {
         addPreview($(this)); //preview form 추가하기
     });
 });



</script>


</body>
</html>