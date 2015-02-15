<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">

<!--------------------- Homepage --------------------->

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

</head>
<body id="page1">

	<!--==============================header=================================-->

	<header>
		<div class="headergridbg">

			<div class="main zerogrid">
				<div class="prev-indent-bot2">
					<h1>
						<a href="<%=request.getContextPath() %>/index"><img
							src="images/logoblack.png" /></a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a class="active" href="<%=request.getContextPath() %>/index">Home</a></li>

							<c:if test="${!empty addUser }">
									신분 ? <c:out value="${addUser.grade }" />
								<c:if test="${addUser.grade=='사장' }">
									<c:url value="/mypage_employer" var="url" />
								</c:if>
								<c:if test="${addUser.grade=='직원' }">
									<c:url value="/mypage_employee" var="url" />
								</c:if>
								<li><a href="${url }">Mypage</a></li>
								
								<c:url value="/logout" var="url" />	
								<li><a href="${url }">Logout</a></li>
							</c:if>

							<c:if test="${empty addUser }">
								<c:url value="/login" var="url"></c:url>
								<li><a href="${url }">Login</a></li>

								<c:url value="/join" var="url"></c:url>
								<li><a href="${url }">Join</a></li>
							</c:if>
							<c:url value="/contact" var="url"></c:url>
							<li><a href="${url }">Contact</a></li>
						</ul>
					</nav>
					<div class="clear"></div>
				</div>
			</div>

		</div>
	</header>


</body>
</html>
