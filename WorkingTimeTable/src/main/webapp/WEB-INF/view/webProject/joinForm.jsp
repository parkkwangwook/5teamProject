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
	<form:form modelAttribute="addUser" mehtod = "post" action = "${action }">
			<li><label>ID</label> : <form:input path="userId"/><br>
			<li><label>PASSWORD</label> : <form:input path="password"/><br>
			<li><label>PASSWORD 확인</label> : <form:input path="password2"/><br>
			<li><label>이름</label> : <form:input path="userName"/><br>
			<li><label>TEL</label> : <form:input path="tel"/><br>
			<li><label>EMAIL</label> : <form:input path="email"/><br>
			<li><label>BIRTH</label> : <form:input path="birth"/><br>
			<li><label>GRADE</label> : <form:input path="grade"/><br>
			<li><label>Q</label> : <form:input path="question"/><br>
			<li><label>A</label> : <form:input path="answer"/><br>
	<!-- 	<label for = "textId">ID : </label>
		<input type = "text" id = "textId" name = "textid"><br>
		<label for = "textPW">PASSWORD : </label>
		<input type = "text" id = "textPW" name = "textPW"><br>
		<label for = "textPW2">PASSWORD 확인 : </label>
		<input type = "text" id = "textPW2" name = "textPW2"><br>
		<label for = "textName">NAME : </label>
		<input type = "text" id = "textName" name = "textName"><br>
		<label for = "textTel">TEL : </label>
		<input type = "tel" id = "textTel" name = "textTel"><br>
		<label for = "textEmail">EMAIL : </label>
		<input type = "email" id = "textEmail" name = "textEmail"><br>
		<label for = "textBirth">BIRTH : </label>
		<input type = "date" id = "textBirth" name = "textBirth"><br>
		<label for = "textGrade">GRADE : </label>
		<input type = "text" id = "textGrade" name = "textGrade"><br>
		<label for = "textQ">Question ? : </label>
		<input type = "text" id = "textQ" name = "textQ"><br>
		<label for = "textA">Answer : </label>
		<input type = "text" id = "textA" name = "textA"><br> -->
		
		<button type = "submit" name = "proceed">다음</button>
	
	</form:form>
</body>
</html>