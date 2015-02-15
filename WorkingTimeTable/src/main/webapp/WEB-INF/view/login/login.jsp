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
<!--------------------- Validate --------------------->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="lib/jquery.validate.min.js"></script>

<!--------------------- Homepage --------------------->

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

<!-- <script src="js/jquery-1.6.3.min.js" type="text/javascript"></script> -->
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
<script>
	$(document).ready(function() {

		$("#loginForm").validate({
			//validation이 끝난 이후의 submit 직전 추가 작업할 부분
			/* submitHandler : function() {
				var f = confirm("글을 등록하시겠습니까?");
				if (f) {
					return true;
				} else {
					return false;
				}
			}, */
			//규칙
			rules : {
				userId : {
					required : true
				},
				password : {
					required : true
				}
			},
			//규칙체크 실패시 출력될 메시지
			messages : {
				userId : {
					required : "필수 입력사항 입니다."
				},
				password : {
					required : "필수 입력사항 입니다."
				}
			}
		});

		var loginForm = $("#loginForm");
		for ( var item in loginForm) {
			console.log(item + " : " + loginForm[item]);
		}
	});
</script>

</head>
<style>
label.error {
	color: red;
	/* font-style: italic */
}
</style>
<body id="page2">

	<!--==============================header=================================-->

	<header>
		<div class="headergridbg">

			<div class="main zerogrid">
				<div class="prev-indent-bot2">
					<h1>
						<a href="<%=request.getContextPath()%>/index"><img
							src="images/logoblack.png" /></a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a href="<%=request.getContextPath()%>/index">Home</a></li>

							<c:url value="/login" var="url"></c:url>
							<li><a class="active" href="${url }">Login</a></li>

							<c:url value="/join" var="url"></c:url>
							<li><a href="${url }">Join</a></li>

							<li><a href="<%=request.getContextPath()%>/contact">Contact</a></li>
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
			<c:url value="/login" var="url" />
			<form id="loginForm" method="post" action="${url }">

				<table class="table" style="border-collapse: seperate;">
					<colgroup>
						<col style="align: center;" />
					</colgroup>
					<tbody>
						<tr>
							<th><label>아이디</label></th>
							<td><input type="text" name="userId" id="userId" value="" /></td>
						</tr>
						<tr>
							<th><label>비밀번호</label></th>
							<td><input type="password" name="password" id="password"
								value="" /></td>
						</tr>
					</tbody>
				</table>
				<div align="center" style="margin-bottom: 50px; margin-top: 30px;">
					<button type="submit">로그인</button>

				</div>
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