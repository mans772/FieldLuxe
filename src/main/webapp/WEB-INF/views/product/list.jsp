<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
</head>
<body>
	<h1>전체 목록</h1>
	<hr>
	<table border="1" style="width: 100%">
		<tr>
			<th>
				물품 번호
			</th>
			<th>
				물품 이름
			</th>
			<th>
				물품 등록일
			</th>
		</tr>
		<c:if test=""></c:if>
		<c:forEach var="vo" items="${ list }">
			<tr>
				<td>
					${ vo.productId }
				</td>
				<td>
					<a href="content/${vo.productId}">${ vo.productName }</a>
				</td>
				<td>
					${ vo.productRegDate.year }년
					${ vo.productRegDate.monthValue }월
					${ vo.productRegDate.dayOfMonth }일 
					${ vo.productRegDate.hour }:${ vo.productRegDate.minute }:${ vo.productRegDate.second }
				</td>
			</tr>
		</c:forEach>
	</table>
 
	<form method="post">
		<input type="button" value="추가" onclick="insertPage('${pageContext.request.contextPath}')">
		<input type="submit" value="검수 목록">
	</form>
	
	<script>
		function insertPage(contextPath) {
			location.href=contextPath + "/product/regist";
		}
	</script>
</body>
</html>