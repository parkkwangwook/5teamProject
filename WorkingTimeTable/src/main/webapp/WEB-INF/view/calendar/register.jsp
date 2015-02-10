<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="lib/fullcalendar.css" rel='stylesheet' />
<!-- <link href='../fullcalendar.print.css' rel='stylesheet' media='print' /> -->
<script src="lib/moment.min.js"></script>
<script src="lib/jquery.min.js"></script>
<script src="lib/jquery-ui.custom.min.js"></script>
<script src="lib/fullcalendar.js"></script>

<%-- <!--------------------- SelectMenu --------------------->

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
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
}); --%>

<script>
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
			<c:url value="/addTimeTable" var="addTimeTable"></c:url>
			var url = "${addTimeTable}?list" + result;
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
<body>
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
</div>
</body>
</html>