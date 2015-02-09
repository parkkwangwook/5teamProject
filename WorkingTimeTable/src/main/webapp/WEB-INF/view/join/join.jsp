<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/zerogrid.css" type="text/css"
	media="all">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/responsive.css" type="text/css"
	media="all">

<script src="js/jquery-1.6.3.min.js" type="text/javascript"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/Kozuka_Gothic_Pro_OpenType_300.font.js"
	type="text/javascript"></script>
<script src="js/Kozuka_Gothic_Pro_OpenType_700.font.js"
	type="text/javascript"></script>
<script src="js/Kozuka_Gothic_Pro_OpenType_900.font.js"
	type="text/javascript"></script>
<script src="js/FF-cash.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/tms-0.3.js"></script>
<script type="text/javascript" src="js/tms_presets.js"></script>
<script type="text/javascript" src="js/easyTooltip.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/css3-mediaqueries.js"></script>

<!--------------------- DatePicker --------------------->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>

</head>
<body id="page3">

	<!--==============================header=================================-->

	<header>
		<div class="headergridbg">

			<div class="main zerogrid">
				<div class="prev-indent-bot2">
					<h1>
						<a href="<%=request.getContextPath() %>/index"><img src="images/logoblack.png" /></a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a class="active" href="<%=request.getContextPath() %>/index">Home</a></li>

							<c:url value="/login" var="url"></c:url>
							<li><a href="${url }">Login</a></li>

							<c:url value="/join" var="url"></c:url>
							<li><a href="${url }">Join</a></li>

							<li><a href="contactus.jsp">Contact us</a></li>
						</ul>
					</nav>
					<div class="clear"></div>
				</div>
			</div>

		</div>
	</header>

	<!--==============================title================================-->

	<div class="slider-wrapper">
		<article class="col-full">
			<img src="images/logintitlebg.png">
		</article>
	</div>

	<!--==============================contents================================-->


	<div class="mainmenubg">
		<div class="main zerogrid">
			<%-- <c:url value="/join" var="action"></c:url>
			<form:form modelAttribute="addUser" mehtod="post" action="${action }">
				<li><label>ID</label> : <form:input path="userId" /><br>
					<li><label>PASSWORD</label> : <form:input path="password" /><br>
				
				<li><label>PASSWORD 확인</label> : <form:input path="password2" /><br>
				
				<li><label>이름</label> : <form:input path="userName" /><br>
				
				<li><label>TEL</label> : <form:input path="tel" /><br>
				
				<li><label>EMAIL</label> : <form:input path="email" /><br>
				
				<li><label>BIRTH</label> : <form:input path="birth"
						id="datepicker" /><br>
				
				<li><label>GRADE</label> : <form:input path="grade" /><br>
				
				<li><label>Q</label> : <form:input path="question" /><br>
				
				<li><label>A</label> : <form:input path="answer" /><br>
					<button type="submit" name="proceed">다음</button>
			
			</form:form> --%>
			<c:url value="/join" var="url"/>
			<form method="post" action="${url }">
				<label>ID</label> : <input type="text" id="userId" name="userId" /><br>
				<label>PASSWORD</label> : <input type="password" id="password" name="password" /><br>
				
				<label>PASSWORD 확인</label> : <input type="password" id="password2" name="password2" /><br>
				
				<label>이름</label> : <input type="text" id="userName" name="userName" /><br>
				
				<label>TEL</label> : <input type="text" id="tel" name="tel" /><br>
				
				<label>EMAIL</label> : <input type="text" id="email" name="email" /><br>
				
				<label>BIRTH</label> : <input type="text" id="datepicker" name="birth"/><br>
				
				<label>GRADE</label> : <input type="text" id="grade" name="grade" /><br>
				
				<label>Q</label> : <input type="text" id="question" name="question" /><br>
				
				<label>A</label> : <input type="text" id="answer" name="answer" /><br>
					<button type="submit" name="proceed">다음</button>
			
			</form>
		</div>
	</div>

	<!--==============================footer=================================-->
					<footer>
		<div class="main zerogrid">
			<div class="row">
				<article class="col-1-4">
					<div class="wrap-col">
						<ul class="list-services">
							<li class="item-1"><a class="tooltips" title="facebook"
												href="#"></a></li>
							<li class="item-2"><a class="tooltips" title="twiiter"
												href="#"></a></li>
							<li class="item-3"><a class="tooltips" title="delicious"
												href="#"></a></li>
							<li class="item-4"><a class="tooltips" title="youtube"
												href="#"></a></li>
						</ul>
					</div>
				</article>
				<article class="col-1-4">
					<div class="wrap-col">
						<h5>Navigation</h5>
						<ul class="list-1">
							<li><a href="index.jsp">Home</a></li>

							<c:url value="/login" var="url"></c:url>
							<li><a href="${url }">Login</a></li>

							<c:url value="/join" var="url"></c:url>
							<li><a href="${url }">Join</a></li>

							<li><a href="contactus.jsp">Contact us</a></li>
						</ul>
					</div>
				</article>
				<article class="col-1-4">
					<div class="wrap-col">
						<h5>Contact</h5>
						<dl class="contact">
							<dt>
								Sejoing University<br>209, Neungdong-ro<br>Gwangjin-gu,
								Seoul<br>South Korea
							</dt>
						</dl>
					</div>
				</article>
				<article class="col-1-4">
					<div class="wrap-col">
						<h5>Legal</h5>
						<p class="prev-indent-bot3 color-1">DB Academy &copy; 2015</p>
						<p class="prev-indent-bot3">Project: Aruba</p>
						<p class="color-1 p0">by MalSikizima</p>
					</div>
				</article>
			</div>
		</div>
	</footer>

	<script type="text/javascript">
		Cufon.now();
	</script>


				</body>

</html>