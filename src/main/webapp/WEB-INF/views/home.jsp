<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<P>  The time on the server is ${serverTime}. </P>
<a href="<c:url value="product/list"/>">상품 목록</a>
<a href="<c:url value="review/list"/>">리뷰 목록</a><br>
<a href="<c:url value="inquiry/list"/>">목록</a><br>
<a href="<c:url value="inquiry/insertInquiry"/>">글쓰기</a><br>
</body>
</html>
