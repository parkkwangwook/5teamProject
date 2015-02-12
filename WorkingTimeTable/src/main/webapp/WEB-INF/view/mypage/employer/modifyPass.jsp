<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
fieldset {
	border: 0;
}

select {
	width: 300px;
}

.overflow {
	height: 200px;
}
</style>
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

<!--------------------- SelectMenu --------------------->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script>

	$(function() {
		$("#MypageMenu").selectmenu({
			change: function(event, ui){
				
				if(this.selectedIndex == 0)					//개인정보 수정
					window.location.href = "<%=request.getContextPath()%>/mypage_employer";
				else if(this.selectedIndex == 1)			//비밀번호 변경
					window.location.href = "<%=request.getContextPath()%>/modifyEmployerPass";
				else if(this.selectedIndex == 2)			//회원탈퇴
					window.location.href = "<%=request.getContextPath()%>/leaveEmployerAruba";
				else if(this.selectedIndex == 3)			//회사관리
					window.location.href = "<%=request.getContextPath()%>/myCompany";
				else if(this.selectedIndex == 4)			//급여관리
					window.location.href = "<%=request.getContextPath()%>/wage";
				else if(this.selectedIndex == 5)			//직원관리
					window.location.href = "<%=request.getContextPath()%>/staff";	
				else if(this.selectedIndex == 6)			//쪽지
					window.location.href = "<%=request.getContextPath()%>/alerts_employer";

							}
						});
	});

	//////////////////////////////////////////////////////////////////////

		$(document).ready(function() {


		$("#passForm").validate({
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
				nowPassword : {
					required : true,
					minlength : 3,
					equalTo : "#password"
				},
				modifyPass1 : {
					required : true,
					minlength : 3,
					maxlength : 20
				},
				modifyPass2: {
					required : true,
					minlength : 3,
					maxlength : 20,
					equalTo: "#modifyPass1"
				}
			},
			//규칙체크 실패시 출력될 메시지
			messages : {
				nowPassword : {
					required : "필수 입력사항 입니다.",
					minlength :"최소 {0}글자이상이어야 합니다",
					equalTo : "기존 비밀번호와 불일치합니다."
				},
				modifyPass1 : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다"
				},
				modifyPass2 : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					equalTo: "비밀번호가 불일치합니다"
				}
			}
		});

		var passForm = $("#passForm");
		for ( var item in passForm) {
			console.log(item + " : " + passForm[item]);
		}
	});
</script>

</head>
<body id="page5">

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
							<li><a class="active"
								href="<%=request.getContextPath()%>/index">Home</a></li>

							<c:url value="/mypage_employer" var="url" />
							<li><a href="${url }">Mypage</a></li>

							<c:url value="/logout" var="url" />
							<li><a href="${url }">Logout</a></li>

							<c:url value="/contact" var="url"></c:url>
							<li><a href="${url }">Contact</a></li>
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

			<fieldset>
				<ul class="lowermenu">

					<li><select name="MypageMenu" id="MypageMenu">
							<optgroup label="My Info">
								<option value="info">personal info</option>
								<option value="password" selected="selected">change password</option>
								<option value="leave">leave Aruba</option>
							</optgroup>
							<optgroup label="Store">
								<option value="store">my store</option>
							</optgroup>
							<optgroup label="Wage">
								<option value="wage">employee's salary</option>
							</optgroup>
							<optgroup label="Staff">
								<option value="staff">management of staff</option>
							</optgroup>
							<optgroup label="Message">
								<option value="message">check message</option>
							</optgroup>
					</select></li>
				</ul>
			</fieldset>
		</article>
	</div>

	<!--==============================contents================================-->


	<div class="mainmenubg">
		<div class="main zerogrid">
			<c:url value="/modifyPass" var="action" />
			<form:form modelAttribute="addUser" mehtod="post" action="${action }" id="passForm">
				<table>
					<tr>
						<td><label>ID</label></td>
						<td><form:hidden path="userId" /></td>
					</tr>
					<tr>
						<td><label>PASS</label></td>
						<%-- <td><form:hidden path="password" id="password" name="password"/></td> --%>
						
						<td><form:input path="password" id="password" name="password" /></td>
					</tr>
					<tr>
						<td><label>현재 비밀번호</label></td>
						<td><input type="text" id="nowPassword" name="nowPassword" /></td>
					</tr>
					<tr>
						<td><label>바꿀 PASSWORD</label></td>
						<td><input type="password" id="modifyPass1" name="modifyPass1" /></td>
					</tr>
					<tr>
						<td><label>바꿀 PASSWORD 확인</label></td>
						<td><input type="password" id="modifyPass2" name="modifyPass2"/></td>
					</tr>


				</table>
				<input type="submit" value="수정" />

			</form:form>
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