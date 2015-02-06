<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.Date" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Date d = new Date();
%>
	<h2>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</h2>
	<c:url value="/webProject/join" var="action"></c:url>
	<form:form modelAttribute="editDept" mehtod = "post" action = "${action }">
		<label for = "textId">ID : </label>
		<input type = "text" id = "textId" name = "textid"><br>
		<label for = "textPW">PASSWORD : </label>
		<input type = "text" id = "textPW" name = "textPW"><br>
		<label for = "textPW2">PASSWORD 확인 : </label>
		<input type = "text" id = "textPW2" name = "textPW2"><br>
		<label for = "">NAME : </label>
		<input type = "text" id = "textName" name = "textid"><br>
		<label for = "">TEL : </label>
		<input type = "tel" id = "textId" name = "textid"><br>
		<label for = "">EMAIL : </label>
		<input type = "email" id = "textId" name = "textid"><br>
		<label for = "">BIRTH : </label>
		<input type = "date" id = "textId" name = "textid"><br>
		<label for = "">GRADE : </label>
		<input type = "text" id = "textId" name = "textid"><br>
		<label for = "">Question ? : </label>
		<input type = "text" id = "textId" name = "textid"><br>
		<label for = "">Answer : </label>
		<input type = "text" id = "textId" name = "textid"><br>
		
		
	
	</form:form>
</body>
</html>