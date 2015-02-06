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

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
  
  
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
			<li><label>BIRTH</label> : <form:input path="birth" id="datepicker"/><br>
			<li><label>GRADE</label> : <form:input path="grade"/><br>
			<li><label>Q</label> : <form:input path="question"/><br>
			<li><label>A</label> : <form:input path="answer"/><br>
		<button type = "submit" name = "proceed">다음</button>
	
	</form:form>
</body>
</html>