<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test calendar................!</title>

<link href="lib/fullcalendar.css" rel='stylesheet' />
<!-- <link href='../fullcalendar.print.css' rel='stylesheet' media='print' /> -->
<script src="lib/moment.min.js"></script>
<script src="lib/jquery.min.js"></script>
<script src="lib/jquery-ui.custom.min.js"></script>
<script src="lib/fullcalendar.js"></script>


<script>

	$(document).ready(function() {

/* 		var text = $("#chk").val();
		alert(text); */
		
		$('#calendar').fullCalendar({
		
			//defaultDate: '2015-02-12',
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: function(start, end, timezone, callback) {
				$.ajax({
					url: "<%=request.getContextPath()%>/ajax",
					success: function(result) {
						console.log(result);
						var events = [];
						$(result).find("event").each(function() {
							events.push({
								title: $(this).attr('title'),
								start: $(this).attr('start'),
								end: $(this).attr('end')
							});
						});
						callback(events);
					}
				});
			}
			
			
			
			/* 	events: [
			          {
			        	 title : 
				
					} 
			         
			         
			         
			         
			         ] */
       
			         
			         
				/* {
					title: 'All Day Event',
					start: '2015-02-01'
				},
				{
					title: 'Long Event',
					start: '2015-02-07',
					end: '2015-02-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2015-02-11',
					end: '2015-02-13'
				},
				{
					title: 'Meeting',
					start: '2015-02-12T10:30:00',
					end: '2015-02-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2015-02-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2015-02-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2015-02-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2015-02-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2015-02-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2015-02-28'
				}
			] */
		});
		
	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>
	<div id='calendar'></div>
	<table>
		<c:forEach items="${Calendar}" var = "calen">
		<tr>
			<td><c:out value="${calen.title}"/></td>
			<td><c:out value="${calen.timeStart}"/></td>
			<td><c:out value="${calen.timeEnd}"/></td>
			<td><input type = "hidden" id = "chk" name = "chk" 
									value = "{
											title: ${calen.title},
											start: ${calen.timeStart},
											end:   ${calen.timeEnd}
											}"/></td>
			
		</tr>
	</c:forEach>
	</table>
</body>
</html>