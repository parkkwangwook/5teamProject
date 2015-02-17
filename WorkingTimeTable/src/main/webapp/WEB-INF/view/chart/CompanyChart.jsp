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
		height: 600px; 
	}	
</style>
<script type="text/javascript">

	$(document).ready(function() {
        var seriesData = new Array();			// Series에 저장할 내용 name, data
        var tempArr = new Array();				// 직원별 저장할 임시 Data 배열.
        var dataArr = new Array();				// series에 저장할 Data 배열.
        var name = new Array();					// 직원 이름 저장할 배열.
        var count = 0;							// 배열의 Count.
        var outArr = new Array();				// Json을 저장할 배열.
        var nameArr = new Array();				// Json에서 이름만 추출하여 저장할 배열.
        var Xcategorie = new Array();			// categorie의 x축 이름.
		$('#chartBtn').on('click',function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/ajaxChart",   
                type:'POST',
                success:function(data){
                   alert("확인 데이터 : " + data);

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
					alert(name);
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
				/* legend: {
					//enabled: false <-- 원래 이것만 있었음...!
		            align: 'right',
		            x: -70,
		            verticalAlign: 'top',
		            y: 20,
		            floating: true,
		            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
		            borderColor: '#CCC',
		            borderWidth: 1,
		            shadow: false
				}, */
				/* 나의 월급현황 관리 tooltip. 
				tooltip: {
					//pointFormat: '{series.name}: <b>{point.y:.1f}원 </b>',
		            formatter: function () {
		                return '<b>' + this.x + '</b><br/>' +
		                    this.series.name + ': ' + this.y + '<br/>' +
		                    'Total: ' + this.point.stackTotal;
		            }
				}, */
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
			});
		});
			
    	
  	</script>
	</head>
<body>
<script src="chartlib/highcharts.js"></script>
<script src="chartlib/highcharts-3d.js"></script>
<script src="chartlib/exporting.js"></script>
<button id="chartBtn">직원 월급 조회하기</button>

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
