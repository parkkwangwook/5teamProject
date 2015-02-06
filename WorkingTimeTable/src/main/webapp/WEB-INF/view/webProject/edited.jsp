<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>갱신 완료</h1>
	
		<label>회사명</label> : <c:out value="${addCmp.companyName }"/><br>
		<label>회사전화번호</label> : <c:out value="${addCmp.companyTel }"/><br>
		<label>야간수당</label> : <c:out value="${addCmp.holidayComm }"/><br>
		<label>주말수당</label> : <c:out value="${addCmp.nightComm }"/><br>
	<br>
	
	<c:url var = "url"  value = "/webProject/intro" />
	<a href="${url }">목록</a>
	
</body>
</html>