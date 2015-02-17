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
.temp td{
	border: 1px solid black;
}
</style>
<meta charset="utf-8">
<title>Welcome</title>

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

<!--------------------- SelectMenu --------------------->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script>
	$(function() {
		
		$(".btn").click(function(){
			var bid = $(this).attr("id");
			alert(bid);
			var tid = "#salary"+bid;
			var tid2 = "#code"+bid;
			var tid3 = "#id"+bid;
			alert(tid);
			alert("월급"+$(tid).val());
			alert("코드"+$(tid2).html());
			alert("아이디"+$(tid3).html());
			
			var url = "<%=request.getContextPath()%>/modifySalary?companyCode="+$(tid2).html()+"&userId="+$(tid3).html()+"&salary="+$(tid).val();
			
			$(location).attr('href',url);
			
			
		});
		
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
									<option value="store">my store</option>
								</optgroup>
								<optgroup label="Wage">
									<option value="wage">employee's salary</option>
								</optgroup>
								<optgroup label="Staff">
									<option value="staff" selected="selected">management of staff</option>
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
			사장의 직원관리<br><br>
			
			<table class="temp">
				<tr>
					<th>status</th>
					<th>회사코드</th>
					<th>이름</th>
					<th>아이디</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>시급</th>
					<th>고용일</th>
				</tr>

				<c:forEach items="${staffList }" var="staffList" varStatus="status">

					<tr> 
						<td>${status.index }</td>
						<td id="codebtn${status.index }">${staffList.companyCode}</td>
						<td>${staffList.userName}</td>
						<td id="idbtn${status.index }">${staffList.userId}</td>
						<td>${staffList.tel}</td>
						<td>${staffList.email}</td>
						<td><input type="text" name="salary${status.index }" id="salarybtn${status.index }" value="${staffList.salary}">
						<%-- <c:url value="/modifySalary?companyCode=${staffList.companyCode}&userId=${staffList.userId}&salary=" var="url"/> --%>
						<br><button id="btn${status.index }" class="btn">시급수정</button></td>
						<td>${staffList.hireDate}</td>
						<td><c:url value="/deleteStaff?companyCode=${staffList.companyCode}&userId=${staffList.userId}" var="url"/>
						<a href="${url }"><button>삭제</button></a></td>
					</tr>
				</c:forEach>
			</table>
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