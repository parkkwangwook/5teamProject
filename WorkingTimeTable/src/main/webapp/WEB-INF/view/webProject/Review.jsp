<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>    
<%@ page import = "com.bmj.entity.Company" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이걸로 저장할건가요?</h2>
	<c:url value="/webProject/Review" var = "action"/>
	<form:form modelAttribute="addCmp" method="post" action = "${action }">
		<label>회사명</label> : <c:out value="${addCmp.companyName }"/><br>
		<label>회사전화번호</label> : <c:out value="${addCmp.companyTel }"/><br>
		<label>야간수당</label> : <c:out value="${addCmp.holidayComm }"/><br>
		<label>주말수당</label> : <c:out value="${addCmp.nightComm }"/><br>
		<br>
		
		<button type = "submit" name = "_event_confirmed">갱신</button>
		<button type = "submit" name = "_event_reverse">재입력</button>
	</form:form>
</body>
</html>