<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css" type="text/css"
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
<body id="page4">

	<jsp:include page="/WEB-INF/view/main/header.jsp" />


	<!--==============================title================================-->

	<div class="slider-wrapper">
		<article class="col-full">
			<img src="images/logintitlebg.png">
		</article>
	</div>


	<!--==============================content================================-->
	<section id="content">
		<div class="main zerogrid">
			<div class="row">
				<article class="col-3-4">
					<div class="wrap-col">
						<h3>Contact Form</h3>
						<form id="contact-form" method="post"
							enctype="multipart/form-data">
							<fieldset>
								<label><span class="text-form">Your Name:</span><input
									type="text"></label> <label><span class="text-form">Your
										Email:</span><input type="text"></label>
								<div class="wrapper">
									<div class="text-form">Your Message:</div>
									<div class="extra-wrap">
										<textarea></textarea>
										<div class="clear"></div>
										<div class="buttons">
											<span class="button-2"> <a
												onClick="document.getElementById('contact-form').reset()"><strong>clear</strong></a>
											</span> <span class="button-2"> <a
												onClick="document.getElementById('contact-form').submit()"><strong>send</strong></a>
											</span>
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</article>
				<article class="col-1-4">
					<div class="wrap-col">
						<h3>Address</h3>
						<div class="wrapper img-indent-bot">
							<figure class="map-border">
								<iframe width="216" height="180"
									src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=sejoing+university&amp;aq=&amp;sll=47.643186,-121.319275&amp;sspn=1.197255,1.609497&amp;g=Leavenworth,+Chelan,+Washington&amp;ie=UTF8&amp;hq=sejoing+university&amp;hnear=&amp;ll=37.549035,127.07536&amp;spn=0.006295,0.006295&amp;t=m&amp;iwloc=A&amp;output=embed"></iframe>
							</figure>
						</div>
						<dl>
							<dt class="p2">
								Sejoing Univ<br>Gwangjin-gu, Seoul, South Korea
							</dt>
							<dd>
								<span>Freephone:</span> +1 800 559 6580
							</dd>
							<dd>
								<span>Telephone:</span> +1 800 603 6035
							</dd>
							<dd>
								<span>Fax:</span> +1 800 889 9898
							</dd>
							<dd>
								<span>Email:</span> <a class="link" href="#">BMJ@db.com</a>
							</dd>
						</dl>
					</div>
				</article>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/view/main/footer.jsp" />


	<script type="text/javascript">
		Cufon.now();
	</script>
</body>
</html>