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

	<jsp:include page="/WEB-INF/view/main/header.jsp" />

	<!--==============================advertisement================================-->

	<div class="slider-wrapper">
		<div class="slider">
			<ul class="items">
				<li><img src="images/slider-bg1.png" alt="">
					<div class="banner">
						<strong>need <strong>fresh ideas?</strong></strong> <em>Let’s
							create your company’s growth strategy together!</em> <span
							class="button"> <a href="#"><strong>Read More</strong></a>
						</span>
					</div></li>
				<li><img src="images/slider-bg2.png" alt=""> <!-- <div class="banner">
                        	<strong>good <strong>solutions!</strong></strong>
                            <em>Make your company a world wide known name with us!</em>
                            <span class="button">
                            	<a href="#"><strong>Read More</strong></a>
                            </span>
                        </div> --></li>
				<li><img src="images/slider-bg3.png" alt=""> <!-- <div class="banner">
                        	<strong>LET US <strong>COOPERATE!</strong></strong>
                            <em>Let’s create your company’s growth strategy together!</em>
                            <span class="button">
                            	<a href="#"><strong>Read More</strong></a>
                            </span>
                        </div> --></li>
			</ul>
		</div>
	</div>

	<!--==============================main menu================================-->

	<div class="mainmenubg">
		<div class="main zerogrid">
			<div class="row">
				<article class="col-1-3">
					<a href="mypage.jsp"><img src="images/attendance.png"
						alt="출석체크"></a>
				</article>
				<article class="col-1-3">

					<c:if test="${addUser.grade=='사장' }">
						<c:url value="/allSchedule" var="url" />
					</c:if>
					<c:if test="${addUser.grade=='직원' }">
						<c:url value="/mySchedule" var="url" />
					</c:if>
					<a href="${url }"><img
						src="images/timetable.png" alt="근무표조회"></a>
				</article>
				<article class="col-1-3">
					
					<a href="<%=request.getContextPath()%>/free"><img src="images/board.png" alt="자유게시판"></a>
				</article>
			</div>
		</div>
	</div>

	<!--==============================2 section================================-->
	<!--  <div class="mainmenubg"> -->
	<section id="content">
		<div class="main zerogrid">
			<div class="row">
				<article class="col-1-2">
					<div class="wrap-col">
						<h3>New Posts</h3>
						<div class="indent-bot">
							<time class="tdate-1" datetime="2011-12-24">
								<strong>24</strong>dec
							</time>
							<div class="extra-wrap">
								<h6>
									<a class="link" href="#">first new post</a>
								</h6>
								~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							</div>
							<div class="clear"></div>
						</div>
						<div class="indent-bot">
							<time class="tdate-1" datetime="2011-12-21">
								<strong>21</strong>dec
							</time>
							<div class="extra-wrap">
								<h6>
									<a class="link" href="#">second new post</a>
								</h6>
								~~~~~~~~~~~~~~~~~~~~~~~~aaaabbafsdvsadvdvdssddcccccc~~
							</div>
							<div class="clear"></div>
						</div>
						<div class="p3">
							<time class="tdate-1" datetime="2011-12-09">
								<strong>09</strong>dec
							</time>
							<div class="extra-wrap">
								<h6>
									<a class="link" href="#">third new post</a>
								</h6>
								~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
							</div>
							<div class="clear"></div>
						</div>
						<span class="button-2"> <a href="board.jsp"><strong>Go
									Freeboard</strong></a>
						</span>
					</div>
				</article>
				<article class="col-1-2">
					<div class="wrap-col">
						<h3>Today's Weather</h3>

						<span class="button-2"><a href="http://www.kma.go.kr"
							target="_blank"><strong>Connect to KMA</strong></a> </span>
					</div>
				</article>

			</div>
		</div>
	</section>
	<!-- </div> -->


	<jsp:include page="/WEB-INF/view/main/footer.jsp" />


	<script type="text/javascript">
		Cufon.now();
	</script>
	<script type="text/javascript">
		$(window).load(function() {
			$('.slider')._TMS({
				duration : 800,
				easing : 'easeOutQuad',
				preset : 'simpleFade',
				pagination : true,//'.pagination',true,'<ul></ul>'
				pagNums : false,
				slideshow : 7000,
				banners : 'fade',// fromLeft, fromRight, fromTop, fromBottom
				waitBannerAnimation : false
			})
		})
	</script>
</body>

</html>