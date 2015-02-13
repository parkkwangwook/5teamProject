<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
            text: '서브 타이틀 넣깅'
        },
        xAxis: {
        	 
        /* 	x축
        	 최근 6개월 뽑아오기 */ 
        	 
       	/* 방법1.  카테고리 배열에 넣기 */
            categories: [                     
                '1월',
                '2월',
                '3월',
                '4월',
                '5월',
                '6월'
            ] 
        
        /* 방법2. 이거쓰면 1월부터 차례로 나옴, data 개수 따라서, 영어로 Jan, Feb,.. */
		/* categories: Highcharts.getOptions().lang.shortMonths */
        },
        
        
        yAxis: {
			
        	/* K단위 없애기 */
        	
        	labels: {
                formatter: function() {
                    return this.value;
                }
            },
        	
        	
            min: 0,
            title: {
                text: '금액'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'                    
                },
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
        
 		/* 	급여 데이터 넣기 */
        series: [{
            name: '박광욱',
            data: [1230000, 456100, 456123, 500000, 100000, 455555]

        }, {
            name: '김연준',
            data: [456123, 123456, 100000, 454512, 100456, 800000]

        }, {
            name: '유지연',
            data: [333333, 444444, 555555, 666666, 777777, 456789]

        }, {
            name: '최정인',
            data: [789456, 456123, 500000, 120000, 330000, 100000]

        }, {
            name: '유령',
            data: [100000, 100000, 500000, 120000, 330000, 100000]

        }]
        
    });
	
	
	

	
	/* 알파 베타 각도로 그래프를 움직일 수 있는 부분 */
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
	</script>
	</head>
	<body>
<script src="js/highcharts.js"></script>
<script src="js/highcharts-3d.js"></script>
<script src="js/modules/exporting.js"></script>

<div id="container" style="min-width: 400px; height: 600px; margin: 0 auto"></div>

<!-- 조잡하면 넣지말기 -->
<!-- <div id="sliders">
	<table>
		<tr><td>Alpha Angle</td><td><input id="R0" type="range" min="0" max="45" value="15"/> <span id="R0-value" class="value"></span></td></tr>
	    <tr><td>Beta Angle</td><td><input id="R1" type="range" min="0" max="45" value="15"/> <span id="R1-value" class="value"></span></td></tr>
	</table>
</div> -->
	</body>
</html>
