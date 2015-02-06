<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>정보 입력</h1>
	<c:url value="/webProject/addCompanys" var="action"></c:url>
	<form:form modelAttribute="addCmp" method="post" action="${action}">
	<ul>
		<li><label>회사명</label> : <form:input path="companyName"/><br>
		<li><label>회사전화번호</label> : <form:input path="companyTel"/><br>
		<li><label>주말수당</label> : <form:input path="holidayComm"/><br>
		<li><label>야간수당</label> : <form:input path="nightComm"/><br>
	</ul>
		<button type = "submit" name = "proceed">다음</button>
	</form:form>

</body>
</html>