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
#container, #sliders {
	min-width: 310px; 
	max-width: 800px;
	margin: 0 auto;
}
	
#container {
	height: 600px; 
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
	
	$(document).ready(function() {
        var seriesData = new Array();			// Series에 저장할 내용 name, data
        var tempArr = new Array();				// 직원별 저장할 임시 Data 배열.
        var dataArr = new Array();				// series에 저장할 Data 배열.
        var name = new Array();					// 직원 이름 저장할 배열.
        var count = 0;							// 배열의 Count.
        var outArr = new Array();				// Json을 저장할 배열.
        var nameArr = new Array();				// Json에서 이름만 추출하여 저장할 배열.
        var Xcategorie = new Array();			// categorie의 x축 이름.
		//$('#chartBtn').on('click',function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/ajaxCompanyChart",   
                type:'POST',
                success:function(data){
                   //alert("확인 데이터 : " + data);

    				var jobj = JSON.parse(data);   
    				var e = jobj["charts"];
                    $(e).each(function(index, item){
                    	//alert(item);
                        var inArr = new Array();
                        inArr.push(item.month);					// x 축 결정...!
                        inArr.push(item.count);					// y 축 결정....!
                        inArr.push(item.memberId);
                       	//alert("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ : " + inArr);
                        outArr.push(inArr);
                    });
                    

                    console.log(outArr);
                    console.log(outArr[0]);
                    //차트를 뿌리는 코드.
					console.log("------------OutArr-------------");
                    for(var i in outArr) {

                    	console.log(i + " , " + outArr[i][0]);
                    	nameArr.push(outArr[i][2]);
                    }
                	console.log("------------nameArr-------------");
                    for(var j in nameArr) {
                    	console.log(j + " , " + nameArr[j]);
                    }

                    /* series 만들기....  */
					name.push(nameArr[0]);			// 첫 이름 저장.
					//alert(name);
                    for (var a in outArr) {
                    	// 이름 저장...!
                    	if(name[count] == outArr[a][2]) {
                    		console.log("if : " + a);
	                    	tempArr.push(outArr[a][1]);
                    	} else if (name[count] != outArr[a][2]){
                    		console.log("a : " + a);
                    		dataArr.push(tempArr);
                    		seriesData.push({name:name[count], data:dataArr[count]});
                    		tempArr = new Array();
	                    	tempArr.push(outArr[a][1]);
                    		count++;
                    		name.push(outArr[a][2]);
                    	}
                    }
                    dataArr.push(tempArr);
            		seriesData.push({name:name[count], data:dataArr[count]});
					console.log("------------seriesData-------------");
					console.log(seriesData);
                    
					/* categories의 x축 설정. */
					Xcategorie.push(outArr[0][0]);		// 초기값 설정.
					for (var idx in outArr) {
						if(Xcategorie != outArr[idx][0]) {
							Xcategorie.push(outArr[idx][0]);							
						}
					}
					
			//$('#container').highcharts({
		$(function () {
			var chart = new Highcharts.Chart({
				
				chart : {
					renderTo: 'container',
					type: 'column',
					margin: 75,
					options3d: {
						enabled: true,
			       		alpha: 15,
			        	beta: 15,
			        	depth: 50,
			        	viewDistance: 25
					}
		        },
				title: {
	                text: '직원 급여 관리'
				},
				subtitle: {
					text: 'ARUBA Program.....! By.MALSIKIZIMA'
				},
				xAxis: {
					categories: Xcategorie
				},
				yAxis: {
					min: 0,
					labels: {
						formatter: function() {
							return this.value;
						}
					},
                    title: {
						text: '금액'
					},
					stackLabels: {
						enabled: true,
						style: {
							fontWeight: 'bold',
							color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                    
						}
					}
				},
				tooltip: {
		       	 	backgroundColor: 'white',
		       	    borderColor: 'gray',
		       	    borderRadius: 10,
		       	    borderWidth: 2,
		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
		                 + '<td style="padding:0"><b>{point.y:.f}원</b></td></tr>',
		            footerFormat: '</table>',
		            /* total을 출력하고 싶다. 모르겠다, 나중에 */
		            shared: true,
		            useHTML: true
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.2,
		                borderWidth: 0,
		                depth: 25,
		                stacking: 'normal',
		                dataLabels: {
		                    enabled: true,
		                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
		                    style: {
		                        textShadow: '0 0 3px black, 0 0 3px black'
		                    }
		                }
		            }
		        },
				series: seriesData
			});
				/*알파 베타 각도로 그래프를 움직일 수 있는 부분 */
				function showValues() {
			        $('#R0-value').html(chart.options.chart.options3d.alpha);
			        $('#R1-value').html(chart.options.chart.options3d.beta);
			    }
				
				
				 $('#R0').on('change', function () {
				 	chart.options.chart.options3d.alpha = this.value;
					showValues();
				 	chart.redraw(false);
				 });
				 $('#R1').on('change', function () {
				 	chart.options.chart.options3d.beta = this.value;
				 	showValues();
				 	chart.redraw(false);
				 });
				 showValues();
				});
			}
		});
	//});
});
	
</script> 
<script src="chartlib/highcharts.js"></script>
<script src="chartlib/highcharts-3d.js"></script>
<script src="chartlib/exporting.js"></script>

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
									<option value="wage" selected="selected">employee's salary</option>
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


	<!-- <div class="mainmenubg">
		<div class="main zerogrid">
			사장의 급여관리~~~~
		</div>
	</div> -->
	<br>
	<!-- <button id="chartBtn">직원 월급 조회하기</button> -->
	<!-- 그래프 -->
	<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	
	<!-- 각도조절 바 -->
	<div id="sliders">
		<table>
			<tr><td>Alpha Angle</td><td><input id="R0" type="range" min="0" max="45" value="15"/> <span id="R0-value" class="value"></span></td></tr>
		    <tr><td>Beta Angle</td><td><input id="R1" type="range" min="0" max="45" value="15"/> <span id="R1-value" class="value"></span></td></tr>
		</table>
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