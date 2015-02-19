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
/* body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	font-size: 14px;
} */
#calendar {
	max-width: 900px;
	margin: 0 auto;
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

<link href="lib/fullcalendar.css" rel='stylesheet' />
<!-- <link href='../fullcalendar.print.css' rel='stylesheet' media='print' /> -->
<script src="lib/moment.min.js"></script>
<script src="lib/jquery.min.js"></script>
<script src="lib/jquery-ui.custom.min.js"></script>
<script src="lib/fullcalendar.js"></script>

<!--------------------- SelectMenu --------------------->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script>
	$(function() {
		$("#ScheduleMenu").selectmenu({
			change: function(event, ui){
				
				if(this.selectedIndex == 0)					//시간표 등록
					window.location.href = "<%=request.getContextPath()%>/registerSchedule";
				else if(this.selectedIndex == 1)			//시간표 수정
					window.location.href = "<%=request.getContextPath()%>/modifySchedule";
				else if(this.selectedIndex == 2)			//전체 시간표 조회
					window.location.href = "<%=request.getContextPath()%>/mypage_employee";
				
			}
		});
	});
	
	function createTimeTable(id, title, start, end){
		this.id = id;
		this.title = title;
		this.start = start;
		this.end = end;
		this.getInfo = function() {
			return "Id : " + this.id + ", Title : " + this.title + ", Start : " + this.start + ", End : " + this.end;    		
		}
	}
	$(document).ready(function() {
		var start;
		var end;
		var title;
		var id;
		var results = new Array();
		var updates = new Array();
		var outArr = new Array();
		var inArr = new Array();
		var e = new Array();
		$.ajax({
			url: "<%=request.getContextPath()%>/updateAjax",
			success: function(result) {
				var jobj = JSON.parse(result);
				var e = jobj["event"];
				console.log(e);
				console.log(e[0]);
				//callback(e);
			for (var a in e) {
				outArr.push({title:e[a].title, start:e[a].start, end: e[a].end,color:e[a].color});				
			}
			$('#calendar').fullCalendar({
				//defaultDate: '2015-02-12',
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
				},
				editable: true,
				businessHours: true,
				eventLimit: true, // allow "more" link when too many events
				events: outArr,
				eventDrop : function(event) {
					/* for(items in event) {
						console.log(items);
					} */
					id = event._id;
					title = event.title;
					start = event.start.format('YYYY-MM-DD HH:mm:ss');
					console.log("Drop_id : " + id);
					console.log('Drop_title : ', title);
					console.log('Drop_start : ', start);
					//console.log('end111', event.end.toString());	
					
					if (event.end == null) {
						event.end = event.start.clone();
						event.end.set("hours", event.end.get("hours")+1);
						end = event.end.format('YYYY-MM-DD HH:mm:ss');
						console.log('Drop_end : ', end);
					} else {
						end = event.end.format('YYYY-MM-DD HH:mm:ss');
						console.log('Drop_end : ', end);
					}
					/* for(var i in results) {
						if(results[i] != null) {
							if(results[i].id == id) {
								results.splice(i, 1);
								console.log(results);
							}
						}					
					} */

					var newTemp = new createTimeTable(id, title, start, end);
					results.push(newTemp);
					console.log(results);
				}, 
				eventClick: function(event, element) {
					title = event.title;
					start = event.start.format('YYYY-MM-DD HH:mm:ss');
					end = event.end.format('YYYY-MM-DD HH:mm:ss');
					id = event._id;
					
					console.log("Click_id : " + id);
					console.log("Click_title : " + title);
					console.log("Click_start : " + start);
					console.log("Click_End : " + end);	
				},
				eventDragStart: function(event) {
					title = event.title;
					start = event.start.format('YYYY-MM-DD HH:mm:ss');
					end = event.end.format('YYYY-MM-DD HH:mm:ss');
					id = event._id;
					
					console.log("drag_id : " + id);
					console.log("drag_title : " + title);
					console.log("drag_start : " + start);
					console.log("drag_End : " + end);	
					
					/* for(var i in updates) {
						if(updates[i] != null) {
							if(updates[i].id == id) {
								updates.splice(i, 1);
								console.log(updates);
							}
						}					
					} */
					
					var update = new createTimeTable(id, title, start, end);
					updates.push(update);
					console.log(updates);
				},
				eventResizeStart : function(event, delta, revertFunc) {
					title = event.title;
					start = event.start.format('YYYY-MM-DD HH:mm:ss');
					end = event.end.format('YYYY-MM-DD HH:mm:ss');
					id = event._id;
					
					console.log("RS_id : " + id);
					console.log("RS_title : " + title);
					console.log("RS_start : " + start);
					console.log("RS_End : " + end);	
					
					/* for(var i in updates) {
						if(updates[i] != null) {
							if(updates[i].id == id) {
								updates.splice(i, 1);
								console.log(updates);
							}
						}					
					} */
					
					var update = new createTimeTable(id, title, start, end);
					updates.push(update);
					console.log(updates);
				},
				eventResize : function(event) {
					title = event.title;
					start = event.start.format('YYYY-MM-DD HH:mm:ss');
					end = event.end.format('YYYY-MM-DD HH:mm:ss');
					id = event._id;
					
					/* ArrayList<timetable> list;
					if () 
					list.add(?); */
					console.log("RE_id : " + id);
					console.log("RE_title : " + title);
					console.log("RE_start : " + start);
					console.log("RE_End : " + end);	
					
					/* for(var i in results) {
						if(results[i] != null) {
							if(results[i].id == id) {
								results.splice(i, 1);
								console.log(results);
							}
						}					
					} */
					var newTemp = new createTimeTable(id, title, start, end);
					results.push(newTemp);
					console.log(results);
				}
			});
			}
		});
		$("#updatebutton").click(function() {
			var updateStart = JSON.stringify(updates);
			var updateEnd = JSON.stringify(results);
			console.log(updates);
			console.log(results);
			<c:url value="/updateTimeTable" var="updateTimeTable"></c:url>
			var url = "${updateTimeTable}?updateStart=" + updateStart + "&updateEnd=" + updateEnd;
			location.href = url;
		})
	})
	
</script> 

</head>

<body id="page6">

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

						<li><select name="ScheduleMenu" id="ScheduleMenu">
								<optgroup label="My Info">
									<option value="register">register</option>
									<option value="modify" selected="selected">modify</option>
									<option value="show all">show all</option>
								</optgroup>
						</select></li>
					</ul>
				</fieldset>
		</article>
	</div>

	<!--==============================contents================================-->


	<!-- <div class="mainmenubg">
		<div class="main zerogrid">
			시간표 수정할 곳!!
		</div>
	</div> -->
	<br>
	<div id='calendar'></div>
	<div id = 'update'><button id = "updatebutton">수정</button></div>

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