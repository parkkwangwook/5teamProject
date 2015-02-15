<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<style>
#user_grade label.error {
	display: none;
	margin-left: 103px;
}

label.error {
	color: red;
	/* font-style: italic */
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

<!--------------------- DatePicker --------------------->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script>
	$(document).ready(function() {
		var dp = {
			changeMonth : true,
			changeYear : true,
			yearRange : "1930:2015"
		};
		$("#datepicker").datepicker(dp);
		
		$("#popUpBtn").click(function(){
			alert("팝업창이 나올 것!!");
					var url = "<%=request.getContextPath()%>/checkIdPopUp"; 
					<%-- var url = "<%=request.getContextPath() %>/checkId?userId="+$("#userId").val(); --%>
					window.open(url, "_blank", "width=450, height=200, toolbar=no, menubar=no, resizable=no");
		});

		$("#joinForm").validate({
			//validation이 끝난 이후의 submit 직전 추가 작업할 부분
			/* submitHandler : function() {
				var f = confirm("글을 등록하시겠습니까?");
				if (f) {
					return true;
				} else {
					return false;
				}
			}, */
			ignore: "",
			//규칙
			rules : {
				/* userId : {
					required : true,
					minlength : 2,
					maxlength : 20
				}, */
				buttonCheck : {
					required : true
				},
				password : {
					required : true,
					minlength : 3,
					maxlength : 20
				},
				password2 : {
					required : true,
					minlength : 3,
					maxlength : 20,
					equalTo : "#password"
				},
				userName : {
					required : true,
					minlength : 1,
					maxlength : 3
				},
				tel : {
					minlength: 10, 
					maxlength: 12, 
					digits : true 
				},
				email : {
					required : true,
					minlength : 2,
					maxlength : 30,
					email : true
				},
				birth : {
					required : true,
					minlength : 9,
					maxlength : 10
				},
				question : {
					required : true,
					minlength : 2, 
					maxlength : 18
				},
				answer : {
					required : true,
					minlength : 1,
					maxlength : 6
				}
			},
			//규칙체크 실패시 출력될 메시지
			messages : {
				/* userId : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다"
				}, */
				buttonCheck : {
					required : "아이디 중복체크는 필수입니다."
				},
				password : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다"
				},
				password2 : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다",
					equalTo : "비밀번호가 불일치합니다"
				},
				userName : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다"
				},
				tel : {
					minlength: "휴대전화 번호는 10자 이상이어야 합니다.", 
					maxlength: "휴대전화 번호는 12자 미만이어야 합니다.", 
					digits : "휴대전화 번호는 숫자만 입력해주세요."
				},
				email : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다",
					email : "메일 기재 규칙에 어긋납니다."
				},
				birth : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다",
					date : "생년월일 기재 규칙에 어긋납니다."
				},
				 grade : {
					required : "필수 입력사항 입니다.",
				}, 
				question : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다"
				},
				answer : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다"
				}
			}
		});

		var joinForm = $("#joinForm");
		for ( var item in joinForm) {
			console.log(item + " : " + joinForm[item]);
		}
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
						<a href="<%=request.getContextPath()%>/index"><img
							src="images/logoblack.png" /></a>
					</h1>
					<nav>
						<ul class="menu">
							<li><a href="<%=request.getContextPath()%>/index">Home</a></li>

							<c:url value="/login" var="url"></c:url>
							<li><a href="${url }">Login</a></li>

							<c:url value="/join" var="url"></c:url>
							<li><a class="active" href="${url }">Join</a></li>

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

			<div class="row">
				<article class="col-full">

					회원가입<br> <br> <br>
					<c:url value="/join" var="url" />
					<form id="joinForm" action="${url }" method="post">

						<table class="table" style="border-collapse: seperate;">
							<colgroup>
								<col style="align: center;" />
							</colgroup>
							<tbody>
								<tr>
									<th><label>아이디</label></th>
									<td><input type="text" name="fromId" id="formId" disabled />
										<input type="hidden" name="userId" id="userId" value="" /> <!-- <input type ="button" id="popUpBtn" value="중복확인"/> -->
										<!-- <button id="popUpBtn">중복확인</button> --> <input
										type="button" id="popUpBtn" value="중복확인" /> <input
										type="hidden" name="buttonCheck" id="buttonCheck" value="" />
									</td>
								</tr>
								<tr>
									<th><label>비밀번호</label></th>
									<td><input type="password" name="password" id="password"
										value="" /></td>
								</tr>
								<tr>
									<th><label>비밀번호 확인</label></th>
									<td><input type="password" name="password2" id="password2"
										value="" /></td>
								</tr>
								<tr>
									<th><label>이름</label></th>
									<td><input type="text" name="userName" id="userName"
										value="" /></td>
								</tr>
								<tr>
									<th><label>H.P</label></th>
									<td><input type="text" name="tel" id="tel" value="" /></td>
								</tr>
								<tr>
									<th><label>이메일</label></th>
									<td><input type="text" name="email" id="email" value="" /></td>
								</tr>
								<tr>
									<th><label>생년월일</label></th>
									<td><input type="text" id="datepicker" name="birth"
										value="" /></td>
								</tr>
								<tr>
									<!-- <fieldset id = "user_grade"> -->
									<th><label>가입유형</label></th>

									<td><input type="radio" id="grade_employer" value="사장"
										name="grade" required>고용인 <input type="radio"
										id="grade_employer" value="직원" name="grade">아르바이트 <label
										for="grade" class="error"></label></td>
									<!-- </fieldset> -->
								</tr>
								<tr>
									<th><label for="question">비번찾기질문</label></th>
									<td><input id="question" name="question" type="text"
										size="50"></td>
								</tr>
								<tr>
									<th><label for="answer">답</label></th>
									<td><input id="answer" name="answer" type="text"></td>
								</tr>

							</tbody>
						</table>
						<div align="center" style="margin-bottom: 50px; margin-top: 30px;">
							<button type="submit">등록</button>
							<button type="reset" id="cancel">취소</button>
						</div>
					</form>


				</article>

			</div>
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