<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ARUBA..★</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<style type="text/css">
		
	#container, #sliders {
		min-width: 310px; 
		max-width: 800px;
		margin: 0 auto;
	}
		
	#container {
		height: 400px; 
	}	
</style>
<script type="text/javascript">
	$(document).ready(function(){
        var outArr = new Array();
		$('#chartBtn').on('click',function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/ajaxChart",   
                type:'POST',
                success:function(data){
                   alert("zzzzzzzzzzzz" + data);

    				var jobj = JSON.parse(data);   
    				var e = jobj["charts"];
                    $(e).each(function(index, item){
                        var inArr = new Array();
                        inArr.push(item.month);
                        inArr.push(item.count);
                        inArr.push(item.memberId);
                       	alert("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ : " + inArr);
                        outArr.push(inArr);
                    });
                    console.log(outArr);
                    console.log(outArr[0]);
                    //차트를 뿌리는 코드.
                    for(var i in outArr) {
                    	console.log(i + " , " + outArr[i][0]);
                    }
					
                    
		$('#container').highcharts({
			chart: {
				type: 'column'
				},
				title: {
	                text: '그 동안 근무별 월급 통계'
				},
				subtitle: {
					text: 'ARUBA Program.....! By.MALSIKIZIMA'
				},
				xAxis: {
					type: 'category',
					labels: {
						rotation: -45,
						align: 'right',
						style: {
						fontSize: '13px',
						fontFamily: 'Verdana, sans-serif'
						}
					}
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
				legend: {
					enabled: false
				},
				tooltip: {
					pointFormat: '{series.name}: <b>{point.y:.1f}원 </b>',
				},
				series: [{
					name: outArr[0][2],
					data: outArr,
                    dataLabels: {
						enabled: true,
						rotation: -90,
						color: '#FFFFFF',
						align: 'right',
						x: 4,
						y: 10,
						style: {
							fontSize: '13px',
							fontFamily: 'Verdana, sans-serif',
							textShadow: '0 0 3px black'
						}
					}
				}]
			});
		}
	});
});

	
	
	/* 알파 베타 각도로 그래프를 움직일 수 있는 부분 */
	/* function showValues() {
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

	 showValues(); */
});

    	
  	</script>
	</head>
<body>
<script src="chartlib/highcharts.js"></script>
<script src="chartlib/highcharts-3d.js"></script>
<script src="chartlib/exporting.js"></script>
<button id="chartBtn">한달 접속자 그래프 보기</button>

<!-- 그래프 -->
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>



<!-- 각도조절 바 -->
<div id="sliders">
	<table>
		<tr><td>Alpha Angle</td><td><input id="R0" type="range" min="0" max="45" value="15"/> <span id="R0-value" class="value"></span></td></tr>
	    <tr><td>Beta Angle</td><td><input id="R1" type="range" min="0" max="45" value="15"/> <span id="R1-value" class="value"></span></td></tr>
	</table>
</div>
	</body>
</html>
