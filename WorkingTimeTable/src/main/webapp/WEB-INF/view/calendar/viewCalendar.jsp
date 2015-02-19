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
			url: "<%=request.getContextPath()%>/ajaxs",
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
	<div id = 'update'><button id = "updatebutton">수정</button></div>
</body>
</html>