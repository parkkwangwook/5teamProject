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
		
		
		$("#addComForm").validate({
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
				companyName : {
					required : true,
					minlength : 1,
					maxlength : 6
				},
				companyTel : {
					required : true,
					minlength: 9, 
					maxlength: 12, 
					digits : true 
				},

				holidayComm : {
					required : true,
					minlength: 1, 
					maxlength: 3, 
					digits : true 
				},
				nightComm : {
					required : true,
					minlength: 1, 
					maxlength: 3, 
					digits : true 
				}
			},
			//규칙체크 실패시 출력될 메시지
			messages : {
				companyName : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다"
				},
				companyTel : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다",
					digits : "전화번호는 숫자만 입력해주세요."
				},
				
				holidayComm : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다",
					digits : "휴일수당은 숫자만 입력해주세요."
				},
				nightComm : {
					required : "필수 입력사항 입니다.",
					minlength : "최소 {0}글자이상이어야 합니다",
					maxlength : "최대 {0}글자이하이어야 합니다",
					digits : "야근수당은 숫자만 입력해주세요."
				}
			}
		});

		var addComForm = $("#addComForm");
		for ( var item in addComForm) {
			console.log(item + " : " + addComForm[item]);
		}
	});
	
</script> 

</head>
<body id="page5">

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

							<c:url value="/mypage_employer" var="url" />
							<li><a class="active" href="${url }">Mypage</a></li>

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
									<option value="password">change password</option>
									<option value="leave">leave Aruba</option>
								</optgroup>
								<optgroup label="Store">
									<option value="store" selected="selected">my store</option>
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
			<h2>사장 COMPANY등록</h2><br>
			<%-- <c:url value="/mypage_myCompany" var="action"></c:url>
			<form:form modelAttribute="addCmp" method="post" action="${action}">
				<table>
					<tr>
						<td><label>회사명</label></td>
						<td><form:input path="companyName" /></td>
					</tr>
					<tr>
						<td><label>회사전화번호</label></td>
						<td><form:input path="companyTel" /></td>
					</tr>
					<tr>
						<td><label>주말수당</label></td>
						<td><form:input path="holidayComm" /></td>
					</tr>
					<tr>
						<td><label>야간수당</label></td>
						<td><form:input path="nightComm" /></td>
					</tr>
					<tr>
						<td></td>
						<td><button type="submit" name="proceed">다음</button></td>
					</tr>
				</table>
			</form:form> --%>
			
			
		
					<c:url value="/mypage_myCompany" var="url"/>
					<form id="addComForm" action="${url }" method="post">

						<table class="table" style="border-collapse: seperate;">
							<colgroup>
								<col style="align: center;" />
							</colgroup>
							<tbody>
								<tr>
									<th><label>회사명</label></th>
									<td><input type="text" name="companyName" id="companyName"
										value="" /></td>
								</tr>
								<tr>
									<th><label>회사전화번호</label></th>
									<td><input type="text" name="companyTel" id="companyTel" value="" /></td>
								</tr>
								<tr>
									<th><label>주말수당(%)</label></th>
									<td><input type="text" name="holidayComm" id="holidayComm" value="0" /></td>
								</tr>
								<tr>
									<th><label>야근수당(%)</label></th>
									<td><input type="text" id="nightComm" name="nightComm" value="0" /></td>
								</tr>

							</tbody>
						</table>
						<div align="center" style="margin-bottom: 50px; margin-top: 30px;">
							<button type="submit">등록</button>
							<button type="reset" id="cancel">취소</button>
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