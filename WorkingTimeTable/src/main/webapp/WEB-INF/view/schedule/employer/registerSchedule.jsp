<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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


<link href="lib/fullcalendar.css" rel='stylesheet' />
<!-- <link href='../fullcalendar.print.css' rel='stylesheet' media='print' /> -->
<script src="lib/moment.min.js"></script>
<script src="lib/jquery.min.js"></script>
<script src="lib/jquery-ui.custom.min.js"></script>
<script src="lib/fullcalendar.js"></script>

<!--------------------- SelectMenu --------------------->

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
 <!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->			<!-- 이거때메 에러남 -->
 <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>


<script>

<!--------------------- SelectMenu --------------------->
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

<!--------------------- fullCalendar --------------------->

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
		var result = new Array();

		/* initialize the external events
		-----------------------------------------------------------------*/

		$('#external-events .fc-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title: $.trim($(this).text()), // use the element's text as the event title
				stick: true // maintain when user navigates (see docs on the renderEvent method)
			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});

		});


		/* initialize the calendar
		-----------------------------------------------------------------*/

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			timeFormat: {
				'':'HH:mm',
				agenda: 'HH:mm',
				//console.log("agenda" , HH:mm)
			},
			editable: true,
			droppable: true, // this allows things to be dropped onto the calendar
			eventDrop : function(event) {
				/* for(items in event) {
					console.log(items);
				} */
				id = event._id;
				title = event.title;
				start = event.start.toString();
				console.log("Drop_id : " + id);
				console.log('Drop_title : ', title);
				console.log('Drop_start : ', start);
				//console.log('end111', event.end.toString());	
				
				if (event.end == null) {
					event.end = event.start.clone();
					event.end.set("hours", event.end.get("hours")+1);
					end = event.end.toString();
					console.log('Drop_end : ', end);
				} else {
					end = event.end.toString();
					console.log('Drop_end : ', end);
				}
				for(var i in result) {
					if(result[i] != null) {
						if(result[i].id == id) {
							result.splice(i, 1);
							console.log(result);
						}
					}					
				}

				var newTemp = new createTimeTable(id, title, start, end);
				result.push(newTemp);
				console.log(result);
			},
			eventDragStop : function(event, ui) {},
			eventResize : function(event, delta, revertFunc) {
				title = event.title;
				start = event.start.toString();
				end = event.end.toString();
				id = event._id;
				
				/* ArrayList<timetable> list;
				if () 
				list.add(?); */
				console.log("Resize_id : " + id);
				console.log("Resize_title : " + title);
				console.log("Resize_start : " + start);
				console.log("Resize_End : " + end);	
				
				for(var i in result) {
					if(result[i] != null) {
						if(result[i].id == id) {
							result.splice(i, 1);
							console.log(result);
						}
					}					
				}
				
				var newTemp = new createTimeTable(id, title, start, end);
				result.push(newTemp);
				console.log(result);
			},
			eventResizeStop : function(event) {},
			drop : function(date, ui, jsEvent) {
				console.log(date._d);
			}
		});
		console.log("title : " + title + ", start : " + start + ", End : " + end);
		
		$("#save").click(function() {
			var objstr = JSON.stringify(result);
			console.log(objstr);
			<c:url value="/addTimeTable" var="addTimeTable"></c:url>
			var url = "${addTimeTable}?list=" + objstr;
			location.href = url;
		})
		
		
	});

</script>
<style>

/* 	body {
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	} */
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
	}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		border: 1px solid #ccc;
		background: #eee;
		text-align: left;
	}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
	}
		
	#external-events .fc-event {
		margin: 10px 0;
		cursor: pointer;
	}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
	}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
	}

	#calendar {
		float: right;
		width: 900px;
	}

</style>
</head>
<body id="page6">

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
								<c:if test="${addUser.grade=='알바' }">
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
	
	
	<div class="slider-wrapper">
		<article class="col-full">
			<img src="images/logintitlebg.png">
				<fieldset>
					<ul class="lowermenu">

						<li><select name="ScheduleMenu" id="ScheduleMenu">
								<optgroup label="My Info">
									<option value="register" selected="selected">register</option>
									<option value="modify">modify</option>
									<option value="show all">show all</option>
								</optgroup>
						</select></li>
					</ul>
				</fieldset>
		</article>
	</div>
	
	<br><br><br>
	<div id='wrap'>

		<div id='external-events'>
			<h4>Draggable Events</h4>
			<div class='fc-event'>My Event 1</div>
			<div class='fc-event'>My Event 2</div>
			<div class='fc-event'>My Event 3</div>
			<div class='fc-event'>My Event 4</div>
			<div class='fc-event'>My Event 5</div>
			<p>
				<input type='checkbox' id='drop-remove' />
				<label for='drop-remove'>remove after drop</label>
			</p>
		</div>
		
		<div id='calendar'></div>
		
		<div style='clear:both'></div>

	</div>
	<div id = "save1">
		<button id = "save">save</button>
		<br><br><br>
		
		
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
							<c:url value="/index" var="url"></c:url>
							<li><a href="${url }">Home</a></li>

							<%-- 	<c:url value="/login" var="url"></c:url>
							<li><a href="${url }">Login</a></li>

								<c:url value="/join" var="url"></c:url>
							<li><a href="${url }">Join</a></li> --%>
							
							<c:url value="/contact" var="url"></c:url>
							<li><a href="${url }">Contact</a></li>
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
</div>
</body>
</html>